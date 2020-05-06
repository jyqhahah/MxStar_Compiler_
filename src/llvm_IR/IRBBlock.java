package llvm_IR;

import llvm_IR.instruction.BranchInst;
import llvm_IR.instruction.IRInstruction;
import llvm_IR.instruction.PhiInst;
import llvm_IR.operand.register;

import java.util.*;

public class IRBBlock {
    private String Identifier;
    private IRFunction curFunct;
    private IRInstruction head, rear;
    private IRBBlock prev, next;
    private ArrayList<IRBBlock> prevBBlock, succBBlock;
    private HashSet<PhiInst> usedPhiInst;
    private LinkedHashMap<register, PhiInst> phiMap;


    public IRBBlock(String Identifier){
        this.Identifier = Identifier;
        curFunct = null;
        head = rear = null;
        prev = next = null;
        prevBBlock = succBBlock = new ArrayList<>();
        usedPhiInst = new HashSet<>();
        phiMap = new LinkedHashMap<>();
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

    public ArrayList<IRInstruction> getInstList(){
        ArrayList<IRInstruction> InstList = new ArrayList<>();
        IRInstruction tmp = head;
        while(tmp != null){
            InstList.add(tmp);
            tmp = tmp.getNext();
        }
        return InstList;
    }

    public void addInst(IRInstruction Inst){
        if((rear != null)&&(rear instanceof BranchInst)){
            Inst.removeAllUsed();
            Inst.removeAllDef();
            if(Inst instanceof PhiInst){
                ((PhiInst)Inst).removeUsedAllPhiInst();
            }
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

    public void mergePhiMap(){
        ListIterator<Map.Entry<register, PhiInst>> i = new ArrayList<>(phiMap.entrySet()).listIterator(phiMap.size());
        while(i.hasPrevious()){
            Map.Entry<register, PhiInst> entry=i.previous();
            PhiInst tmp = entry.getValue();
            if(tmp.getRes().isUsed()){
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
        }
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

    public void removeAll(){
        if(prev != null) prev.setNext(next);
        if(next != null) next.setPrev(prev);
        else curFunct.setExitBBlock(prev);
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
        succBBlock.add(block);
    }

    public void addPredBBlock(IRBBlock block){
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
}
