package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;

public class RvCmpzInst extends RvInstruction {
    private cmp_op op;
    private RvRegister rs, rd;

    public RvCmpzInst(RvBBlock curBBlock, cmp_op op, RvRegister rd, RvRegister rs) {
        super(curBBlock);
        this.op = op;
        this.rd = rd;
        this.rs = rs;
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
        return "\t" + op.toString() + "    " + rd + "," + rs;
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

    public enum cmp_op{
        seqz("seqz"), snez("snez"), sltz("sltz"), sgtz("sgtz");
        private String str;
        cmp_op(String str){
            this.str = str;
        }
        public String toString(){
            return str;
        }
    }
}
