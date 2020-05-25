package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.*;

import java.util.LinkedHashSet;

public abstract class RvInstruction {
    protected RvBBlock curBBlock;
    protected RvInstruction prev, next;
    protected boolean isInLoop;
    protected LinkedHashSet<RvRegister> defList, usedList;

    public RvInstruction(RvBBlock curBBlock){
        this.curBBlock = curBBlock;
        this.prev = null;
        this.next = null;
        this.isInLoop = isInLoop();
        defList = new LinkedHashSet<>();
        usedList = new LinkedHashSet<>();
    }

    private boolean isInLoop(){
        String Identifier = curBBlock.getIdentifier();
        return Identifier.contains("forCond") || Identifier.contains("forStep") || Identifier.contains("forStep")
                || Identifier.contains("whileCond") || Identifier.contains("whileBody");
    }

    public void setPrev(RvInstruction prev) {
        this.prev = prev;
    }

    public void setNext(RvInstruction next) {
        this.next = next;
    }

    public void setCurBBlock(RvBBlock curBBlock) {
        this.curBBlock = curBBlock;
        this.isInLoop = isInLoop();
    }

    public RvInstruction getPrev() {
        return prev;
    }

    public RvInstruction getNext() {
        return next;
    }

    public RvBBlock getCurBBlock() {
        return curBBlock;
    }

    public LinkedHashSet<RvRegister> getDefList() {
        return defList;
    }

    public LinkedHashSet<RvRegister> getUsedList() {
        return usedList;
    }

    public void addDef(RvRegister defReg) {
        defList.add(defReg);
    }

    public void addUsed(RvRegister usedReg) {
        usedList.add(usedReg);
    }

    public abstract void init();
    public abstract String toString();
    public abstract void accept(RvVisitor visitor);
    public abstract void replaceUsedInst(RvRegister oldOp, RvRegister newOp);
    public abstract void replaceDefInst(RvRegister oldOp, RvRegister newOp);
    public abstract void removeAllUsed();
    public abstract void removeAllDef();
}

