package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRType;

public class register extends IROperand {
    protected String Identifier;

    public register(IRType type, String Identifier){
        super(type);
        this.Identifier = Identifier;
    }

    public String getIdentifier() {
        return Identifier;
    }

    @Override
    public IRType getType() {
        return type;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    @Override
    public String toString() {
        return "%"+Identifier;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
