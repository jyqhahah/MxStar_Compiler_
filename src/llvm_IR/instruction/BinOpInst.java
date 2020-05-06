package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.type.BinOpType;

public class BinOpInst extends IRInstruction {
    private IROperand left, right;
    private IROperand res;
    private BinOpType type;

    public BinOpInst(IROperand left, IROperand right, IROperand res, BinOpType type){
        super();
        this.left = left;
        this.right = right;
        this.res = res;
        this.type = type;
        left.addUsedInst(this);
        right.addUsedInst(this);
    }

    public IROperand getRes() {
        return res;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        boolean flag = true;
        if(left == oldOp){
            left = newOp;
            flag = false;
        }
        if(right == oldOp){
            right = newOp;
            flag = false;
        }
        if(!flag){
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void removeAllUsed() {
        left.removeUsedInst(this);
        right.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {

    }

    public IROperand getLeft() {
        return left;
    }

    public IROperand getRight() {
        return right;
    }

    @Override
    public String toString() {
        return res.toString() + " = " + type.toString() + " " + res.getType().toString() + " " + left.toString() + ", " + right.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
