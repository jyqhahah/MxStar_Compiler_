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

    public ArrayList<IROperand> getOperands() {
        return operands;
    }

    public ArrayList<IRBBlock> getBblocks() {
        return bblocks;
    }

    @Override
    public register getRes() {
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

    @Override
    public void initDefAndUsed() {
        reg.addDefInst(this);
        for(var op : operands)
            op.addUsedInst(this);
        for(var bblock : bblocks)
            bblock.addUsedPhiInst(this);
    }

    @Override
    public ArrayList<register> getUsedRegList() {
        ArrayList<register> regList = new ArrayList<>();
        for(var operand : operands){
            if(operand instanceof register)
                regList.add((register)operand);
        }
        return regList;
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

    public void removeUsedAllPhiInst(IRBBlock bblock){
        int index = bblocks.indexOf(bblock);
        if(index != -1){
            bblocks.remove(index);
            operands.remove(index);
        }
    }

    public void simplify(){
        if(bblocks.size() == 1){
            IROperand operand = operands.get(0);
            reg.replaceUsedInst(operand);
            IRBBlock bblock = bblocks.get(0);
            bblock.removeUsedPhiInst(this);
            removeAll();
        }
    }

    public void addEntry(IROperand operand, IRBBlock bblock){
        operands.add(operand);
        operand.addUsedInst(this);
        bblocks.add(bblock);
        bblock.addUsedPhiInst(this);
    }
}
