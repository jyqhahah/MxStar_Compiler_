package llvm_IR.type;

import llvm_IR.IRVisitor;

public class IRIntType extends IRType {
    private int bytes;

    public IRIntType(int bytes){
        this.bytes = bytes;
    }

    @Override
    public String toString() {
        switch (bytes){
            case 1: return "i1";
            case 8: return "i8";
            case 32:return "i32";
            default: return null;
        }
    }

    @Override
    public int bytes() {
        return bytes;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
