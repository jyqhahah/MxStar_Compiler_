package llvm_IR.type;

import llvm_IR.IRVisitor;

public class IRArrayType extends IRType {
    private int size;
    private IRType arrayType;

    public IRArrayType(int size, IRType arrayType){
        this.size = size;
        this.arrayType = arrayType;
    }

    public IRType getArrayType() {
        return arrayType;
    }

    public int getSize() {
        return size;
    }

    @Override
    public String toString() {
        return "["+size+" x "+arrayType.toString()+"]";
    }

    @Override
    public int bytes() {
        return 0;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
