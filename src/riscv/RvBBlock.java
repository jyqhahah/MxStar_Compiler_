package riscv;

import riscv.instruction.RvInstruction;
import riscv.instruction.RvLoadInst;
import riscv.instruction.RvMoveInst;
import riscv.operand.RvRegister;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RvBBlock {
    private String Identifier;
    private RvInstruction head, rear;
    private ArrayList<RvBBlock> prevBBlock, succBBlock;
    private HashSet<RvRegister> defList, usedList, liveInList, liveOutList;

    public RvBBlock(String Identifier, String FunctId){
        this.Identifier = FunctId+"_"+Identifier;
        this.head = this.rear =null;
        this.prevBBlock = new ArrayList<>();
        this.succBBlock = new ArrayList<>();
        this.defList = new HashSet<>();
        this.usedList = new HashSet<>();
        this.liveInList = new HashSet<>();
        this.liveOutList = new HashSet<>();
    }

    public RvInstruction getHead() {
        return head;
    }

    public RvInstruction getRear() {
        return rear;
    }

    public HashSet<RvRegister> getLiveInList() {
        return liveInList;
    }

    public HashSet<RvRegister> getLiveOutList() {
        return liveOutList;
    }

    public ArrayList<RvBBlock> getPrevBBlock() {
        return prevBBlock;
    }

    public ArrayList<RvBBlock> getSuccBBlock() {
        return succBBlock;
    }

    public void setLiveInList(HashSet<RvRegister> liveInList) {
        this.liveInList = liveInList;
    }

    public void setLiveOutList(HashSet<RvRegister> liveOutList) {
        this.liveOutList = liveOutList;
    }

    public HashSet<RvRegister> getDefList() {
        return defList;
    }

    public HashSet<RvRegister> getUsedList() {
        return usedList;
    }

    public void addInst(RvInstruction Inst){
        Inst.init();
        if(head != null){
            rear.setNext(Inst);
            Inst.setPrev(rear);
            rear = Inst;
        }
        else
            head = rear = Inst;
    }

    public ArrayList<RvMoveInst> getMoveInst(){
        ArrayList<RvMoveInst> moveList= new ArrayList<>();
        RvInstruction tmp = head;
        while(tmp != null){
            if(tmp instanceof RvMoveInst)
                moveList.add((RvMoveInst) tmp);
            tmp = tmp.getNext();
        }
        return moveList;
    }

    public void addDef(LinkedHashSet<RvRegister> defs){
        defList.addAll(defs);
    }

    public void addDef(RvRegister def){
        defList.add(def);
    }

    public void addUsed(LinkedHashSet<RvRegister> useds){
        usedList.addAll(useds);
    }

    public void addUsed(RvRegister used){
        usedList.add(used);
    }

    public void removeInst(RvInstruction Inst){
        if(Inst == head){
            if(Inst == rear)
                head = rear = null;
            else{
                head = head.getNext();
                head.setPrev(null);
            }
        }
        else if(Inst == rear){
            rear = rear.getPrev();
            rear.setNext(null);
        }
        else{
            RvInstruction prev = Inst.getPrev();
            RvInstruction next = Inst.getNext();
            prev.setNext(next);
            next.setPrev(prev);
        }
    }

    public void addPrev(RvInstruction Inst, RvInstruction prevInst){
        prevInst.init();
        if(Inst == head){
            head = prevInst;
            prevInst.setNext(Inst);
            Inst.setPrev(prevInst);
        }
        else{
            RvInstruction prev = Inst.getPrev();
            prev.setNext(prevInst);
            prevInst.setPrev(prev);
            prevInst.setNext(Inst);
            Inst.setPrev(prevInst);
        }
    }

    public void addNext(RvInstruction Inst, RvInstruction nextInst){
        nextInst.init();
        if(Inst == rear){
            rear = nextInst;
            nextInst.setPrev(Inst);
            Inst.setNext(nextInst);
        }
        else{
            RvInstruction next = Inst.getNext();
            next.setPrev(nextInst);
            nextInst.setNext(next);
            nextInst.setPrev(Inst);
            Inst.setNext(nextInst);
        }
    }

    public void clearDefUsed(){
        defList.clear();
        usedList.clear();
    }

    public void clearLive(){
        liveInList.clear();
        liveOutList.clear();
    }

    public void dfs(ArrayList<RvBBlock> order, LinkedHashSet<RvBBlock> visitor){
        order.add(this);
        visitor.add(this);
        for(var bblock : succBBlock){
            if(!visitor.contains(bblock))
                bblock.dfs(order, visitor);
        }
    }

    public ArrayList<RvLoadInst> getLoadList(){
        ArrayList<RvLoadInst> loadList = new ArrayList<>();
        RvInstruction Inst = head;
        while(Inst != null){
            if(Inst instanceof RvLoadInst)
                loadList.add((RvLoadInst)Inst);
            Inst = Inst.getNext();
        }
        return loadList;
    }

    public void replaceInst(RvInstruction oldInst, RvInstruction newInst){
        RvInstruction prev = oldInst.getPrev(), next = oldInst.getNext();
        if(oldInst == head){
            if(next != null){
                next.setPrev(newInst);
                newInst.setNext(next);
            }
            head = newInst;
        }
        else if(oldInst == rear){
            if(prev != null){
                prev.setNext(newInst);
                newInst.setPrev(prev);
            }
            rear = newInst;
        }
        else{
            newInst.setNext(next);
            newInst.setPrev(prev);
            prev.setNext(newInst);
            next.setPrev(newInst);
        }
        newInst.init();
        oldInst.removeAllDef();
        oldInst.removeAllUsed();
    }

    public void addPredBBlock(RvBBlock bBlock){
        prevBBlock.add(bBlock);
    }

    public void addSuccBBlock(RvBBlock bBlock){
        succBBlock.add(bBlock);
    }

    public String getIdentifier() {
        return Identifier;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    public void accept(RvVisitor visitor){
        visitor.visit(this);
    }
}
