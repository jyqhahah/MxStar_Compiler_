package llvm_IR.type;

import llvm_IR.IRVisitor;

abstract public class IRType {
    public abstract String toString();
    public abstract int bytes();
    public abstract void accept(IRVisitor visitor);
}
