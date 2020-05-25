package riscv.operand;

import riscv.RvVisitor;

public class RvVariable extends RvOperand {
    private String Identifier;
    private RvOperand value;

    public RvVariable(String Identifier) {
        this.Identifier = Identifier;
    }

    public RvOperand getValue() {
        return value;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public void setValue(RvOperand value) {
        this.value = value;
    }

    public void accept(RvVisitor visitor){
        visitor.visit(this);
    }

    @Override
    public String toString() {
        return Identifier;
    }
}
