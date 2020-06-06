package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.instruction.BranchInst;
import llvm_IR.instruction.LoadInst;
import llvm_IR.instruction.StoreInst;
import llvm_IR.type.IRType;
import riscv.operand.RvRegister;

public class register extends IROperand {
    public enum Status{
        undefined, multidefined, constant
    }

    protected String Identifier;
    private RvRegister RvReg;
    public Status status;
    private IRconst constant;

    public register(IRType type, String Identifier){
        super(type);
        this.Identifier = Identifier;
        status = Status.undefined;
        constant = null;
    }

    public IRconst getConstant() {
        return constant;
    }

    public void setConstant(IRconst constant) {
        this.constant = constant;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public void setRvReg(RvRegister rvReg) {
        RvReg = rvReg;
    }

    public RvRegister getRvReg() {
        return RvReg;
    }

    public boolean usedByBranch(){
        for(var Inst : usedInstruction){
            if(!(Inst instanceof BranchInst))
                return false;
        }
        return true;
    }

    public boolean usedByLS(){
        for(var Inst :usedInstruction){
            if(Inst instanceof LoadInst){
                if(!((LoadInst) Inst).getPtr().equals(this) || Inst.getRes().equals(this))
                    return false;
            }
            else if(Inst instanceof StoreInst){
                if(!((StoreInst)Inst).getPtr().equals(this) || ((StoreInst)Inst).getValue().equals(this))
                    return false;
            }
            else
                return false;
        }
        return true;
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
