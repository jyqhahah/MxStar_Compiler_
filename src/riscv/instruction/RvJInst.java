package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;

public class RvJInst extends RvInstruction {
    private RvBBlock offset;

    public RvJInst(RvBBlock curBBlock, RvBBlock offset) {
        super(curBBlock);
        this.offset = offset;
    }

    @Override
    public void init() {
        curBBlock.addSuccBBlock(offset);
        offset.addPredBBlock(curBBlock);
    }

    @Override
    public String toString() {
        return "\tj       " + offset.getIdentifier();
    }

    @Override
    public void accept(RvVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void replaceUsedInst(RvRegister oldOp, RvRegister newOp) {

    }

    @Override
    public void replaceDefInst(RvRegister oldOp, RvRegister newOp) {

    }

    @Override
    public void removeAllUsed() {

    }

    @Override
    public void removeAllDef() {

    }
}
