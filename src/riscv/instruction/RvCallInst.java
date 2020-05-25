package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RegisterList;
import riscv.operand.RvRegister;

public class RvCallInst extends RvInstruction {
    private String funct;
    private int paras;

    public RvCallInst(RvBBlock curBBlock, String funct, int paras) {
        super(curBBlock);
        this.funct = funct;
        this.paras = paras;
    }

    @Override
    public void init() {
        for(int i=0; i<Math.min(8, paras); ++i)
            addUsed(RegisterList.argumentRegister[i]);
        for(int i=0; i<16; ++i)
            addDef(RegisterList.callerSavedRegister[i]);
    }

    @Override
    public String toString() {
        return  "\tcall    " + funct;
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
