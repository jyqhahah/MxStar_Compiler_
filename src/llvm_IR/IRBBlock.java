package llvm_IR;

import llvm_IR.instruction.*;
import llvm_IR.operand.register;
import riscv.RvBBlock;

import java.util.*;

public class IRBBlock {
    private String Identifier;
    private IRFunction curFunct;
    private IRInstruction head, rear;
    private IRBBlock prev, next;
    private ArrayList<IRBBlock> prevBBlock, succBBlock;
    private HashSet<PhiInst> usedPhiInst;
    private LinkedHashMap<register, PhiInst> phiMap;
    private RvBBlock rvBBlock;
    private ArrayList<IRBBlock> dominateList, rdominateList;
    private HashSet<IRBBlock> dfList, rdfList;
    private ArrayList<MoveInst> moveList;
    private IRBBlock dom_s, dom_i, father, dom_rs, dom_ri, rfather;
    private int dfn, rdfn;
    private HashSet<IRBBlock> bucket, rbucket, strictDom, strictRDom;
    private boolean executable;

    public IRBBlock(String Identifier){
        this.Identifier = Identifier;
        curFunct = null;
        head = rear = null;
        prev = next = null;
        prevBBlock = new ArrayList<>();
        succBBlock = new ArrayList<>();
        usedPhiInst = new HashSet<>();
        phiMap = new LinkedHashMap<>();
        dominateList = new ArrayList<>();
        rdominateList = new ArrayList<>();
        dfList = new HashSet<>();
        rdfList = new HashSet<>();
        moveList = new ArrayList<>();
        dom_s = dom_i = father = dom_rs = dom_ri = rfather = null;
        dfn = rdfn = 0;
        bucket = new HashSet<>();
        rbucket = new HashSet<>();
        strictDom = new HashSet<>();
        strictRDom = new HashSet<>();
        executable = false;
    }

