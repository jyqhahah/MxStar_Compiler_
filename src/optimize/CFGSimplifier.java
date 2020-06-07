package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.BranchInst;
import llvm_IR.instruction.IRInstruction;
import llvm_IR.instruction.PhiInst;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.constBool;

import java.util.*;

public class CFGSimplifier extends PASS {
    private boolean isChanged;

    public CFGSimplifier(IRModule irModule){
        super(irModule);
    }

    public boolean run(){
        isChanged = false;
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            removeSinglePhi(entry.getValue());
            removeConstBranch(entry.getValue());
            removeUnusedBBlock(entry.getValue());
        }
        return isChanged;
    }

    public void removeSinglePhi(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(IRBBlock bblock : bblockList){
            IRInstruction Inst = bblock.getHead();
            while(Inst instanceof PhiInst){
                ((PhiInst)Inst).simplify();
                Inst = Inst.getNext();
            }
        }
    }

    public void removeConstBranch(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(var bbblock : bblockList){
            IRInstruction Rear = bbblock.getRear();
            if(Rear instanceof BranchInst){
                IROperand cond = ((BranchInst)Rear).getCond();
                if(cond instanceof constBool){
                    if(((constBool)cond).getValue())
                        ((BranchInst)Rear).setTrue();
                    else
                        ((BranchInst)Rear).setFalse();
                }
            }
        }
    }

    public void removeUnusedBBlock(IRFunction function){
        IRBBlock entryBBlock = function.getEntryBBlock();
        Queue<IRBBlock> queue = new LinkedList<>();
        HashSet<IRBBlock> visitor = new HashSet<>();
        visitor.add(entryBBlock);
        queue.add(entryBBlock);
        while(!queue.isEmpty()){
            IRBBlock head = queue.poll();
            ArrayList<IRBBlock> succBBlock = head.getSuccBBlock();
            if(succBBlock.size() == 1 && succBBlock.get(0).getPrevBBlock().size() == 1){
                IRBBlock succ = succBBlock.get(0);
                head.unionBBlock(succ);
                isChanged = true;
                queue.offer(head);
                continue;
            }
            for(var succ : succBBlock){
                if(!visitor.contains(succ)){
                    visitor.add(succ);
                    queue.offer(succ);
                }
            }
        }
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(IRBBlock irbBlock : bblockList){
            if(!visitor.contains(irbBlock)){
                irbBlock.removeAll();
                irbBlock.removeAllInst();
                irbBlock.removeAllUsedPhi();
                isChanged = true;
            }
        }
    }
}
