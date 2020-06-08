package riscv;

import llvm_IR.instruction.StoreInst;
import riscv.instruction.RvInstruction;
import riscv.instruction.RvLoadInst;
import riscv.instruction.RvMoveInst;
import riscv.instruction.RvStoreInst;
import riscv.operand.RegisterList;
import riscv.operand.RvPhyReg;
import riscv.operand.RvRegister;
import riscv.operand.spSlot;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Stack;

public class RegAlloca {
    private RvModule module;
    private static int INF = 0x3f3f3f3f;
    private int K;
    private HashSet<edge> adjSet;

    private LinkedHashSet<RvRegister> precolored;
    private HashSet<RvRegister> initial;
    private LinkedHashSet<RvRegister> simplifyWorkList;
    private LinkedHashSet<RvRegister> freezeWorkList;
    private LinkedHashSet<RvRegister> spillWorkList;
    private HashSet<RvRegister> spilledNodes;
    private HashSet<RvRegister> coalescedNodes;
    private HashSet<RvRegister> coloredNodes;
    private Stack<RvRegister> selectStack;
    private HashSet<RvMoveInst> coalescedMoves;
    private HashSet<RvMoveInst> constrainedMoves;
    private HashSet<RvMoveInst> frozenMoves;
    private LinkedHashSet<RvMoveInst> workListMoves;
    private HashSet<RvMoveInst> activeMoves;

    private static class edge{
        private RvRegister u, v;
        public edge(RvRegister u, RvRegister v){
            this.u = u;
            this.v = v;
        }

        public boolean equals(Object other){
            return(other instanceof edge) && u.equals(((edge)other).u) && v.equals(((edge)other).v);
        }

        public int hashCode(){
            return u.hashCode() ^ v.hashCode();
        }
    }


    private void addedge(RvRegister u, RvRegister v){
        if(!u.equals(v) && !adjSet.contains(new edge(u, v))){
            adjSet.add(new edge(u, v));
            adjSet.add(new edge(v, u));
            if(!(u instanceof RvPhyReg)){
                u.addAdjReg(v);
                u.addDegree();
            }
            if(!(v instanceof RvPhyReg)){
                v.addAdjReg(u);
                v.addDegree();
            }
        }
    }

    public RegAlloca(RvModule module){
        this.module = module;
        this.K = RegisterList.allocableNumber;
    }

    public void run(){
        ArrayList<RvFunction> functList = module.getFunctList();
        for(var funct : functList){
            //System.out.println(2);
            while(true){
                init(funct);
                LA(funct);
                build(funct);
                makeWorkList();
                while(!simplifyWorkList.isEmpty() || !workListMoves.isEmpty()
                   || !freezeWorkList.isEmpty() || !spillWorkList.isEmpty()){
                    if(!simplifyWorkList.isEmpty()) simplify();
                    else if(!workListMoves.isEmpty()) coalesce();
                    else if(!freezeWorkList.isEmpty()) freeze();
                    else if(!spillWorkList.isEmpty()) selectSpill();
                }
                assignColors();
                if(spilledNodes.isEmpty()) break;
                else rewriteProgram(funct);
            }
            removeRedundantMoves(funct);
            stackSlotAlloca(funct);
            peephole(funct);
        }
    }

    public void init(RvFunction function){
        adjSet = new HashSet<>();
        precolored = new LinkedHashSet<>();
        initial = new HashSet<>();
        simplifyWorkList = new LinkedHashSet<>();
        freezeWorkList = new LinkedHashSet<>();
        spillWorkList = new LinkedHashSet<>();
        spilledNodes = new HashSet<>();
        coalescedNodes = new HashSet<>();
        coloredNodes = new HashSet<>();
        selectStack = new Stack<>();
        coalescedMoves = new HashSet<>();
        constrainedMoves = new HashSet<>();
        frozenMoves = new HashSet<>();
        workListMoves = new LinkedHashSet<>();
        activeMoves = new HashSet<>();

        ArrayList<RvRegister> regList = function.getRegList();
        for(var reg : regList){
            reg.clearColor();
            if(!reg.isSpilled())
                initial.add(reg);
        }

        for(int i=0; i<32; ++i)
            RegisterList.register[i].setDegree(INF);
    }

