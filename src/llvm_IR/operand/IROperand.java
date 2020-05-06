package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.instruction.IRInstruction;
import llvm_IR.type.IRType;

import java.util.HashSet;

abstract public class IROperand {
    protected IRType type;
    protected HashSet<IRInstruction> usedInstruction, defInstruction;

    public IROperand(IRType type){
        this.type = type;
        this.usedInstruction = new HashSet<>();
        this.defInstruction = new HashSet<>();
    }

    public IRType getType() {
        return type;
    }

    public HashSet<IRInstruction> getDefInstruction() {
        return defInstruction;
    }

    public HashSet<IRInstruction> getUsedInstruction() {
        return usedInstruction;
    }

    public void removeUsedInst(IRInstruction usedInst){
        usedInstruction.remove(usedInst);
    }

    public void addUsedInst(IRInstruction usedInst){
        usedInstruction.add(usedInst);
    }

    public void removeDefInst(IRInstruction defInst){
        defInstruction.remove(defInst);
    }

    public void addDefInst(IRInstruction defInst){
        defInstruction.add(defInst);
    }

    public abstract String toString();

    public boolean isUsed(){return !usedInstruction.isEmpty();}

    public boolean isDefined(){return !defInstruction.isEmpty();}

    public void replaceUsedInst(IROperand other){
        if(this == other)return;
        for(var usedInst : usedInstruction){
            usedInst.replaceUsedInst(this, other);
        }
        usedInstruction.clear();
    }

    public abstract void accept(IRVisitor visitor);
}
