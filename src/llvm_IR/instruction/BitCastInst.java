package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

import java.util.ArrayList;

public class BitCastInst extends IRInstruction {
    private IROperand type;
    private register type2;

    public BitCastInst(IROperand type, register type2){
        super();
        this.type = type;
        this.type2 = type2;
    }

    public IROperand getSrc(){
        return type;
    }

    @Override
    public String toString() {
        return type2.toString() + " = bitcast " + type.getType().toString() + " " + type.toString() + " to " + type2.getType().toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public register getRes() {
        return type2;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        if(type == oldOp){
            type = newOp;
            newOp.addUsedInst(this);
        }
    }

    @Override
    public void initDefAndUsed() {
        type.addUsedInst(this);
        type2.addDefInst(this);
    }

    @Override
    public ArrayList<register> getUsedRegList() {
        ArrayList<register> regList = new ArrayList<>();
        if(type instanceof register)
            regList.add((register)type);
        return regList;
    }

    @Override
    public void removeAllUsed() {
        type.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {

    }
}
