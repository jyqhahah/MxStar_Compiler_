package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;

public class BitCastInst extends IRInstruction {
    private IROperand type, type2;

    public BitCastInst(IROperand type, IROperand type2){
        super();
        this.type = type;
        this.type2 = type2;
        type.addUsedInst(this);
    }


    @Override
    public String toString() {
        return type2.toString() + " = bitcast " + type.getType().toString() + " " + type.toString() + " to " + type2.getType().toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public IROperand getRes() {
        return null;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(type == oldOp){
            type = newOp;
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void removeAllUsed() {
        type.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {

    }
}
