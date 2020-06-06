package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

import java.util.ArrayList;

public class RetInst extends IRInstruction {
    private IROperand value;

    public RetInst(IROperand value){
        super();
        this.value = value;
    }

    public IROperand getValue() {
        return value;
    }

    @Override
    public register getRes(){
        return null;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(value == oldOp){
            value = newOp;
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void removeAllUsed() {
        if(value != null) value.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {

    }

    @Override
    public void initDefAndUsed() {
        if(value != null)
            value.addUsedInst(this);
    }

    @Override
    public ArrayList<register> getUsedRegList() {
        ArrayList<register> regList = new ArrayList<>();
        if(value != null && value instanceof register){
            regList.add((register)value);
        }
        return regList;
    }

    @Override
    public String toString() {
        if(value != null)
            return "ret " + value.getType().toString() + " " + value.toString();
        else
            return "ret void";
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
