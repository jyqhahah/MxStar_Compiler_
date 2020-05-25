package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;

public class RvRInst extends RvInstruction {
    private r_op op;
    private RvRegister rs1, rs2, rd;

    public RvRInst(RvBBlock curBBlock, r_op op, RvRegister rd, RvRegister rs1, RvRegister rs2) {
        super(curBBlock);
        this.op = op;
        this.rs1 = rs1;
        this.rs2 = rs2;
        this.rd = rd;
    }

    @Override
    public void init() {
        addDef(rd);
        rd.addDef(this);
        addUsed(rs1);
        rs1.addUsed(this);
        addUsed(rs2);
        rs2.addUsed(this);
        rd.addSpill(isInLoop);
        rs1.addSpill(isInLoop);
        rs2.addSpill(isInLoop);
    }

    @Override
    public String toString() {
        if (op == r_op.or)
            return "\tor      " + rd + "," + rs1 + "," + rs2;
        else if (op == r_op.sltu)
            return "\tsltu    " + rd + ","  + rs1 + "," + rs2;
        else
            return "\t" +  op + "     " + rd + "," + rs1 + "," + rs2;
    }

    @Override
    public void accept(RvVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void replaceUsedInst(RvRegister oldOp, RvRegister newOp) {
        boolean isChange = false;
        if(rs1 == oldOp){
            oldOp.subSpill(isInLoop);
            rs1 = newOp;
            newOp.addSpill(isInLoop);
            isChange = true;
        }
        if(rs2 == oldOp){
            oldOp.subSpill(isInLoop);
            rs2 = newOp;
            newOp.addSpill(isInLoop);
            isChange = true;
        }
        if(isChange){
            oldOp.removeUsed(this);
            newOp.addUsed(this);
            usedList.remove(oldOp);
            usedList.add(newOp);
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
        rs1.removeUsed(this);
        usedList.remove(rs1);
        rs1.subSpill(isInLoop);

        rs2.removeUsed(this);
        usedList.remove(rs2);
        rs2.subSpill(isInLoop);
    }

    @Override
    public void removeAllDef() {
        rd.removeDef(this);
        defList.remove(rd);
        rd.subSpill(isInLoop);
    }

    public enum r_op{
        add("add"), sub("sub"), mul("mul"), div("div"), rem("rem"), and("and"), or("or"), xor("xor"), sll("sll"), sra("sra"), slt("slt"), sltu("sltu");
        private String str;
        r_op(String str){
            this.str = str;
        }
        public String toString(){
            return str;
        }
    }
}
