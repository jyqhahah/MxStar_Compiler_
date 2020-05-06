package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IRType;

public class string extends register {
    private constString initValue;

    public string(IRType type, String Identifier, constString initValue){
        super(type, Identifier);
        this.initValue = initValue;
    }

    @Override
    public String toString() {
        return "@" + Identifier;
    }

    public String declarePrinter(){
        return "@"+Identifier+" = private unnamed_addr constant "+((IRPointerType)type).getPointerType().toString()+" "+initValue.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
