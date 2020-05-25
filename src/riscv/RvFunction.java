package riscv;

import riscv.instruction.RvIInst;
import riscv.instruction.RvInstruction;
import riscv.operand.*;

import java.util.ArrayList;
import java.util.LinkedHashSet;

public class RvFunction {
    private String Identifier;
    private int paras;
    private ArrayList<RvRegister> regList;
    private RvBBlock entryBBlock, exitBBlock;
    private ArrayList<RvBBlock> bblockList;
    private ArrayList<spSlot> spillList;
    private ArrayList<ArrayList<spSlot>> callList;

    public RvFunction(String Identifier, int paras){
        this.Identifier = Identifier;
        this.paras = paras;
        this.regList = new ArrayList<>();
        this.entryBBlock = this.exitBBlock = null;
        this.bblockList = new ArrayList<>();
        this.spillList = new ArrayList<>();
        this.callList = new ArrayList<>();
    }

    public void setEntryBBlock(RvBBlock entryBBlock) {
        this.entryBBlock = entryBBlock;
    }

    public void setExitBBlock(RvBBlock exitBBlock) {
        this.exitBBlock = exitBBlock;
    }

    public RvBBlock getEntryBBlock() {
        return entryBBlock;
    }

    public RvBBlock getExitBBlock() {
        return exitBBlock;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public ArrayList<RvRegister> getRegList() {
        return regList;
    }

    public ArrayList<RvBBlock> getBBlockList() {
        return bblockList;
    }

    public int getParas() {
        return paras;
    }

    public void addBBlock(RvBBlock bBlock){
        bblockList.add(bBlock);
    }

    public void addSpillSlot(spSlot slot){
        spillList.add(slot);
    }

    public void addCallSlot(ArrayList<spSlot> slotList){
        callList.add(slotList);
    }

    public ArrayList<RvBBlock> dfs(){
        ArrayList<RvBBlock> order = new ArrayList<>();
        LinkedHashSet<RvBBlock> visitor = new LinkedHashSet<>();
        entryBBlock.dfs(order, visitor);
        return order;
    }

    public RvVirReg newVirReg(String Identifier){
        String Id = Identifier+"_"+ regList.size();
        RvVirReg VirReg = new RvVirReg(Id);
        regList.add(VirReg);
        return VirReg;
    }

    public int spSlotAlloca(){
        int max_size = 0;
        for(var slotList : callList){
            if(max_size < slotList.size())
                max_size = slotList.size();
        }
        int size = max_size + spillList.size();
        size = (size+3)/4*4;
        if(size>0){
            RvInstruction entryInst = new RvIInst(entryBBlock, RvIInst.i_op.addi, RegisterList.sp, RegisterList.sp, new imm(-size<<2)),
                        exitInst = new RvIInst(entryBBlock, RvIInst.i_op.addi, RegisterList.sp, RegisterList.sp, new imm(size << 2));
            entryBBlock.addPrev(entryBBlock.getHead(), entryInst);
            exitBBlock.addPrev(exitBBlock.getRear(), exitInst);
        }
        return size;
    }

    public void accept(RvVisitor visitor){
        visitor.visit(this);
    }
}
