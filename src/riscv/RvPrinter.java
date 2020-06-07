package riscv;

import riscv.instruction.*;
import riscv.operand.RvString;
import riscv.operand.RvVariable;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

public class RvPrinter implements RvVisitor {
    private PrintWriter printWriter;

    public RvPrinter() throws FileNotFoundException {
        printWriter = new PrintWriter(new FileOutputStream("test/test.s"));
        //printWriter = new PrintWriter(System.out);
        //printWriter = new PrintWriter(new FileOutputStream("output.s"));
    }

    @Override
    public void visit(RvBInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvCallInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvCmpzInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvJInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvJrInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvLaInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvLiInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvIInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvLoadInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvLuiInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvMoveInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvRInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvStoreInst node) {
        printWriter.println(node);
    }

    @Override
    public void visit(RvVariable node) {
        printWriter.println("\t.globl  "+node);
        printWriter.println("\t.p2align	2");
        printWriter.println(node+":");
        if(node.getValue() == null)
            printWriter.println("\t.word   0\n");
        else
            printWriter.println("\t.word   "+node.getValue()+"\n");
    }

    @Override
    public void visit(RvString node) {
        printWriter.println("\t.globl  "+node);
        printWriter.println(node+":");
        printWriter.println("\t.asciz  "+node.getStr()+"\n");
    }

    @Override
    public void visit(RvInstruction node) {

    }

    @Override
    public void visit(RvBBlock node) {
        if(!node.getIdentifier().contains("entryBBlock"))
            printWriter.println(node.getIdentifier()+":");
        RvInstruction Inst = node.getHead();
        while(Inst != null){
            Inst.accept(this);
            Inst = Inst.getNext();
        }
        printWriter.println("");
    }

    @Override
    public void visit(RvFunction node) {
        printWriter.println("\t.globl  " + node.getIdentifier());
        printWriter.println("\t.p2align	2");
        printWriter.println("\t.type   " + node.getIdentifier() + ", @function");
        printWriter.println(node.getIdentifier() + ":");
        ArrayList<RvBBlock> bBlockList = node.getBBlockList();
        for (var bblock : bBlockList)
            bblock.accept(this);
        printWriter.println("");
    }

    @Override
    public void visit(RvModule node) {
        ArrayList<RvVariable> varList = node.getVarList();
        ArrayList<RvString> strList = node.getStrList();
        if(!strList.isEmpty() || !varList.isEmpty()){
            printWriter.println("\t.data\n");
            for(var str : strList)
                str.accept(this);
            for(var var : varList)
                var.accept(this);
            printWriter.println("");
        }
        printWriter.println("\t.text\n");
        ArrayList<RvFunction> FunctList = node.getFunctList();
        for(var funct : FunctList)
            funct.accept(this);
        printWriter.close();
    }
}
