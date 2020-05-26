package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;
import riscv.operand.RvVariable;

public class RvLaInst extends RvInstruction {
    private RvRegister dest;
    private RvVariable src;

    public RvLaInst(RvBBlock curBBlock, RvRegister dest, RvVariable src){
        super(curBBlock);
        this.dest = dest;
        this.src = src;
    }

    @Override
    public void init() {
        addDef(dest);
        dest.addDef(this);
        dest.addSpill(isInLoop);
    }

    @Override
    public String toString() {
        return "    la      " + dest + "," + src;
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
        if(dest == oldOp){
            oldOp.removeDef(this);
            defList.remove(oldOp);
            oldOp.subSpill(isInLoop);
            dest = newOp;
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
        dest.removeDef(this);
        defList.remove(dest);
        dest.subSpill(isInLoop);
    }
}