    public void build(RvFunction function){
        ArrayList<RvBBlock> bblockList = function.getBBlockList();
        for(var bblock : bblockList){
            HashSet<RvRegister> liveOutList = new HashSet<>(bblock.getLiveOutList());
            RvInstruction Inst = bblock.getRear();
            while(Inst != null){
                HashSet<RvRegister> usedList = Inst.getUsedList();
                HashSet<RvRegister> defList = Inst.getDefList();
                if(Inst instanceof RvMoveInst){
                    liveOutList.removeAll(usedList);
                    HashSet<RvRegister> tmpList = new HashSet<>(usedList);
                    tmpList.addAll(defList);
                    for(var tmp :tmpList)
                        tmp.addMoveInst((RvMoveInst)Inst);
                    workListMoves.add((RvMoveInst)Inst);
                }
                liveOutList.add(RegisterList.zero);
                for(var def : defList){
                    for(var live : liveOutList)
                        addedge(def, live);
                }
                liveOutList.removeAll(defList);
                liveOutList.addAll(usedList);
                Inst = Inst.getPrev();
            }
        }
    }

    public void LA(RvFunction function){
        ArrayList<RvBBlock> bblockList = function.dfs();
        for(var bblock : bblockList){
            bblock.clearDefUsed();
            bblock.clearLive();
            RvInstruction Inst = bblock.getHead();
            while(Inst != null){
                LinkedHashSet<RvRegister> usedList = new LinkedHashSet<>(Inst.getUsedList());
                LinkedHashSet<RvRegister> defList = Inst.getDefList();
                usedList.removeAll(bblock.getDefList());
                bblock.addUsed(usedList);
                bblock.addDef(defList);
                Inst = Inst.getNext();
            }
        }
        boolean change = true;
        while(change){
            change = false;
            for(int i=bblockList.size()-1; i>=0; --i){
                RvBBlock bblock = bblockList.get(i);
                HashSet<RvRegister> InList = bblock.getLiveInList();
                HashSet<RvRegister> OutList = bblock.getLiveOutList();
                HashSet<RvRegister> liveOutList = new HashSet<>();
                HashSet<RvRegister> liveInList = new HashSet<>(OutList);
                liveInList.removeAll(bblock.getDefList());
                liveInList.addAll(bblock.getUsedList());
                for(var succBBlock : bblock.getSuccBBlock()){
                    liveOutList.addAll(succBBlock.getLiveInList());
                }
                if(!liveInList.equals(InList)){
                    bblock.setLiveInList(liveInList);
                    change = true;
                }
                if(!liveOutList.equals(OutList)){
                    bblock.setLiveOutList(liveOutList);
                    change = true;
                }
            }
        }
    }

    public void makeWorkList(){
        for(var init : initial){
            if(init.getDegree() >= K)
                spillWorkList.add(init);
            else if(moveRelated(init))
                freezeWorkList.add(init);
            else
                simplifyWorkList.add(init);
        }
        initial.clear();
    }

    public HashSet<RvRegister> adjacent(RvRegister register){
        HashSet<RvRegister> res = new HashSet<>(register.getAdjRegList());
        res.removeAll(selectStack);
        res.removeAll(coalescedNodes);
        return res;
    }

    public HashSet<RvMoveInst> nodeMoves (RvRegister register){
        HashSet<RvMoveInst> res = new HashSet<>(activeMoves);
        res.addAll(workListMoves);
        res.retainAll(register.getMoveInstList());
        return res;
    }

    public boolean moveRelated(RvRegister register){
        return !nodeMoves(register).isEmpty();
    }

    public void simplify(){
        RvRegister register = simplifyWorkList.iterator().next();
        simplifyWorkList.remove(register);
        selectStack.push(register);
        HashSet<RvRegister> adjList = adjacent(register);
        for(var adj : adjList)
            decreaseDegree(adj);
    }

    public void decreaseDegree(RvRegister register){
        register.subDegree();
        if(register.getDegree() == K-1){
            HashSet<RvRegister> adjList = adjacent(register);
            adjList.add(register);
            enableMoves(adjList);
            spillWorkList.remove(register);
            if(moveRelated(register))
                freezeWorkList.add(register);
            else
                simplifyWorkList.add(register);
        }
    }