    public IRFunction getCurFunct() {
        return curFunct;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public IRInstruction getHead() {
        return head;
    }

    public IRInstruction getRear() {
        return rear;
    }

    public void setExecutable() {
        this.executable = true;
    }

    public boolean getExecutable(){
        return executable;
    }

    public void setHead(IRInstruction head) {
        this.head = head;
    }

    public void setRear(IRInstruction rear) {
        this.rear = rear;
    }

    public void setCurFunct(IRFunction curFunct) {
        this.curFunct = curFunct;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    public ArrayList<IRBBlock> getPrevBBlock() {
        return prevBBlock;
    }

    public ArrayList<IRBBlock> getSuccBBlock() {
        return succBBlock;
    }

    public void setPrevBBlock(ArrayList<IRBBlock> prevBBlock) {
        this.prevBBlock = prevBBlock;
    }

    public void setSuccBBlock(ArrayList<IRBBlock> succBBlock) {
        this.succBBlock = succBBlock;
    }

    public ArrayList<IRBBlock> getDominateList() {
        return dominateList;
    }

    public ArrayList<IRBBlock> getRdominateList() {
        return rdominateList;
    }

    public HashSet<IRBBlock> getStrictDom() {
        return strictDom;
    }

    public HashSet<IRBBlock> getStrictRDom() {
        return strictRDom;
    }

    public void addStrictDom(IRBBlock irbBlock){
        strictDom.add(irbBlock);
    }

    public void addStrictRDom(IRBBlock irbBlock){
        strictRDom.add(irbBlock);
    }

    public HashSet<IRBBlock> getDfList() {
        return dfList;
    }

    public HashSet<IRBBlock> getRdfList() {
        return rdfList;
    }

    public void addDominate(IRBBlock irbBlock){
        dominateList.add(irbBlock);
    }

    public void addRdominate(IRBBlock irbBlock){
        rdominateList.add(irbBlock);
    }

    public void addDF(IRBBlock irbBlock){
        dfList.add(irbBlock);
    }

    public void addRDF(IRBBlock irbBlock) {
        rdfList.add(irbBlock);
    }

    public RvBBlock getRvBBlock() {
        return rvBBlock;
    }

    public void setRvBBlock(RvBBlock rvBBlock) {
        this.rvBBlock = rvBBlock;
    }

    public boolean hasUsedPhiInst(PhiInst phiInst){
        return usedPhiInst.contains(phiInst);
    }

    public void removeIncomingPhi(IRBBlock irbBlock){
        for(var entry : phiMap.entrySet()){
            PhiInst phiInst = entry.getValue();
            if(irbBlock.hasUsedPhiInst(phiInst)){
                phiInst.removeUsedAllPhiInst(irbBlock);
                irbBlock.removeUsedPhiInst(phiInst);
            }
        }
        IRInstruction Inst = head;
        while(Inst instanceof PhiInst){
            if(irbBlock.hasUsedPhiInst((PhiInst)Inst)){
                ((PhiInst)Inst).removeUsedAllPhiInst(irbBlock);
                Inst = Inst.getNext();
            }
        }
    }

    public void unionBBlock(IRBBlock other){
        rear.removeAll();
        ArrayList<IRInstruction> InstList = other.getInstList();
        for(IRInstruction Inst : InstList){
            addInst(Inst);
            Inst.setCurBBlock(this);
        }
        other.replacePhiUsedInst(this);
        if(other == curFunct.getExitBBlock())
            curFunct.setExitBBlock(this);
        IRBBlock otherNext = other.getNext(), otherPrev = other.getPrev();
        //System.out.println(otherPrev == null);
        otherPrev.setNext(otherNext);
        if(otherNext != null)
            otherNext.setPrev(otherPrev);
        else
            curFunct.setRearBBlock(otherPrev);
        succBBlock = other.getSuccBBlock();
        for(var succ : succBBlock){
            succ.removePrevBBlock(other);
            succ.addPredBBlock(this);
        }
    }

    public ArrayList<IRInstruction> getInstList(){
        ArrayList<IRInstruction> InstList = new ArrayList<>();
        for(var entry : phiMap.entrySet()){
            InstList.add(entry.getValue());
        }
        IRInstruction tmp = head;
        while(tmp != null){
            InstList.add(tmp);
            tmp = tmp.getNext();
        }
        return InstList;
    }

    public void addInst(IRInstruction Inst){
        if((rear != null)&&(rear instanceof BranchInst)){
            return;
        }
        else{
            Inst.setCurBBlock(this);
            Inst.initDefAndUsed();
            if(head != null){
                rear.setNext(Inst);
                Inst.setPrev(rear);
                rear = Inst;
            }
            else
                head = rear = Inst;
        }
    }

    public void addInstNoInit(IRInstruction Inst){
        if((rear != null)&&(rear instanceof BranchInst)){
            return;
        }
        else{
            Inst.setCurBBlock(this);
            if(head != null){
                rear.setNext(Inst);
                Inst.setPrev(rear);
                rear = Inst;
            }
            else
                head = rear = Inst;
        }
    }

    public IRBBlock getNext() {
        return next;
    }

    public IRBBlock getPrev() {
        return prev;
    }

    public void setNext(IRBBlock next) {
        this.next = next;
    }

    public void setPrev(IRBBlock prev) {
        this.prev = prev;
    }

    public void replacePhiUsedInst(IRBBlock newBBlock){
        for(var PhiInst : usedPhiInst){
            PhiInst.replacePhiUsedInst(this, newBBlock);
        }
        usedPhiInst.clear();
    }

    public void addPhiInst(register address, PhiInst phiInst){
        phiMap.put(address, phiInst);
    }

    public IRBBlock spill(CallInst callInst){
        IRBBlock spillBBlock = new IRBBlock("spillBBlock");
        curFunct.addBBlocks(spillBBlock);
        if(curFunct.getExitBBlock() == this)
            curFunct.setExitBBlock(spillBBlock);
        IRInstruction Inst = callInst.getNext(), next;
        while(Inst != null){
            next = Inst.getNext();
            Inst.setPrev(null);
            Inst.setNext(null);
            spillBBlock.addInstNoInit(Inst);
            Inst = next;
        }
        callInst.setNext(null);
        callInst.removeAll();
        for(var succ : succBBlock){
            spillBBlock.addSuccBBlock(succ);
            succ.removePrevBBlock(this);
            succ.addPredBBlock(spillBBlock);
        }
        succBBlock.clear();
        for(var phiInst : usedPhiInst)
            phiInst.replacePhiUsedInst(this, spillBBlock);
        usedPhiInst.clear();
        return spillBBlock;
    }

    public void mergePhiMap(){
        ListIterator<Map.Entry<register, PhiInst>> i = new ArrayList<>(phiMap.entrySet()).listIterator(phiMap.size());
        while(i.hasPrevious()){
            Map.Entry<register, PhiInst> entry=i.previous();
            PhiInst tmp = entry.getValue();
            tmp.setCurBBlock(this);
            tmp.initDefAndUsed();
            if(head != null){
                head.setPrev(tmp);
                tmp.setNext(head);
                head = tmp;
            }
            else{
                assert rear == null;
                head = rear = tmp;
            }
        }
        phiMap.clear();
    }

    public void addDom_s(IRBBlock irbBlock){
        bucket.add(irbBlock);
    }

    public HashSet<IRBBlock> getBucket() {
        return bucket;
    }

    public void addDom_rs(IRBBlock irbBlock){
        rbucket.add(irbBlock);
    }

    public HashSet<IRBBlock> getRbucket() {
        return rbucket;
    }

    public ArrayList<PhiInst> getAllPhi(){
        ArrayList<PhiInst> phiList = new ArrayList<>();
        IRInstruction Inst = head;
        while(Inst instanceof PhiInst){
            phiList.add((PhiInst)Inst);
            Inst = Inst.getNext();
        }
        return phiList;
    }

    public LinkedHashMap<register, PhiInst> getPhiMap(){
        return phiMap;
    }

    public void removeAllInst(){
        ArrayList<IRInstruction> InstList = getInstList();
        for(var inst : InstList){
            inst.removeAll();
        }
    }

    public void removeAllUsedPhi(){
        for(var Inst : usedPhiInst)
            Inst.removeUsedAllPhiInst(this);
    }

    public void removeAll(){
        if(prev != null) prev.setNext(next);
        if(next != null) next.setPrev(prev);
        else curFunct.setRearBBlock(prev);
        for(IRBBlock prev : prevBBlock){
            IRInstruction rear = prev.getRear();
            if(rear != null)
                ((BranchInst)rear).removeBBlock(this);
            prev.removeSuccBBlock(this);
        }

        for(var succ : succBBlock){
            succ.removePrevBBlock(this);
        }
    }

    public void accept(IRVisitor visitor){
        visitor.visit(this);
    }

    public String toString(){
        return "%"+Identifier;
    }

    public void addSuccBBlock(IRBBlock block){
        if(!succBBlock.contains(block))
            succBBlock.add(block);
    }

    public void addPredBBlock(IRBBlock block){
        if(!prevBBlock.contains(block))
            prevBBlock.add(block);
    }

    public void removeSuccBBlock(IRBBlock block){
        succBBlock.remove(block);
    }

    public void removePrevBBlock(IRBBlock block){
        prevBBlock.remove(block);
    }

    public void addUsedPhiInst(PhiInst phiInst){
        usedPhiInst.add(phiInst);
    }

    public void removeUsedPhiInst(PhiInst phiInst){
        usedPhiInst.remove(phiInst);
    }

    public boolean hasMoveInst (){
        return !moveList.isEmpty();
    }

    public MoveInst getFirstMove(){
        return  moveList.get(0);
    }

    public void addMove(MoveInst moveInst){
        moveList.add(moveInst);
    }

    public MoveInst MoveOutCircle(){
        for(var move : moveList){
            boolean flag = false;
            for(var other : moveList){
                if(move.getRes().equals(other.getSrc())){
                    flag = true;
                    break;
                }
            }
            if(!flag)
                return move;
        }
        return null;
    }

    public void mergeMove(MoveInst moveInst){
        if(moveList.contains(moveInst))
            moveList.remove(moveInst);
        moveInst.setCurBBlock(this);
        moveInst.initDefAndUsed();
        IRInstruction tmp = rear.getPrev();
        if(tmp != null){
            tmp.setNext(moveInst);
            moveInst.setPrev(tmp);
            rear.setPrev(moveInst);
            moveInst.setNext(rear);
        }
        else{
            head = moveInst;
            head.setNext(rear);
            rear.setPrev(moveInst);
        }
    }

    public IRBBlock getRfather() {
        return rfather;
    }

    public IRBBlock getFather() {
        return father;
    }

    public void setDom_i(IRBBlock dom_i) {
        this.dom_i = dom_i;
    }

    public void setDom_ri(IRBBlock dom_ri) {
        this.dom_ri = dom_ri;
    }

    public void setDom_rs(IRBBlock dom_rs) {
        this.dom_rs = dom_rs;
    }

    public void setDom_s(IRBBlock dom_s) {
        this.dom_s = dom_s;
    }

    public IRBBlock getDom_i() {
        return dom_i;
    }

    public IRBBlock getDom_ri() {
        return dom_ri;
    }

    public IRBBlock getDom_rs() {
        return dom_rs;
    }

    public IRBBlock getDom_s() {
        return dom_s;
    }

    public void setFather(IRBBlock father) {
        this.father = father;
    }

    public void setRfather(IRBBlock rfather) {
        this.rfather = rfather;
    }

    public int getDfn() {
        return dfn;
    }

    public int getRdfn() {
        return rdfn;
    }

    public void dfs(HashSet<IRBBlock> visitor, ArrayList<IRBBlock> dfsList){
        dfn = dfsList.size();
        dfsList.add(this);
        visitor.add(this);
        for(var succ : succBBlock){
            if(!visitor.contains(succ)){
                succ.setFather(this);
                succ.dfs(visitor, dfsList);
            }
        }
    }

    public void rdfs(HashSet<IRBBlock> rvisitor, ArrayList<IRBBlock> rdfsList){
        rdfn = rdfsList.size();
        rdfsList.add(this);
        rvisitor.add(this);
        for(var prev : prevBBlock){
            if(!rvisitor.contains(prev)){
                prev.setRfather(this);
                prev.rdfs(rvisitor, rdfsList);
            }
        }
    }
}
