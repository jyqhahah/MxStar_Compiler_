package llvm_IR;

import llvm_IR.instruction.*;
import llvm_IR.operand.*;
import llvm_IR.type.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class IRPrinter implements IRVisitor {
    private PrintWriter printWriter;
    String tab = new String("    ");

    public IRPrinter() throws FileNotFoundException {
        printWriter = new PrintWriter(new FileOutputStream("test/out.ll"));
        //printWriter = new PrintWriter(System.out);
    }

    @Override
    public void visit(IRType node) {

    }

    @Override
    public void visit(IRIntType node) {

    }

    @Override
    public void visit(IRClassType node) {
        printWriter.println(node.declarePrinter());
    }

    @Override
    public void visit(IRVoidType node) {

    }

    @Override
    public void visit(IRArrayType node) {

    }

    @Override
    public void visit(IRPointerType node) {

    }

    @Override
    public void visit(IRInstruction node) {

    }

    @Override
    public void visit(AllocaInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(BinOpInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(BranchInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(IcmpInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(StoreInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(LoadInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(CallInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(RetInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(BitCastInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(GetElemPtrInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(PhiInst node) {
        printWriter.println(tab+node.toString());
    }

    @Override
    public void visit(IROperand node) {

    }

    @Override
    public void visit(constInt node) {

    }

    @Override
    public void visit(constString node) {

    }

    @Override
    public void visit(constBool node) {

    }

    @Override
    public void visit(constNull node) {

    }

    @Override
    public void visit(register node) {

    }

    @Override
    public void visit(string node) {
        printWriter.println(node.declarePrinter());
    }

    @Override
    public void visit(variable node) {
        printWriter.println(node.declarePrinter());
    }

    @Override
    public void visit(IRBBlock node) {
        printWriter.println(node.getIdentifier()+":");
        IRInstruction Inst = node.getHead();
        while(Inst != null){
            Inst.accept(this);
            Inst = Inst.getNext();
        }
        printWriter.println("");
    }

    @Override
    public void visit(IRModule node) {
        LinkedHashMap<String, IRClassType> ClassList = node.getClassList();
        LinkedHashMap<String, variable> VarList = node.getVarList();
        LinkedHashMap<String, string> StringList = node.getStringList();
        LinkedHashMap<String, IRFunction> FunctList = node.getFunctList();
        LinkedHashMap<String, IRFunction> BulitInFunctList = node.getBuiltInFunctList();

        for(var entry : ClassList.entrySet()) entry.getValue().accept(this);
        if(!ClassList.isEmpty()) printWriter.println("");

        for(var entry : StringList.entrySet()) entry.getValue().accept(this);
        if(!StringList.isEmpty()) printWriter.println("");

        for(var entry : VarList.entrySet()) entry.getValue().accept(this);
        if(!VarList.isEmpty()) printWriter.println("");

        for(var entry : BulitInFunctList.entrySet()) printWriter.println(entry.getValue().def2String(false));
        if(!BulitInFunctList.isEmpty()) printWriter.println("");

        for(var entry : FunctList.entrySet()) entry.getValue().accept(this);
        if(!FunctList.isEmpty()) printWriter.close();
    }

    @Override
    public void visit(IRFunction node) {
        printWriter.println(node.def2String(true)+" {");
        ArrayList<IRBBlock>bblocks = node.getBBlockArray();
        for(var bblock : bblocks) bblock.accept(this);
        printWriter.println("}");
        printWriter.println("");
    }
}