    public void enableMoves(HashSet<RvRegister> regList){
        for(var reg : regList){
            HashSet<RvMoveInst> moveList = nodeMoves(reg);
            for(var move : moveList){
                if(activeMoves.contains(move)){
                    activeMoves.remove(move);
                    workListMoves.add(move);
                }
            }
        }
    }

    public void addWorkList(RvRegister register){
        if(!(register instanceof RvPhyReg) && !moveRelated(register) && register.getDegree() < K){
            freezeWorkList.remove(register);
            simplifyWorkList.add(register);
        }
    }

    public boolean OK(RvRegister t, RvRegister r){
        return t.getDegree() < K || t instanceof RvPhyReg || adjSet.contains(new edge(t, r));
    }

    public boolean forAllOk(RvRegister t, RvRegister r){
        HashSet<RvRegister> adjList = adjacent(r);
        for(var adj : adjList){
            if(!OK(adj, t))
                return false;
        }
        return true;
    }

    public boolean conservative(RvRegister t, RvRegister r){
        HashSet<RvRegister> adjList = adjacent(t);
        adjList.addAll(adjacent(r));
        int k = 0;
        for(var adj : adjList){
            if(adj.getDegree() >= K)
                ++k;
        }
        return k < K;
    }

    public void coalesce(){
        RvMoveInst moveInst = workListMoves.iterator().next();
        RvRegister u = getAlias(moveInst.getRd());
        RvRegister v = getAlias(moveInst.getRs());
        if(v instanceof RvPhyReg){
            RvRegister tmp = v;
            v = u;
            u = tmp;
        }
        workListMoves.remove(moveInst);
        if(u.equals(v)){
            coalescedMoves.add(moveInst);
            addWorkList(u);
        }
        else if(v instanceof RvPhyReg || adjSet.contains(new edge(u, v))){
            constrainedMoves.add(moveInst);
            addWorkList(u);addWorkList(v);
        }
        else if((u instanceof RvPhyReg && forAllOk(u, v)) || (!(u instanceof RvPhyReg) && conservative(u, v))){
            coalescedMoves.add(moveInst);
            combine(u, v);
            addWorkList(u);
        }
        else
            activeMoves.add(moveInst);
    }

    public void combine(RvRegister u, RvRegister v){
        if(freezeWorkList.contains(v))
            freezeWorkList.remove(v);
        else
            spillWorkList.remove(v);
        coalescedNodes.add(v);
        v.setAlias(u);
        u.getMoveInstList().addAll(v.getMoveInstList());
        HashSet<RvRegister> nodeList = new HashSet<>();
        nodeList.add(v);
        enableMoves(nodeList);
        HashSet<RvRegister> adjList = adjacent(v);
        for(var adj : adjList){
            addedge(adj, u);
            decreaseDegree(adj);
        }
        if(u.getDegree() >= K && freezeWorkList.contains(u)){
            freezeWorkList.remove(u);
            spillWorkList.add(u);
        }
    }

    public RvRegister getAlias(RvRegister register){
        if(coalescedNodes.contains(register))
            return getAlias(register.getAlias());
        else
            return register;
    }

    public void freeze(){
        RvRegister u = freezeWorkList.iterator().next();
        freezeWorkList.remove(u);
        simplifyWorkList.add(u);
        freezeMoves(u);
    }

    public void freezeMoves(RvRegister u){
        HashSet<RvMoveInst> moveList = nodeMoves(u);
        for(var move : moveList){
            RvRegister rd = move.getRd();
            RvRegister rs = move.getRs();
            RvRegister v;
            if(getAlias(rs).equals(getAlias(u)))
                v = getAlias(rd);
            else
                v = getAlias(rs);
            activeMoves.remove(move);
            frozenMoves.add(move);
            if(freezeWorkList.contains(v) && nodeMoves(v).isEmpty()){
                freezeWorkList.remove(v);
                simplifyWorkList.add(v);
            }
        }
    }

