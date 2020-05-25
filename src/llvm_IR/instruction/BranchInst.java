package llvm_IR.instruction;

import llvm_IR.IRBBlock;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.constBool;
import llvm_IR.operand.register;

public class BranchInst extends IRInstruction {
    public IRBBlock trueBBlock, falseBBlock;
    public IROperand cond;

    public BranchInst(IRBBlock trueBBlock, IRBBlock curBBlock){
        this.trueBBlock = trueBBlock;
    }

    public BranchInst(IRBBlock trueBBlock, IRBBlock falseBBlock, IROperand cond, IRBBlock curBBlock){
        super();
        this.trueBBlock = trueBBlock;
        this.falseBBlock = falseBBlock;
        this.cond = cond;
    }

    public IROperand getCond() {
        return cond;
    }

    public void removeCond(){
        if(cond!=null){
            cond.removeUsedInst(this);
            cond = null;
        }
    }

    public void removeTrue(){
        if(trueBBlock != null){
            trueBBlock.removeIncomingPhi(curBBlock);
            curBBlock.removeSuccBBlock(trueBBlock);
            trueBBlock.removePrevBBlock(curBBlock);
            trueBBlock = null;
        }
    }

    public void removeFalse(){
        if(falseBBlock != null){
            falseBBlock.removeIncomingPhi(curBBlock);
            curBBlock.removeSuccBBlock(falseBBlock);
            falseBBlock.removePrevBBlock(curBBlock);
            falseBBlock = null;
        }
    }

    public void replaceBBlock(IRBBlock oldBBlock, IRBBlock newBBlock){
        if(trueBBlock == oldBBlock)
            trueBBlock = newBBlock;
        if(falseBBlock == oldBBlock)
            falseBBlock = newBBlock;
    }

    public void setTrue(){
        removeCond();
        removeFalse();
    }

    public void setFalse(){
        removeCond();
        removeTrue();
    }

    public IRBBlock getTrueBBlock() {
        return trueBBlock;
    }

    public IRBBlock getFalseBBlock() {
        return falseBBlock;
    }

    public void removeBBlock(IRBBlock bblock){
        if(trueBBlock == bblock){
            removeCond();
            trueBBlock = falseBBlock;
            falseBBlock = null;
        }
        if(falseBBlock == bblock)
            removeCond();
    }

    @Override
    public register getRes() {
        return null;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(cond == oldOp){
            cond = newOp;
            oldOp.removeUsedInst(this);
            newOp.addUsedInst(this);
            if(newOp instanceof constBool){
                cond = null;
                if(((constBool)newOp).getValue())
                    removeFalse();
                else{
                    removeTrue();
                    trueBBlock = falseBBlock;
                    falseBBlock = null;
                }
            }
        }
    }

    @Override
    public void initDefAndUsed() {
        if(cond != null)cond.addUsedInst(this);
        if(trueBBlock != null){
            curBBlock.addSuccBBlock(trueBBlock);
            trueBBlock.addPredBBlock(curBBlock);
        }
        if(falseBBlock != null){
            curBBlock.addSuccBBlock(falseBBlock);
            falseBBlock.addPredBBlock(curBBlock);
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
