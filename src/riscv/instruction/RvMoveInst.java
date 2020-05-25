package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;

public class RvMoveInst extends RvInstruction {
    private RvRegister rs, rd;

    public RvMoveInst(RvBBlock curBBlock, RvRegister rd, RvRegister rs) {
        super(curBBlock);
        this.rs = rs;
        this.rd = rd;
    }

    public RvRegister getRs(){
        return rs;
    }

    public RvRegister getRd(){
        return rd;
    }

    @Override
    public void init() {
        addDef(rd);
        rd.addDef(this);
        addUsed(rs);
        rs.addUsed(this);
        rd.addSpill(isInLoop);
        rs.addSpill(isInLoop);
    }

    @Override
    public String toString() {
        return "\tmv      " + rd + "," + rs;
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
        rs.removeUsed(this);
        usedList.remove(rs);
        rs.subSpill(isInLoop);
    }

    @Override
    public void removeAllDef() {
        rd.removeDef(this);
        defList.remove(rd);
        rd.subSpill(isInLoop);
    }
}
