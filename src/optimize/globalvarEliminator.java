package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.AllocaInst;
import llvm_IR.instruction.IRInstruction;
import llvm_IR.instruction.StoreInst;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.constNull;
import llvm_IR.operand.register;
import llvm_IR.operand.variable;
import llvm_IR.type.IRPointerType;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;

public class globalvarEliminator extends PASS {
    public globalvarEliminator(IRModule irModule) {
        super(irModule);
    }

    public void run(){
        ArrayList<variable> removeList = new ArrayList<>();
        LinkedHashMap<String, variable> varList = irModule.getVarList();
        for(var entry : varList.entrySet()){
            variable var = entry.getValue();
            IRFunction function = null;
            boolean flag = true;
            HashSet<IRInstruction> usedList = var.getUsedInstruction();
            for(var used : usedList){
                IRFunction curFunct = used.getCurBBlock().getCurFunct();
                if(function == null)
                    function = curFunct;
                else if(function != curFunct){
                    flag = false;
                    break;
                }
            }
            if(flag){
                if(function == null)
                    removeList.add(var);
                else if(function.getIdentifier().equals("@main")){
                    removeList.add(var);
                    register reg = new register(var.getType(), var.getIdentifier()+"$");
                    IRBBlock entryBBlock = function.getEntryBBlock();
                    function.addRegs(reg);
                    IROperand operand = var.getInitValue();
                    if(operand != null && !(operand instanceof constNull)){
                        StoreInst storeInst = new StoreInst(operand, reg);
                        entryBBlock.addInstInHead(storeInst);
                    }
                    AllocaInst allocaInst = new AllocaInst(((IRPointerType)reg.getType()).getPointerType(), reg);
                    entryBBlock.addInstInHead(allocaInst);
                    for(var used : usedList){
                        used.replaceUsedInst(var, reg);
                    }
                }
            }
        }
        for(var var : removeList)
            irModule.getVarList().remove(var.getIdentifier());
    }
}
