package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRIntType;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IRVoidType;

public class constNull extends IROperand {
    public constNull(){
        super(new IRPointerType(new IRVoidType()));
    }


    @Override
    public String toString() {
        return "null";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
