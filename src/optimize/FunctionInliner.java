package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.*;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;
import llvm_IR.operand.string;
import llvm_IR.operand.variable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;

public class FunctionInliner extends PASS {
    private boolean changed;
    private HashMap<IRFunction, Integer> InstNumbers;
    private HashMap<IRFunction, ArrayList<CallInst>> CallMap;
    private HashMap<IRFunction, Integer> InStack;
    private HashSet<IRFunction> RecurSet;
    private ArrayList<IRFunction> dfsList;
    private HashSet<IRFunction> visited;
    private HashMap<IROperand, IROperand> regRenamer;
    private HashMap<IRBBlock, IRBBlock> bblockRenamer;
    private ArrayList<IRFunction> functStack;
    private static int maxInstNumber = 999, maxDepth = 1;

    public FunctionInliner(IRModule irModule) {
        super(irModule);
    }

    public boolean run(){
        changed = false;
        InstNumbers = new HashMap<>();
        CallMap = new HashMap<>();
        InStack = new HashMap<>();
        RecurSet = new HashSet<>();
        dfsList = new ArrayList<>();
        visited = new HashSet<>();
        functStack = new ArrayList<>();
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            visit(entry.getValue());
        }
        IRFunction main = irModule.getMain();
        dfsRecursive(main);
        while(true){
            boolean isChanged = false;
            for(int i=dfsList.size()-1; i>=0; --i){
                IRFunction function = dfsList.get(i);
                ArrayList<CallInst> callList = CallMap.get(function);
                for(var callInst : callList){
                    IRFunction callee = callInst.getFunct();
                    if(!RecurSet.contains(callee) && InstNumbers.get(callee) + InstNumbers.get(function) < maxInstNumber && !callInst.isInLined()){
                        inline(function, callee, callInst);
                        callInst.setInLined();
                        InstNumbers.put(function, InstNumbers.get(function)+InstNumbers.get(callee));
                        isChanged = true;
                    }
                }
            }
            if(!isChanged)
                break;
        }
        for(int i = 0; i<maxDepth; ++i){
            for(int j = dfsList.size()-1; j>=0; --j){
                IRFunction function = dfsList.get(j);
                ArrayList<CallInst> callList = CallMap.get(function);
                for(var callInst : callList){
                    IRFunction callee = callInst.getFunct();
                    if(RecurSet.contains(callee) && InstNumbers.get(callee) + InstNumbers.get(function) < maxInstNumber && !callInst.isInLined() && callee != function){
                        inline(function, callee, callInst);
                        callInst.setInLined();
                        InstNumbers.put(function, InstNumbers.get(function)+InstNumbers.get(callee));
                    }
                }
            }
        }
        dfsCallee(irModule.getMain());
        ArrayList<IRFunction> tmpList = new ArrayList<>();
        for(var funct : functList.entrySet()){
            tmpList.add(funct.getValue());
        }
        for(var funct : tmpList){
            if(!visited.contains(funct)){
                IRBBlock bblock = funct.getEntryBBlock();
                while(bblock != null){
                    ArrayList<IRInstruction> InstList = bblock.getInstList();
                    for(var Inst : InstList)
                        Inst.removeAll();
                    bblock = bblock.getNext();
                }
                irModule.getFunctList().remove(funct.getIdentifier().substring(1));
                changed = true;
            }
        }
        return changed;
    }

    public void visit(IRFunction function){
        int i = 0;
        ArrayList<CallInst> callList = new ArrayList<>();
        IRBBlock bblock = function.getEntryBBlock();
        while(bblock != null){
            IRInstruction Inst = bblock.getHead();
            while(Inst != null){
                i++;
                if(Inst instanceof CallInst){
                    IRFunction callee = ((CallInst)Inst).getFunct();
                    if(!irModule.getBuiltInFunctList().containsValue(callee))
                        callList.add((CallInst)Inst);
                }
                Inst = Inst.getNext();
            }
            bblock = bblock.getNext();
        }
        InstNumbers.put(function, i);
        CallMap.put(function, callList);
        InStack.put(function, 0);
    }

    public void dfsRecursive(IRFunction function){
        dfsList.add(function);
        InStack.put(function, 1);
        functStack.add(function);
        ArrayList<CallInst> CallList = CallMap.get(function);
        for(var callInst : CallList){
            IRFunction callee = callInst.getFunct();
            if(InStack.get(callee) == 0)
                dfsRecursive(callee);
            else if(InStack.get(callee) == 1){
                RecurSet.add(callee);
                for(int i = functStack.size()-1; i>=0; --i){
                    RecurSet.add(functStack.get(i));
                    if(functStack.get(i) == callee)
                        break;
                }
            }
        }
        functStack.remove(functStack.size()-1);
        InStack.put(function, 2);
    }

    public IROperand renamer(IRFunction caller, IROperand operand){
        if(operand instanceof variable || operand instanceof string)
            return operand;
        if(operand instanceof register){
            if(regRenamer.containsKey(operand))
                return regRenamer.get(operand);
            register reg = new register(operand.getType(), ((register)operand).getIdentifier().split("\\.")[0]);
            caller.addRegs(reg);
            regRenamer.put(operand, reg);
            return reg;
        }
        return operand;
    }

    public void inline(IRFunction caller, IRFunction callee, CallInst callInst){
        regRenamer = new HashMap<>();
        bblockRenamer = new HashMap<>();
        changed = true;
        IRBBlock curBBlock = callInst.getCurBBlock();
        IRBBlock spillBBlock = curBBlock.spill(callInst);
        ArrayList<IRBBlock> bblockList = callee.getBBlockArray();
        for(var bblock : bblockList){
            IRBBlock newBBlock = new IRBBlock(bblock.getIdentifier().split("\\.")[0]);
            caller.addBBlocks(newBBlock);
            bblockRenamer.put(bblock, newBBlock);
        }
        IRBBlock entryBBlock = bblockRenamer.get(callee.getEntryBBlock());
        IRBBlock exitBBlock = bblockRenamer.get(callee.getExitBBlock());
        curBBlock.addInst(new BranchInst(entryBBlock, curBBlock));
        ArrayList<register> paraList = callee.getParas();
        ArrayList<IROperand> argueList = callInst.getParas();
        for(int i=0; i<paraList.size(); ++i)
            regRenamer.put(paraList.get(i), argueList.get(i));
        for(var bblock : bblockList){
            IRBBlock renameBBlock = bblockRenamer.get(bblock);
            IRInstruction Inst = bblock.getHead();
            while(Inst != null){
                if(Inst instanceof AllocaInst)
                    renameBBlock.addInst(new AllocaInst(((AllocaInst)Inst).getType(), (register)renamer(caller, Inst.getRes())));
                else if(Inst instanceof BinOpInst)
                    renameBBlock.addInst(new BinOpInst(renamer(caller, ((BinOpInst)Inst).getLeft()), renamer(caller, ((BinOpInst)Inst).getRight()), (register)renamer(caller, Inst.getRes()), ((BinOpInst)Inst).getType()));
                else if(Inst instanceof BitCastInst)
                    renameBBlock.addInst(new BitCastInst(renamer(caller, ((BitCastInst)Inst).getSrc()), (register)renamer(caller, Inst.getRes())));
                else if(Inst instanceof BranchInst){
                    IROperand cond = ((BranchInst)Inst).getCond();
                    if(cond == null)
                        renameBBlock.addInst(new BranchInst(bblockRenamer.get(((BranchInst)Inst).getTrueBBlock()), renameBBlock));
                    else {
                        renameBBlock.addInst(new BranchInst(bblockRenamer.get(((BranchInst)Inst).getTrueBBlock()), bblockRenamer.get(((BranchInst)Inst).getFalseBBlock()), renamer(caller, cond), renameBBlock));
                    }
                }
                else if(Inst instanceof CallInst){
                    ArrayList<IROperand> oldArgueList = ((CallInst)Inst).getParas();
                    ArrayList<IROperand> newArgueList = new ArrayList<>();
                    for(var argue : oldArgueList)
                        newArgueList.add(renamer(caller, argue));
                    register reg = Inst.getRes();
                    if(reg == null)
                        renameBBlock.addInst(new CallInst(((CallInst)Inst).getFunct(), newArgueList, null));
                    else
                        renameBBlock.addInst(new CallInst(((CallInst)Inst).getFunct(), newArgueList, (register)renamer(caller, reg)));
                }
                else if(Inst instanceof GetElemPtrInst){
                    ArrayList<IROperand> oldArgueList = ((GetElemPtrInst)Inst).getIndex();
                    ArrayList<IROperand> newArgueList = new ArrayList<>();
                    for(var argue : oldArgueList)
                        newArgueList.add(renamer(caller, argue));
                    renameBBlock.addInst(new GetElemPtrInst((register)renamer(caller, Inst.getRes()), renamer(caller, ((GetElemPtrInst)Inst).getPtr()),newArgueList));
                }
                else if(Inst instanceof IcmpInst)
                    renameBBlock.addInst(new IcmpInst(renamer(caller, ((IcmpInst)Inst).getLeft()), renamer(caller, ((IcmpInst)Inst).getRight()), (register)renamer(caller, Inst.getRes()), ((IcmpInst)Inst).getType()));
                else if(Inst instanceof LoadInst)
                    renameBBlock.addInst(new LoadInst((register)renamer(caller, Inst.getRes()), renamer(caller, ((LoadInst)Inst).getPtr())));
                else if(Inst instanceof MoveInst)
                    renameBBlock.addInst(new MoveInst((register)renamer(caller, Inst.getRes()), renamer(caller, ((MoveInst)Inst).getSrc())));
                else if(Inst instanceof PhiInst){
                    ArrayList<IROperand> oldOpList = ((PhiInst)Inst).getOperands();
                    ArrayList<IROperand> newOpList = new ArrayList<>();
                    ArrayList<IRBBlock> oldBBList = ((PhiInst)Inst).getBblocks();
                    ArrayList<IRBBlock> newBBList = new ArrayList<>();
                    for(int i=0; i< oldOpList.size(); ++i){
                        newOpList.add(renamer(caller, oldOpList.get(i)));
                        newBBList.add(bblockRenamer.get(oldBBList.get(i)));
                    }
                    renameBBlock.addInst(new PhiInst((register)renamer(caller, Inst.getRes()), newBBList, newOpList));
                }
                else if(Inst instanceof StoreInst)
                    renameBBlock.addInst(new StoreInst(renamer(caller, ((StoreInst)Inst).getValue()), renamer(caller, ((StoreInst)Inst).getPtr())));
                else if(Inst instanceof RetInst){
                    IROperand value = ((RetInst)Inst).getValue();
                    if(value != null){
                        value = renamer(caller, value);
                        register reg = callInst.getRes();
                        HashSet<IRInstruction> usedList = reg.getUsedInstruction();
                        for(var used : usedList)
                            used.replaceUsedInst(reg, value);
                    }
                    exitBBlock.addInst(new BranchInst(spillBBlock, exitBBlock));
                }
                Inst = Inst.getNext();
            }
        }
    }

    public void dfsCallee(IRFunction function){
        visited.add(function);
        IRBBlock bblock = function.getEntryBBlock();
        while(bblock != null){
            IRInstruction Inst = bblock.getHead();
            while(Inst != null){
                if(Inst instanceof CallInst){
                    IRFunction callee = ((CallInst)Inst).getFunct();
//                    if(callee.getIdentifier().contains("getInt")){
//                        int i= 1;
//                    }
                    if(!visited.contains(callee)) {
                        dfsCallee(callee);
                    }
                }
                Inst = Inst.getNext();
            }
            bblock = bblock.getNext();
        }
    }
}
