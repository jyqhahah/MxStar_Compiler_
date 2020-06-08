package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.CallInst;
import llvm_IR.instruction.IRInstruction;
import llvm_IR.instruction.LoadInst;
import llvm_IR.instruction.StoreInst;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;

public class peephole extends PASS {
    private boolean isChanged;
    private CSElimination cse;

    public peephole(IRModule irModule, CSElimination cse) {
        super(irModule);
        this.cse = cse;
    }

    public boolean run(){
        isChanged = false;
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            Peephole(entry.getValue());
        }
        return isChanged;
    }

    public void Peephole(IRFunction function){
        IRBBlock bblock = function.getEntryBBlock();
        while(bblock != null){
            ArrayList<IRInstruction> InstList = bblock.getInstList();
            for(var Inst : InstList){
                if(Inst instanceof LoadInst){
                    register loadReg = Inst.getRes(), loadPtr = (register)((LoadInst) Inst).getPtr();
                    IRInstruction prev = Inst.getPrevInst();
                    for(int i=0; i<10 && prev != null; ++i){
                        if(prev instanceof StoreInst){
                            register storePtr = (register)((StoreInst) prev).getPtr();
                            if(loadPtr == storePtr){
                                IROperand value = ((StoreInst) prev).getValue();
                                HashSet<IRInstruction> usedList = loadReg.getUsedInstruction();
                                for(var used : usedList)
                                    used.replaceUsedInst(loadReg, value);
                                isChanged = true;
                                Inst.removeAll();
                                break;
                            }
                            else if(cse.preAlias(storePtr, loadPtr)) break;
                        }
                        else if(prev instanceof CallInst) break;
                        prev = prev.getPrevInst();
                    }
                }
            }
            bblock = bblock.getNext();
        }
    }
}
