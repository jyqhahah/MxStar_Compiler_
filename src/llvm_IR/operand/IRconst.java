package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRType;

abstract public class IRconst extends IROperand {
    public IRconst(IRType type){
        super(type);
    }

    @Override
    public abstract String toString();

    @Override
    public abstract void accept(IRVisitor visitor);

    public abstract boolean valueEqual(IRconst other);
}
