package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.type.IRPointerType;

public class StoreInst extends IRInstruction {
    private IROperand ptr, res;

    public StoreInst(IROperand res, IROperand ptr){
        super();
        this.ptr = ptr;
        this.res = res;
        ptr.addUsedInst(this);
        res.addUsedInst(this);
    }

    @Override
    public IROperand getRes() {
        return res;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(res == oldOp){
            res = newOp;
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void removeAllUsed() {
        res.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {
        ptr.removeUsedInst(this);
    }

    public IROperand getPtr() {
        return ptr;
    }

    @Override
    public String toString() {
        IRPointerType ptrType = (IRPointerType)ptr.getType();
        return "store "+ ptrType.getPointerType().toString() + " " + res.toString() +", "+ptr.getType().toString()+" "+ptr.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
