package llvm_IR.instruction;

import llvm_IR.IRBBlock;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

import java.util.ArrayList;

public class PhiInst extends IRInstruction {
    private register reg;
    private ArrayList<IRBBlock> bblocks;
    private ArrayList<IROperand> operands;

    public PhiInst(register reg, ArrayList<IRBBlock> bblocks, ArrayList<IROperand> operands){
        super();
        this.reg = reg;
        this.bblocks = bblocks;
        this.operands = operands;
        for(var bblock : bblocks)
            bblock.addUsedPhiInst(this);
        for(var operand : operands)
            operand.addUsedInst(this);
    }


    @Override
    public String toString() {
        StringBuilder str = new StringBuilder();
        str.append(reg.toString()).append(" = phi ").append(reg.getType().toString()).append(" ");
        int cnt;
        for(cnt = 0; cnt < operands.size(); ++cnt){
            str.append(" [ ").append(operands.get(cnt).toString())
                    .append(", ").append(bblocks.get(cnt).toString()).append(" ]");
            if(cnt != operands.size()-1)
                str.append(", ");
        }
        return str.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public IROperand getRes() {
        return reg;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        boolean flag = true;
        for(int i=0; i<operands.size(); ++i){
            if(operands.get(i) == oldOp){
                operands.set(i, newOp);
                flag = false;
            }
        }
        if(!flag) newOp.addUsedInst(this);
    }

    @Override
    public void removeAllUsed() {
        for(var operand : operands){
            operand.removeUsedInst(this);
        }
        for(var bblock : bblocks)
            bblock.removeUsedPhiInst(this);
    }

    @Override
    public void removeAllDef() {

    }

    public void replacePhiUsedInst(IRBBlock oldBBlock, IRBBlock newBBlock){
        boolean flag = true;
        for(int i = 0; i<bblocks.size(); ++i){
            if(bblocks.get(i) == oldBBlock){
                bblocks.set(i, newBBlock);
                flag = false;
            }
        }
        if(!flag) newBBlock.addUsedPhiInst(this);
    }

    public void removeUsedAllPhiInst(){
        for(var bblock : bblocks){
            bblock.removeUsedPhiInst(this);
        }
    }

    public void addEntry(IROperand operand, IRBBlock bblock){
        operands.add(operand);
        operand.addUsedInst(this);
        bblocks.add(bblock);
        bblock.addUsedPhiInst(this);
    }
}