    public void selectSpill(){
        RvRegister register = null;
        for(var reg : spillWorkList){
            if(register == null || reg.getSpill() < register.getSpill())
                register = reg;
        }
        spillWorkList.remove(register);
        simplifyWorkList.add(register);
        freezeMoves(register);
    }

    public void assignColors(){
        while(!selectStack.isEmpty()){
            RvRegister u = selectStack.pop();
            HashSet<RvPhyReg> okColors = new HashSet<>(RegisterList.allocableSet);
            LinkedHashSet<RvRegister> adjList = u.getAdjRegList();
            for(var adj : adjList){
                RvRegister alias = getAlias(adj);
                if(alias instanceof RvPhyReg || coloredNodes.contains(alias))
                    okColors.remove(alias.getIsPhyReg());
            }
            if(okColors.isEmpty())
                spilledNodes.add(u);
            else{
                u.setIsPhyReg(okColors.iterator().next());
                coloredNodes.add(u);
            }
        }
        for(var u : coalescedNodes)
            u.setIsPhyReg(getAlias(u).getIsPhyReg());
    }

    public void rewriteProgram(RvFunction function){
        for(var reg : spilledNodes){
            spSlot slot = new spSlot(0, 1);
            function.addSpillSlot(slot);
            HashSet<RvInstruction> defList = new HashSet<>(reg.getDefList());
            for(var def : defList){
                RvRegister spill = function.newVirReg("spill");
                def.replaceDefInst(reg, spill);
                RvBBlock bblock = def.getCurBBlock();
                bblock.addNext(def, new RvStoreInst(bblock, spill, slot, null));
            }
            HashSet<RvInstruction> usedList = new HashSet<>(reg.getUsedList());
            for(var used : usedList){
                RvRegister spill = function.newVirReg("spill");
                used.replaceUsedInst(reg, spill);
                RvBBlock bblock = used.getCurBBlock();
                bblock.addPrev(used, new RvLoadInst(bblock, spill, slot, null));
            }
            reg.setSpilled();
        }
    }

    public void removeRedundantMoves(RvFunction function){
        ArrayList<RvBBlock> bblockList = function.getBBlockList();
        for(var bblock : bblockList){
            ArrayList<RvMoveInst> moveList = bblock.getMoveInst();
            for(var move : moveList){
                if(move.getRd().getIsPhyReg() == move.getRs().getIsPhyReg()){
                    bblock.removeInst(move);
                    move.removeAllDef();
                    move.removeAllUsed();
                }
            }
        }
    }

    public void peephole(RvFunction function){
        ArrayList<RvBBlock> bblockList = function.getBBlockList();
        for(var bblock : bblockList){
            ArrayList<RvLoadInst> loadList = bblock.getLoadList();
            for(var load : loadList){
                RvInstruction storeInst = load.getPrev();
                if(storeInst != null && storeInst instanceof RvStoreInst && load.check((RvStoreInst)storeInst)){
                    RvMoveInst moveInst = new RvMoveInst(bblock, load.getRd(), ((RvStoreInst) storeInst).getRd());
                    bblock.replaceInst(load, moveInst);
                }
            }
        }
    }

    public void stackSlotAlloca(RvFunction function){
        ArrayList<RvBBlock> bblockList = function.getBBlockList();
        int k = function.spSlotAlloca(), cnt = 1;
        for(RvBBlock bblock : bblockList){
            RvInstruction Inst = bblock.getHead();
            while(Inst != null){
                if(Inst instanceof RvLoadInst){
                    spSlot slot = ((RvLoadInst)Inst).getSpSlot();
                    if(slot != null){
                        if(slot.getCall() == 1){
                            slot.setIndex((k-cnt)<<2);
                            cnt++;
                        }
                        else if(slot.getCall() == 2)
                            slot.addIndex(k);
                    }
                }
                if(Inst instanceof RvStoreInst){
                    spSlot slot = ((RvStoreInst)Inst).getSpSlot();
                    if(slot != null){
                        if(slot.getCall() == 1){
                            slot.setIndex((k-cnt)<<2);
                            cnt++;
                        }
                        else if(slot.getCall() == 2)
                            slot.addIndex(k);
                    }
                }
                Inst = Inst.getNext();
            }
        }

    }
}
