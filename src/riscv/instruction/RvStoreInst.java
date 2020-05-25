package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvOperand;
import riscv.operand.RvRegister;
import riscv.operand.imm;
import riscv.operand.spSlot;

public class RvStoreInst extends RvInstruction {
    private RvOperand dest;
    private RvRegister rd;
    private imm imm;

    public RvStoreInst(RvBBlock curBBlock, RvRegister rd, RvOperand dest, imm imm) {
        super(curBBlock);
        this.rd = rd;
        this.dest = dest;
        this.imm = imm;
    }

    public spSlot getSpSlot(){
        if(dest instanceof spSlot){
            return (spSlot)dest;
        }
        else
            return null;
    }

    @Override
    public void init() {
        addUsed(rd);
        rd.addUsed(this);
        rd.addSpill(isInLoop);
        if(dest instanceof RvRegister){
            addUsed((RvRegister)dest);
            ((RvRegister)dest).addUsed(this);
            ((RvRegister)dest).addSpill(isInLoop);
        }
    }

    @Override
    public String toString() {
        if (dest instanceof spSlot)
            return "\tsw      " + rd + "," + dest;
        else
            return "\tsw      " + rd + "," + imm + "(" + dest + ")";
    }

    @Override
    public void accept(RvVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void replaceUsedInst(RvRegister oldOp, RvRegister newOp) {
        boolean isChange = false;
        if(rd == oldOp){
            oldOp.subSpill(isInLoop);
            rd = newOp;
            newOp.addSpill(isInLoop);
            isChange = true;
        }
        if(dest instanceof RvRegister && dest == oldOp){
            oldOp.subSpill(isInLoop);
            dest = newOp;
            newOp.addSpill(isInLoop);
            isChange = true;
        }
        if(isChange){
            oldOp.removeUsed(this);
            usedList.remove(oldOp);
            newOp.addUsed(this);
            usedList.add(newOp);
        }
    }

    @Override
    public void replaceDefInst(RvRegister oldOp, RvRegister newOp) {

    }

    @Override
    public void removeAllUsed() {
        rd.removeUsed(this);
        usedList.remove(rd);
        rd.subSpill(isInLoop);
        if(dest instanceof RvRegister){
            ((RvRegister)dest).removeUsed(this);
            usedList.remove(dest);
            ((RvRegister)dest).subSpill(isInLoop);
        }
    }

    @Override
    public void removeAllDef() {

    }
}
