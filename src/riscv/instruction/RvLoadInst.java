package riscv.instruction;

import riscv.RvBBlock;
import riscv.RvVisitor;
import riscv.operand.RvOperand;
import riscv.operand.RvRegister;
import riscv.operand.imm;
import riscv.operand.spSlot;

public class RvLoadInst extends RvInstruction {
    private RvOperand src;
    private RvRegister rd;
    private imm imm;

    public RvLoadInst(RvBBlock curBBlock, RvRegister rd, RvOperand src, imm imm) {
        super(curBBlock);
        this.rd = rd;
        this.src = src;
        this.imm = imm;
    }

    public spSlot getSpSlot(){
        if(src instanceof spSlot){
            return (spSlot)src;
        }
        else
            return null;
    }

    @Override
    public void init() {
        addDef(rd);
        rd.addDef(this);
        rd.addSpill(isInLoop);
        if(src instanceof RvRegister){
            addUsed((RvRegister)src);
            ((RvRegister)src).addUsed(this);
            ((RvRegister)src).addSpill(isInLoop);
        }
    }

    @Override
    public String toString() {
        if (src instanceof spSlot)
            return "\tlw      " + rd + "," + src;
        else
            return "\tlw      " + rd + "," + imm + "(" + src + ")";
    }

    @Override
    public void accept(RvVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public void replaceUsedInst(RvRegister oldOp, RvRegister newOp) {
        if(src instanceof RvRegister && src == oldOp){
            oldOp.removeUsed(this);
            usedList.remove(oldOp);
            oldOp.subSpill(isInLoop);
            src = newOp;
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
            rd = newOp;
            newOp.addDef(this);
            defList.add(newOp);
            newOp.addSpill(isInLoop);
        }
    }

    @Override
    public void removeAllUsed() {
        if(src instanceof RvRegister){
            ((RvRegister)src).removeUsed(this);
            usedList.remove(src);
            ((RvRegister)src).subSpill(isInLoop);
        }
    }

    @Override
    public void removeAllDef() {
        rd.removeDef(this);
        defList.remove(rd);
        rd.subSpill(isInLoop);
    }
}
