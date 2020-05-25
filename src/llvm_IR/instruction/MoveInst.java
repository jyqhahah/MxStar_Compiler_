package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

public class MoveInst extends IRInstruction {
    private register dest;
    private IROperand src;

    public MoveInst(register dest, IROperand src){
        this.dest = dest;
        this.src = src;
    }

    public void initDefAndUsed(){
        dest.addDefInst(this);
        src.addUsedInst(this);
    }

    @Override
    public String toString() {
        return "move " + dest.toString() + ", " + src.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public register getRes() {
        return dest;
    }

    public IROperand getSrc() {
        return src;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(src == oldOp){
            src = newOp;
            newOp.addUsedInst(this);
        }
    }

    public void setSrc(IROperand src) {
        this.src = src;
    }

    @Override
    public void removeAllUsed() {
        src.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {
        dest.removeDefInst(this);
    }
}
