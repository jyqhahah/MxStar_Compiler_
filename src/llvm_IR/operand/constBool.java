package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRIntType;

public class constBool extends IRconst {
    private boolean value;

    public constBool(boolean value){
        super(new IRIntType(1));
        this.value = value;
    }

    public boolean getValue(){
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
        return other instanceof constBool && value == ((constBool)other).getValue();
    }
}
