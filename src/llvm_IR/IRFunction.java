package llvm_IR;

import llvm_IR.operand.register;
import llvm_IR.type.IRType;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class IRFunction {
    private IRType type;
    private String Identifier;
    private IRBBlock entryBBlock, exitBBlock;
    private ArrayList<register> paras;
    private LinkedHashMap<String, ArrayList<register>> registerList;
    private LinkedHashMap<String, ArrayList<IRBBlock>> bblockList;


    public IRFunction(IRType type, String Identifier, ArrayList<register> paras){
        this.type = type;
        this.Identifier = Identifier;
        this.entryBBlock = this.exitBBlock = null;
        this.paras = paras;
        this.registerList = new LinkedHashMap<>();
        this.bblockList = new LinkedHashMap<>();
    }

    public String toString(){
        return "@"+Identifier;
    }

    public void addRegs(register reg){
        String Id = reg.getIdentifier();
        if(!registerList.containsKey(Id))
            registerList.put(Id, new ArrayList<>());
        ArrayList<register>tmp = registerList.get(Id);
        reg.setIdentifier(Id + "." + String.valueOf(tmp.size()));
        tmp.add(reg);
    }

    public void addBBlocks(IRBBlock bblock){
        //System.out.println(1);
        String Id = bblock.getIdentifier();
        if(!bblockList.containsKey(Id))
            bblockList.put(Id, new ArrayList<>());
        ArrayList<IRBBlock>tmp = bblockList.get(Id);
        bblock.setIdentifier(Id+"."+String.valueOf(tmp.size()));
        tmp.add(bblock);
        bblock.setCurFunct(this);
        //System.out.println(2);
        if(entryBBlock != null){
            bblock.setPrev(exitBBlock);
            exitBBlock.setNext(bblock);
            exitBBlock = bblock;
        }
        else {
            entryBBlock = bblock;
            exitBBlock = bblock;
        }
    }

    public void addParas(register para){
        paras.add(para);
    }

    public ArrayList<register> getParas() {
        return paras;
    }

    public register getRegister(String Identifier){
        return registerList.get(Identifier).get(0);
    }

    public ArrayList<IRBBlock> getBBlockArray(){
        ArrayList<IRBBlock> bblockArray = new ArrayList<>();
        IRBBlock bblock = entryBBlock;
        while(bblock != null){
            bblockArray.add(bblock);
            bblock = bblock.getNext();
        }
        return bblockArray;
    }

    public IRType getType() {
        return type;
    }

    public IRBBlock getEntryBBlock() {
        return entryBBlock;
    }

    public IRBBlock getExitBBlock() {
        return exitBBlock;
    }

    public void setEntryBBlock(IRBBlock entryBBlock) {
        this.entryBBlock = entryBBlock;
    }

    public void setExitBBlock(IRBBlock exitBBlock) {
        this.exitBBlock = exitBBlock;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public String def2String(boolean defOrDec){
        String def_dec = (defOrDec)?"define ":"declare ";
        StringBuilder str = new StringBuilder(def_dec);
        str.append(type.toString()).append(" @").append(Identifier).append("(");
        int cnt = 0;
        for(var tmp : paras){
            str.append(tmp.getType().toString()).append(" ").append(tmp.toString());
            ++cnt;
            if(cnt != paras.size())
                str.append(", ");
        }
        str.append(")");
        return str.toString();
    }

    public void accept(IRVisitor visitor){
        visitor.visit(this);
    }
}
