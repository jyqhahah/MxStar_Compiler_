package llvm_IR.operand;

import llvm_IR.IRPrinter;
import llvm_IR.IRVisitor;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IRType;
import riscv.operand.RvVariable;

public class variable extends register {
    private IROperand initValue;
    private RvVariable rvVariable;

    public variable (IRType type, String Identifier){
        super(type, Identifier);
    }

    public void setInitValue(IROperand initValue) {
        this.initValue = initValue;
    }

    public IROperand getInitValue() {
        return initValue;
    }

    public RvVariable getRvVariable() {
        return rvVariable;
    }

    public void setRvVariable(RvVariable rvVariable) {
        this.rvVariable = rvVariable;
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
