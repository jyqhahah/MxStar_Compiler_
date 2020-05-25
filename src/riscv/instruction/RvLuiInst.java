package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;
import riscv.operand.imm;

public class RvLuiInst extends RvInstruction {
    private RvRegister rd;
    private imm imm;

    public RvLuiInst(RvBBlock curBBlock, RvRegister rd, imm imm) {
        super(curBBlock);
        this.rd = rd;
        this.imm = imm;
    }

    @Override
    public void init() {
        addDef(rd);
        rd.addDef(this);
        rd.addSpill(isInLoop);
    }

    @Override
    public String toString() {
        return "\tlui     " + rd + "," + imm;
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
        if(rd == oldOp){
            oldOp.removeDef(this);
            defList.remove(oldOp);
            oldOp.subSpill(isInLoop);
            rd= newOp;
            newOp.addDef(this);
            defList.add(newOp);
            newOp.addSpill(isInLoop);
        }
    }

    @Override
    public void removeAllUsed() {

    }

    @Override
    public void removeAllDef() {
        rd.removeDef(this);
        defList.remove(rd);
        rd.subSpill(isInLoop);
    }
}
