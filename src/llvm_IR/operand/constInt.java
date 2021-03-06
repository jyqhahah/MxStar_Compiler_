package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRIntType;

public class constInt extends IRconst {
    private long value;

    public constInt(long value){
        super(new IRIntType(32));
        this.value = value;
    }

    public long getValue() {
        return value;
    }

    @Override
    public String toString() {
        return String.valueOf(value);
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public boolean valueEqual(IRconst other) {
        return other instanceof constInt && value == ((constInt)other).getValue();
    }
}
