package llvm_IR.instruction;

import llvm_IR.IRBBlock;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;
import llvm_IR.type.IRType;

public class AllocaInst extends IRInstruction {
    private IRType type;
    private register reg;

    public AllocaInst(IRType type, register reg){
        super();
        this.type = type;
        this.reg = reg;
    }

    @Override
    public register getRes() {
        return reg;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {

    }

    @Override
    public void removeAllUsed() {

    }

    @Override
    public void removeAllDef() {

    }

    @Override
    public String toString() {
        return reg.toString() + " = alloca " + type.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
