package llvm_IR.instruction;

import llvm_IR.IRBBlock;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;

public class BranchInst extends IRInstruction {
    public IRBBlock trueBBlock, falseBBlock;
    public IROperand cond;

    public BranchInst(IRBBlock trueBBlock, IRBBlock curBBlock){
        this.trueBBlock = trueBBlock;
        curBBlock.addSuccBBlock(trueBBlock);
        trueBBlock.addPredBBlock(curBBlock);
    }

    public BranchInst(IRBBlock trueBBlock, IRBBlock falseBBlock, IROperand cond, IRBBlock curBBlock){
        super();
        this.trueBBlock = trueBBlock;
        this.falseBBlock = falseBBlock;
        this.cond = cond;
        curBBlock.addSuccBBlock(trueBBlock);
        curBBlock.addSuccBBlock(falseBBlock);
        trueBBlock.addPredBBlock(curBBlock);
        falseBBlock.addPredBBlock(curBBlock);
        cond.addUsedInst(this);
    }

    public IROperand getCond() {
        return cond;
    }

    public void setTrue(){
        curBBlock.removeSuccBBlock(falseBBlock);
        falseBBlock.removePrevBBlock(curBBlock);
        falseBBlock = null;
        removeAllUsed();
        cond = null;
    }

    public void setFalse(){
        curBBlock.removeSuccBBlock(trueBBlock);
        trueBBlock.removePrevBBlock(curBBlock);
        trueBBlock = falseBBlock;
        falseBBlock = null;
        removeAllUsed();
        cond = null;
    }

    @Override
    public IROperand getRes() {
        return null;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(cond == oldOp){
            cond = newOp;
            oldOp.removeUsedInst(this);
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void removeAllUsed() {
        if(cond!=null)cond.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {

    }

    @Override
    public String toString() {
        if (cond != null)
            return "br i1 "+cond.toString()+", label "+ trueBBlock.toString() +", label "+falseBBlock.toString();
        else
            return "br label "+trueBBlock.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

}
