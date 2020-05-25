package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvRegister;

public class RvBInst extends RvInstruction {
    private b_op op;
    private RvRegister rt, rs;
    private RvBBlock offset;
    
    public RvBInst(RvBBlock curBBlock, b_op op, RvRegister rs, RvRegister rt, RvBBlock offset) {
        super(curBBlock);
        this.op = op;
        this.rs = rs;
        this.rt = rt;
        this.offset = offset;
    }

    @Override
    public void init() {
        addUsed(rs);
        rs.addUsed(this);
        addUsed(rt);
        rt.addUsed(this);
        rs.addSpill(isInLoop);
        rt.addSpill(isInLoop);
        curBBlock.addSuccBBlock(offset);
        offset.addPredBBlock(curBBlock);
    }

    @Override
    public String toString() {
        return "\t" + op.toString() + "     " + rs + "," + rt + "," + offset.getIdentifier();
    }

    @Override
    public void accept(RvVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void replaceUsedInst(RvRegister oldOp, RvRegister newOp) {
        boolean isChange = false;
        if(rs == oldOp){
            oldOp.subSpill(isInLoop);
            rs = newOp;
            newOp.addSpill(isInLoop);
            isChange = true;
        }
        if(rt == oldOp){
            oldOp.subSpill(isInLoop);
            rt = newOp;
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

    }

    @Override
    public void removeAllUsed() {
        rt.removeUsed(this);
        usedList.remove(rt);
        rt.subSpill(isInLoop);
        rs.removeUsed(this);
        usedList.remove(rs);
        rs.subSpill(isInLoop);
    }

    @Override
    public void removeAllDef() {

    }

    public enum b_op{
        beq("beq"), bne("bne"), ble("ble"), bge("bge"), blt("blt"), bgt("bgt");
        private String str;
        b_op(String str){
            this.str = str;
        }
        public String toString(){
            return str;
        }
    }
}
