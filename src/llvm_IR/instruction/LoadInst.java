package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

public class LoadInst extends IRInstruction {
    private IROperand ptr;
    private register res;

    public LoadInst(register res, IROperand ptr){
        super();
        this.ptr = ptr;
        this.res = res;
    }

    @Override
    public register getRes() {
        return res;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(ptr == oldOp){
            ptr = newOp;
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void removeAllUsed() {
        ptr.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {

    }

    @Override
    public void initDefAndUsed() {
        res.addDefInst(this);
        ptr.addUsedInst(this);
    }

    public IROperand getPtr() {
        return ptr;
    }

    @Override
    public String toString() {
        return res.toString() + " = load " + res.getType().toString() + ", " + ptr.getType().toString() + " " + ptr.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
