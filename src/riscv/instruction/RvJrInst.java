package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;

public class RvJrInst extends RvInstruction {
    private RvRegister rs;

    public RvJrInst(RvBBlock curBBlock, RvRegister rs) {
        super(curBBlock);
        this.rs = rs;
    }

    @Override
    public void init() {
        rs.addUsed(this);
        usedList.add(rs);
        rs.addSpill(isInLoop);
    }

    @Override
    public String toString() {
        return "\tjr      " + rs.getIdentifier();
    }

    @Override
    public void accept(RvVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void replaceUsedInst(RvRegister oldOp, RvRegister newOp) {
        if(rs == oldOp){
            oldOp.removeUsed(this);
            usedList.remove(oldOp);
            oldOp.subSpill(isInLoop);
            rs = newOp;
            newOp.addUsed(this);
            usedList.add(newOp);
            newOp.addSpill(isInLoop);
        }
    }

    @Override
    public void replaceDefInst(RvRegister oldOp, RvRegister newOp) {

    }

    @Override
    public void removeAllUsed() {
        rs.removeUsed(this);
        usedList.remove(rs);
        rs.subSpill(isInLoop);
    }

    @Override
    public void removeAllDef() {

    }
}
