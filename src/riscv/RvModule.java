package riscv;

import riscv.operand.RvString;
import riscv.operand.RvVariable;

import java.util.ArrayList;

public class RvModule {
    private ArrayList<RvFunction> FunctList;
    private ArrayList<RvVariable> varList;
    private ArrayList<RvString> strList;

    public RvModule(){
        FunctList = new ArrayList<>();
        varList = new ArrayList<>();
        strList = new ArrayList<>();
    }

    public ArrayList<RvFunction> getFunctList() {
        return FunctList;
    }

    public ArrayList<RvVariable> getVarList() {
        return varList;
    }

    public ArrayList<RvString> getStrList() {
        return strList;
    }

    public void addFunct(RvFunction funct){
        FunctList.add(funct);
    }

    public void addVar(RvVariable var){
        varList.add(var);
    }

    public void addStr(RvString str){
        strList.add(str);
    }

    public void accept(RvVisitor visitor){
        visitor.visit(this);
    }
}
