package llvm_IR.operand;

import llvm_IR.IRPrinter;
import llvm_IR.IRVisitor;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IRType;

public class variable extends register {
    private IROperand initValue;

    public variable (IRType type, String Identifier){
        super(type, Identifier);
    }

    public void setInitValue(IROperand initValue) {
        this.initValue = initValue;
    }

    @Override
    public String toString() {
        return "@"+Identifier;
    }

    public String declarePrinter(){
        return "@"+Identifier+" = global "+((IRPointerType)type).getPointerType().toString()+" "+initValue.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
