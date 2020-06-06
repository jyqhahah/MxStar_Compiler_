package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.*;
import llvm_IR.operand.register;

import java.util.*;

public class DCE extends PASS {
    private Queue<IRInstruction> workList;
    private LinkedHashSet<IRInstruction> markedList;
    private LinkedHashSet<IRBBlock> visited;


    public DCE(IRModule irModule) {
        super(irModule);
    }

    public void run(){
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            visit(entry.getValue());
        }
    }

    public void visit(IRFunction function){
        workList = new LinkedList<>();
        markedList = new LinkedHashSet<>();
        visited = new LinkedHashSet<>();
        ArrayList<IRBBlock> rdfsList = function.getRdfsList();
        for(var bblock : rdfsList){
            IRInstruction Inst = bblock.getRear();
            while(Inst != null){
                if(Inst instanceof StoreInst || Inst instanceof CallInst || Inst instanceof RetInst)
                    push(Inst);
                Inst = Inst.getPrev();
            }
        }
        while(!workList.isEmpty()){
            IRInstruction Inst = workList.poll();
            ArrayList<register> regList = Inst.getUsedRegList();
            for(var reg : regList){
                HashSet<IRInstruction> InstList = reg.getDefInstruction();
                for(var def : InstList)
                    push(def);
            }
            if(Inst instanceof PhiInst){
                ArrayList<IRBBlock> bblockList = ((PhiInst)Inst).getBblocks();
                for(var bblock : bblockList)
                    push(bblock.getRear());
            }
            IRBBlock curBBlock = Inst.getCurBBlock();
            if(!visited.contains(curBBlock)){
                visited.add(curBBlock);
                HashSet<IRBBlock> rdfList = Inst.getCurBBlock().getRdfList();
                for(var rdf : rdfList)
                    push(rdf.getRear());
            }
        }
        for(var bblock : rdfsList){
            ArrayList<IRInstruction> InstList = bblock.getInstList();
            for(var Inst : InstList){
                if(!markedList.contains(Inst)){
                    if(Inst instanceof BranchInst){
                        if(((BranchInst)Inst).getCond() != null){
                            ((BranchInst)Inst).replaceTF(bblock.getDom_ri());
                        }
                    }
                    else{
                        Inst.removeAll();
                    }
                }
            }
        }
    }

    public void push(IRInstruction Inst){
        if(!markedList.contains(Inst)){
            markedList.add(Inst);
            workList.offer(Inst);
        }
    }
}
