package llvm_IR.instruction;

import llvm_IR.IRBBlock;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;
import riscv.instruction.RvInstruction;

import java.util.ArrayList;

abstract public class IRInstruction {
    protected IRBBlock curBBlock;
    protected IRInstruction prev, next;
    protected RvInstruction rvInst;
    protected boolean isIgnored;

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

    public IRInstruction getPrevInst(){
        if(prev == null){
            IRBBlock curBBlock = getCurBBlock();
            IRBBlock dom_i = curBBlock.getDom_i();
            if(curBBlock.getPrevBBlock().size() == 1)
                return curBBlock.getPrevBBlock().get(0).getRear();
            else
                return null;
        }
        else
            return prev;
    }

    public abstract String toString();

    public abstract void accept(IRVisitor visitor);

    public abstract register getRes();

    public abstract void replaceUsedInst(IROperand oldOp, IROperand newOp);

    public abstract void removeAllUsed();

    public abstract void removeAllDef();

    public RvInstruction getRvInst() {
        return rvInst;
    }

    public boolean isIgnored() {
        return isIgnored;
    }

    public abstract void initDefAndUsed();

    public abstract ArrayList<register> getUsedRegList();

    public void setRvInst(RvInstruction rvInst) {
        this.rvInst = rvInst;
    }

    public void setIgnored(boolean ignored) {
        isIgnored = ignored;
    }
}
