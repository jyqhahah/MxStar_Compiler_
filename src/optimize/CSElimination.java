package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.*;
import llvm_IR.operand.*;
import llvm_IR.type.BinOpType;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IcmpType;
import utility.Pair;

import java.util.*;

public class CSElimination extends PASS {
    private boolean isChanged;
    private ArrayList<IRInstruction> removeList;
    private ArrayList<register> replaceList;
    private HashMap<IRInstruction, cseExpr> exprMap;
    private HashMap<cseExpr, Stack<Pair<IRInstruction, register>>> stackMap;
    //for alias analysis
    private Queue<pointer> pointerQueue;
    private HashSet<pointer> inQueue;
    private HashMap<register, pointer> regPointerMap;

    public CSElimination(IRModule irModule) {
        super(irModule);
    }

    public boolean run(){
        init();
        addConstraint();
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            elimination(entry.getValue());
        }
        return isChanged;
    }

    public void init(){
        isChanged = false;
        pointerQueue = new LinkedList<>();
        inQueue = new HashSet<>();
        regPointerMap = new HashMap<>();
        LinkedHashMap<String, string> strList = irModule.getStringList();
        for(var entry : strList.entrySet()){
            pointer ptr = new pointer(entry.getValue().getIdentifier());
            ptr.dest.add(new pointer(entry.getValue().getIdentifier()+".address"));
            regPointerMap.put(entry.getValue(), ptr);
        }
        LinkedHashMap<String, variable> varList = irModule.getVarList();
        for(var entry : varList.entrySet()){
            pointer ptr = new pointer(entry.getValue().getIdentifier());
            ptr.dest.add(new pointer(entry.getValue().getIdentifier()+".address"));
            regPointerMap.put(entry.getValue(), ptr);
        }
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            IRFunction funct = entry.getValue();
            ArrayList<register> paraList = funct.getParas();
            for(var para : paraList){
                if(para.getType() instanceof IRPointerType)
                    regPointerMap.put(para, new pointer(para.getIdentifier()));
            }
            ArrayList<IRBBlock> bblockList = funct.getBBlockArray();
            for(var bblock : bblockList){
                IRInstruction Inst = bblock.getHead();
                while(Inst != null){
                    register reg = Inst.getRes();
                    if(reg != null && reg.getType() instanceof IRPointerType)
                        regPointerMap.put(reg, new pointer(reg.getIdentifier()));
                    Inst = Inst.getNext();
                }
            }
        }
    }

    public void elimination(IRFunction function){
        removeList = new ArrayList<>();
        replaceList = new ArrayList<>();
        exprMap = new HashMap<>();
        stackMap = new HashMap<>();
        eliminationBBlock(function.getEntryBBlock());

        if(removeList.size() > 0) isChanged = true;
        for(int i=0; i<removeList.size(); ++i){
            IRInstruction Inst =removeList.get(i);
            register replace = replaceList.get(i);
            register reg = Inst.getRes();
            HashSet<IRInstruction> usedList = reg.getUsedInstruction();
            for(var used : usedList)
                used.replaceUsedInst(reg, replace);
            Inst.removeAll();
        }
    }

    public cseExpr getCommutation(cseExpr expr){
        if(expr.op == cseOp.sgt)      return new cseExpr(cseOp.slt, expr.operandList.get(1), expr.operandList.get(0), null);
        else if(expr.op == cseOp.slt) return new cseExpr(cseOp.sgt, expr.operandList.get(1), expr.operandList.get(0), null);
        else if(expr.op == cseOp.sge) return new cseExpr(cseOp.sle, expr.operandList.get(1), expr.operandList.get(0), null);
        else if(expr.op == cseOp.sle) return new cseExpr(cseOp.sge, expr.operandList.get(1), expr.operandList.get(0), null);
        else                          return new cseExpr(expr.op  , expr.operandList.get(1), expr.operandList.get(0), null);
    }

    public void eliminationBBlock(IRBBlock bblock){
        ArrayList<IRInstruction> InstList = bblock.getInstList();
        for(var Inst : InstList){
            cseExpr expr = getCseExpr(Inst);
            if(expr == null) continue;
            Stack<Pair<IRInstruction, register>> stack = null;
            if(stackMap.containsKey(expr))
                stack = stackMap.get(expr);
            else if(expr.op.isCommutable){
                cseExpr com_expr = getCommutation(expr);
                if(stackMap.containsKey(com_expr)){
                    stack = stackMap.get(com_expr);
                    expr = com_expr;
                }
            }
            exprMap.put(Inst, expr);
            register reg = Inst.getRes();
            if(stack == null){
                stack = new Stack<>();
                stack.add(new Pair<>(Inst, reg));
                stackMap.put(expr, stack);
            }
            else if(stack.isEmpty()) stack.add(new Pair<>(Inst ,reg));
            else{
                Pair<IRInstruction, register> peek = stack.peek();
                IRInstruction rear = peek.first; register replace = peek.second;
                if(Inst instanceof LoadInst){
                    if(hasAlias(Inst,(register)((LoadInst) Inst).getPtr(), (LoadInst)rear, new HashSet<>())){
                        removeList.add(Inst);
                        replaceList.add(replace);
                        stack.push(new Pair<>(Inst, replace));
                    }
                    else
                        stack.push(new Pair<>(Inst, reg));
                }
                else{
                    removeList.add(Inst);
                    replaceList.add(replace);
                    stack.push(new Pair<>(Inst, replace));
                }
            }
        }
        ArrayList<IRBBlock> domiList = bblock.getDominateList();
        for(var domi : domiList)
            eliminationBBlock(domi);
        for(var Inst : InstList)
            if(exprMap.containsKey(Inst))
                stackMap.get(exprMap.get(Inst)).pop();
    }

    public boolean hasAlias(IRInstruction Inst, register ptr, LoadInst load, HashSet<IRInstruction>visited){
        if(visited.contains(Inst) || Inst == load) return true;
        if(Inst instanceof StoreInst && preAlias(ptr, (register)((StoreInst) Inst).getPtr())) return false;
        if(Inst instanceof CallInst && !irModule.getBuiltInFunctList().containsValue(((CallInst) Inst).getFunct())) return false;
        visited.add(Inst);
        if(Inst.getPrev() != null)
            return hasAlias(Inst.getPrev(), ptr, load, visited);
        ArrayList<IRBBlock> prevBBlocks = Inst.getCurBBlock().getPrevBBlock();
        for(var prev : prevBBlocks){
            if(!hasAlias(prev.getRear(), ptr, load, visited))
                return false;
        }
        return true;
    }

    public boolean preAlias(register u, register v){
        if(u == v) return true;
        if(u instanceof string || v instanceof string) return false;
        if(!u.getType().toString().equals(v.getType().toString())) return false;
        return !Collections.disjoint(regPointerMap.get(u).dest, regPointerMap.get(v).dest);
    }

    public cseExpr getCseExpr(IRInstruction Inst){
        if(Inst instanceof BinOpInst){
            BinOpType bi_op = ((BinOpInst) Inst).getType();
            if(bi_op == BinOpType.add) return new cseExpr(cseOp.add, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.sub) return new cseExpr(cseOp.sub, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.mul) return new cseExpr(cseOp.mul, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.sdiv) return new cseExpr(cseOp.sdiv, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.srem) return new cseExpr(cseOp.srem, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.shl) return new cseExpr(cseOp.shl, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.ashr) return new cseExpr(cseOp.ashr, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.and) return new cseExpr(cseOp.and, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.or) return new cseExpr(cseOp.or, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            if(bi_op == BinOpType.xor) return new cseExpr(cseOp.xor, ((BinOpInst) Inst).getLeft(), ((BinOpInst) Inst).getRight(), null);
            return null;
        }
        else if(Inst instanceof IcmpInst){
            IcmpType cmp_op = ((IcmpInst) Inst).getType();
            if(cmp_op == IcmpType.eq) return new cseExpr(cseOp.eq, ((IcmpInst) Inst).getLeft(), ((IcmpInst) Inst).getRight(), null);
            if(cmp_op == IcmpType.ne) return new cseExpr(cseOp.ne, ((IcmpInst) Inst).getLeft(), ((IcmpInst) Inst).getRight(), null);
            if(cmp_op == IcmpType.sgt) return new cseExpr(cseOp.sgt, ((IcmpInst) Inst).getLeft(), ((IcmpInst) Inst).getRight(), null);
            if(cmp_op == IcmpType.sge) return new cseExpr(cseOp.sge, ((IcmpInst) Inst).getLeft(), ((IcmpInst) Inst).getRight(), null);
            if(cmp_op == IcmpType.slt) return new cseExpr(cseOp.slt, ((IcmpInst) Inst).getLeft(), ((IcmpInst) Inst).getRight(), null);
            if(cmp_op == IcmpType.sle) return new cseExpr(cseOp.sle, ((IcmpInst) Inst).getLeft(), ((IcmpInst) Inst).getRight(), null);
            return null;
        }
        else if(Inst instanceof GetElemPtrInst){
            if(((GetElemPtrInst) Inst).getIndex().size() == 1)
                return new cseExpr(cseOp.gep, ((GetElemPtrInst) Inst).getPtr(), ((GetElemPtrInst) Inst).getIndex().get(0), null);
            else
                return new cseExpr(cseOp.gep, ((GetElemPtrInst) Inst).getPtr(), ((GetElemPtrInst) Inst).getIndex().get(0), ((GetElemPtrInst) Inst).getIndex().get(1));
        }
        else if(Inst instanceof LoadInst)
            return new cseExpr(cseOp.ld, ((LoadInst) Inst).getPtr(), null, null);
        else
            return null;
    }

    public void addConstraint(){
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            ArrayList<IRBBlock> bblockList = entry.getValue().getBBlockArray();
            for(var bblock : bblockList){
                IRInstruction Inst = bblock.getHead();
                while(Inst != null){
                    if(Inst instanceof BitCastInst){
                        register reg = Inst.getRes(), src = (register)((BitCastInst)Inst).getSrc();
                        if(reg.getType() instanceof IRPointerType && src.getType() instanceof IRPointerType)
                            regPointerMap.get(src).moveList.add(regPointerMap.get(reg));
                    }
                    else if(Inst instanceof CallInst){
                        IRFunction function = ((CallInst) Inst).getFunct();
                        register reg = Inst.getRes();
                        if(irModule.getBuiltInFunctList().containsValue(function)){
                            if(reg != null && reg.getType() instanceof IRPointerType)
                                regPointerMap.get(reg).dest.add(new pointer(function.getIdentifier()+".returnValue"));
                        }
                        else{
                            if(reg != null && reg.getType() instanceof IRPointerType){
                                RetInst retInst = (RetInst)function.getExitBBlock().getRear();
                                IROperand returnValue = retInst.getValue();
                                if(returnValue instanceof register && returnValue.getType() instanceof IRPointerType)
                                    regPointerMap.get(returnValue).moveList.add(regPointerMap.get(reg));
                            }
                            ArrayList<register> paraList = function.getParas();
                            ArrayList<IROperand> argueList = ((CallInst) Inst).getParas();
                            for(int i=0; i<paraList.size(); ++i){
                                register para = paraList.get(i);
                                IROperand argue = argueList.get(i);
                                if(para.getType() instanceof  IRPointerType && argue instanceof register)
                                    regPointerMap.get(argue).moveList.add(regPointerMap.get(para));
                            }
                        }
                    }
                    else if(Inst instanceof GetElemPtrInst){
                        register reg = Inst.getRes();
                        if(reg.getType() instanceof IRPointerType && ((GetElemPtrInst) Inst).getPtr() instanceof register){
                            register ptr = (register) ((GetElemPtrInst) Inst).getPtr();
                            regPointerMap.get(ptr).moveList.add(regPointerMap.get(reg));
                        }
                    }
                    else if(Inst instanceof LoadInst){
                        register reg = Inst.getRes();
                        if(reg.getType() instanceof IRPointerType){
                            register ptr = (register)((LoadInst) Inst).getPtr();
                            regPointerMap.get(ptr).loadList.add(regPointerMap.get(reg));
                        }
                    }
                    else if(Inst instanceof PhiInst){
                        register reg = Inst.getRes();
                        if(reg.getType() instanceof IRPointerType){
                            ArrayList<IROperand> operandList = ((PhiInst) Inst).getOperands();
                            for(var operand : operandList){
                                if(operand instanceof register && operand.getType() instanceof IRPointerType)
                                    regPointerMap.get(operand).moveList.add(regPointerMap.get(reg));
                            }
                        }
                    }
                    else if(Inst instanceof StoreInst){
                        IROperand reg = ((StoreInst) Inst).getValue();
                        if(reg instanceof register && reg.getType() instanceof IRPointerType){
                            register ptr = (register)((StoreInst) Inst).getPtr();
                            regPointerMap.get(ptr).storeList.add(regPointerMap.get(reg));
                        }
                    }
                    Inst = Inst.getNext();
                }
            }
        }
        for(var entry : regPointerMap.entrySet()){
            pointer ptr = entry.getValue();
            if(!ptr.dest.isEmpty()){
                pointerQueue.offer(ptr);
                inQueue.add(ptr);
            }
        }
        while(!pointerQueue.isEmpty()){
            pointer ptr = pointerQueue.poll();
            inQueue.remove(ptr);
            for(var load : ptr.loadList){
                for(var d : ptr.dest){
                    if(!d.moveList.contains(load)){
                        d.moveList.add(load);
                        if(!inQueue.contains(d));{
                            pointerQueue.offer(d);
                            inQueue.add(d);
                        }
                    }
                }
            }
            for(var store : ptr.storeList){
                for(var d : ptr.dest){
                    if(!store.moveList.contains(d)){
                        store.moveList.add(d);
                        if(!inQueue.contains(store));{
                            pointerQueue.offer(store);
                            inQueue.add(store);
                        }
                    }
                }
            }
            for(var move : ptr.moveList){
                if(move.dest.addAll(ptr.dest)){
                    if(inQueue.contains(move)){
                        pointerQueue.offer(move);
                        inQueue.add(move);
                    }
                }
            }
        }
    }

    private enum cseOp{
        add(new String("add"),   true),
        sub(new String("sub"),   false),
        mul(new String("mul"),   true),
        sdiv(new String("sdiv"), false),
        srem(new String("srem"), false),
        shl(new String("shl"),   false),
        ashr(new String("ashr"), false),
        sgt(new String("sgt"),   true),
        sge(new String("sge"),   true),
        slt(new String("slt"),   true),
        sle(new String("sle"),   true),
        and(new String("and"),   true),
        or(new String("or"),     true),
        xor(new String("xor"),   true),
        eq(new String("eq"),     true),
        ne(new String("ne"),     true),
        ld(new String("ld"),     false),
        gep(new String("gep"),   false);

        private String Identifier;
        private boolean isCommutable;

        cseOp(String Identifier, boolean isCommutable){
            this.Identifier = Identifier;
            this.isCommutable = isCommutable;
        }

        @Override
        public String toString() {
            return Identifier;
        }
    }

    private class pointer{
        public String Identifier;
        public HashSet<pointer> moveList;
        public HashSet<pointer> loadList;
        public HashSet<pointer> storeList;
        public HashSet<pointer> dest;

        public pointer(String Identifier){
            this.Identifier = Identifier;
            moveList = new HashSet<>();
            loadList = new HashSet<>();
            storeList = new HashSet<>();
            dest = new HashSet<>();
        }

        @Override
        public String toString() {
            return Identifier;
        }
    }

    private class cseExpr{
        public cseOp op;
        public ArrayList<IROperand> operandList;

        public cseExpr(cseOp op, IROperand operand1, IROperand operand2, IROperand operand3){
            this.op = op;
            operandList = new ArrayList<>();
            operandList.add(operand1);
            if(operand2 != null) operandList.add(operand2);
            if(operand3 != null) operandList.add(operand3);
        }

        @Override
        public String toString() {
            StringBuilder stringBuilder = new StringBuilder(op+" ");
            for(var operand : operandList)
                stringBuilder.append(operand).append(" ");
            return stringBuilder.toString();
        }

        @Override
        public int hashCode() {
            return operandList.get(0).hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if(!(obj instanceof cseExpr))
                return false;
            if(op != ((cseExpr)obj).op || operandList.size() != ((cseExpr)obj).operandList.size())
                return false;
            for(int i=0; i<operandList.size(); ++i){
                IROperand u = operandList.get(i), v = ((cseExpr)obj).operandList.get(i);
                if(u instanceof constInt){
                    if(!(v instanceof constInt) || ((constInt)u).getValue() != ((constInt)v).getValue()) return false;
                }
                else if(u instanceof constBool){
                    if(!(v instanceof constBool) || ((constBool)u).getValue() != ((constBool)v).getValue()) return false;
                }
                else if(u instanceof constString){
                    if(!(v instanceof constString) || !((constString)u).getStr().equals(((constString)v).getStr())) return false;
                }
                else if(u instanceof register){
                    if(!(v instanceof register) || !u.equals(v)) return false;
                }
            }
            return true;
        }
    }
}
