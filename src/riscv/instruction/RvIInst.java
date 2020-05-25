package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;
import riscv.operand.imm;

public class RvIInst extends RvInstruction {
    private i_op op;
    private RvRegister rs, rd;
    private imm imm;

    public RvIInst(RvBBlock curBBlock, i_op op, RvRegister rd, RvRegister rs, imm imm) {
        super(curBBlock);
        this.op = op;
        this.rd = rd;
        this.rs = rs;
        this.imm = imm;
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
        if (op == i_op.sltiu)
            return "\tsltiu   " + rd + "," + rs + "," + imm;
        else
            return  "\t" + op + "    " + rd + "," + rs + "," + imm;
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
    
    public enum i_op{
        addi("addi"), andi("andi"), ori("ori"), xori("xori"), slli("slli"), srai("srai"), slti("slti"), sltiu("sltiu");
        private String str;
        i_op (String str){
            this.str = str;
        }
        public String toString(){
            return str;
        }
    }
}
