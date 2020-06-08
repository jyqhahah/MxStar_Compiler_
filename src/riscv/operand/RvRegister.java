package riscv.operand;

import riscv.instruction.RvInstruction;
import riscv.instruction.RvMoveInst;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;

public class RvRegister extends RvOperand {
    protected String Identifier;
    protected boolean isSpilled;
    protected HashSet<RvInstruction> usedList, defList;
    protected RvPhyReg isPhyReg;
    private ArrayList<RvMoveInst> moveInstList;
    private int degree;
    private double spill;
    private RvRegister alias;
    private LinkedHashSet<RvRegister> adjRegList;


    public RvRegister(String Identifier){
        this.Identifier = Identifier;
        this.isSpilled = false;
        this.usedList = new HashSet<>();
        this.defList = new HashSet<>();
        this.isPhyReg = null;
        this.moveInstList = new ArrayList<>();
        this.degree = 0;
        this.spill = 0;
        this.alias = this;
        this.adjRegList = new LinkedHashSet<>();
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public void addUsed(RvInstruction Inst){
        usedList.add(Inst);
    }

    public void addDef(RvInstruction Inst){
        defList.add(Inst);
    }

    public void removeDef(RvInstruction Inst){
        defList.remove(Inst);
    }

    public void removeUsed(RvInstruction Inst){
        usedList.remove(Inst);
    }

    public HashSet<RvInstruction> getUsedList() {
        return usedList;
    }

    public HashSet<RvInstruction> getDefList() {
        return defList;
    }

    public boolean isSpilled() {
        return isSpilled;
    }

    public void setSpilled() {
        this.isSpilled = true;
    }

    public void addMoveInst(RvMoveInst Inst){
        moveInstList.add(Inst);
    }

    public void addAdjReg(RvRegister Reg){
        adjRegList.add(Reg);
    }

    public ArrayList<RvMoveInst> getMoveInstList(){
        return moveInstList;
    }

    public LinkedHashSet<RvRegister> getAdjRegList(){
        return adjRegList;
    }

    public int getDegree() {
        return degree;
    }

    public void setDegree(int degree) {
        this.degree = degree;
    }

    public void addDegree(){
        degree++;
    }

    public void subDegree(){
        degree--;
    }

    public double getSpill() {
        return spill/degree;
    }

    public void addSpill(boolean isInLoop){
        if(isInLoop)
            spill += 100;
        else
            spill += 1;
    }

    public void subSpill(boolean isInLoop){
        if(isInLoop)
            spill -= 100;
        else
            spill -= 1;
    }

    public RvPhyReg getIsPhyReg() {
        return isPhyReg;
    }

    public void setIsPhyReg(RvPhyReg isPhyReg) {
        this.isPhyReg = isPhyReg;
    }

    public void setAlias(RvRegister alias) {
        this.alias = alias;
    }

    public RvRegister getAlias() {
        return alias;
    }

    public void clearColor(){
        this.moveInstList = new ArrayList<>();
        this.adjRegList = new LinkedHashSet<>();
        this.degree = 0;
        this.alias = this;
        this.isPhyReg = null;
    }

    @Override
    public String toString() {
        return isPhyReg == null ? Identifier : isPhyReg.getIdentifier();
    }
}
