package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.type.BinOpType;
import llvm_IR.type.IcmpType;

public class IcmpInst extends IRInstruction {
    private IROperand left, right;
    private IROperand res;
    private IcmpType type;

    public IcmpInst(IROperand left, IROperand right, IROperand res, IcmpType type){
        super();
        this.left = left;
        this.right = right;
        this.res = res;
        this.type = type;
        left.addUsedInst(this);
        right.addUsedInst(this);
    }

    @Override
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
        if(!flag) newOp.addUsedInst(this);
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
        return res.toString() + " = icmp " + type.toString() + " " + left.getType().toString() + " " + left.toString() + ", " + right.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
