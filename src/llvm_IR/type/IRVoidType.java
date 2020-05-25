package llvm_IR.type;

import llvm_IR.IRVisitor;

public class IRVoidType extends IRType {

    @Override
    public String toString() {
        return "void";
    }

    @Override
    public int bytes() {
        return 0;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public int getBytes() {
        return 0;
    }
}
