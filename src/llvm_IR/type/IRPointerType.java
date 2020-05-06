package llvm_IR.type;

import llvm_IR.IRVisitor;

public class IRPointerType extends IRType {
    private IRType pointerType;

    public IRPointerType(IRType pointerType){
        this.pointerType = pointerType;
    }

    public IRType getPointerType() {
        return pointerType;
    }

    @Override
    public String toString() {
        return pointerType.toString() + "*";
    }

    @Override
    public int bytes() {
        return 8;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
