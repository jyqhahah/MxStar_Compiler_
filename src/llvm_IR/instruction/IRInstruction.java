package llvm_IR.instruction;

import llvm_IR.IRBBlock;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;

abstract public class IRInstruction {
    protected IRBBlock curBBlock;
    protected IRInstruction prev, next;

    public IRInstruction(){
        this.prev = null;
        this.next = null;
        this.curBBlock = null;
    }

    public IRInstruction getPrev() {
        return prev;
    }

    public IRInstruction getNext() {
        return next;
    }

    public IRBBlock getCurBBlock() {
        return curBBlock;
    }

    public void setPrev(IRInstruction prev) {
        this.prev = prev;
    }

    public void setNext(IRInstruction next) {
        this.next = next;
    }

    public void setCurBBlock(IRBBlock curBBlock) {
        this.curBBlock = curBBlock;
    }

    public void removeAll(){
        removeAllUsed();
        removeAllDef();
        if(prev != null) prev.setNext(next);
        else curBBlock.setHead(next);
        if(next != null) next.setPrev(prev);
        else curBBlock.setRear(prev);
    }

    public abstract String toString();

    public abstract void accept(IRVisitor visitor);

    public abstract IROperand getRes();

    public abstract void replaceUsedInst(IROperand oldOp, IROperand newOp);

    public abstract void removeAllUsed();

    public abstract void removeAllDef();
}
