package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.*;
import llvm_IR.operand.*;
import llvm_IR.type.IRIntType;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IRType;

import java.util.*;

public class SSAConstructor extends PASS {
    private HashMap<IROperand, Stack<IROperand>> OpStack;

    public SSAConstructor(IRModule irModule){
        super(irModule);
    }

    public void run(){
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet())
            constructor(entry.getValue());

    }

    public void constructor(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        OpStack = new HashMap<>();
        insertPhi(function, bblockList);
        renameBlock(function.getEntryBBlock());
        for(var bblock : bblockList)
            bblock.mergePhiMap();
    }

    public void insertPhi(IRFunction function, ArrayList<IRBBlock> bblockList){
        for(var bblock : bblockList){
            ArrayList<IRInstruction> InstList = bblock.getInstList();
            for(IRInstruction Inst : InstList){
                if(Inst instanceof LoadInst){
                    if(!Inst.getRes().isUsed())
                        Inst.removeAll();
                }
                else if(Inst instanceof AllocaInst){
                    register address = Inst.getRes();
                    String Identifier = address.getIdentifier().split("\\$")[0];
                    IRType type = ((IRPointerType)address.getType()).getPointerType();
                    if(!address.isDefined())
                        Inst.removeAll();
                    HashSet<IRInstruction> defList = address.getDefInstruction();
                    HashSet<IRBBlock> visitedList = new HashSet<>();
                    HashSet<IRBBlock> phiList = new HashSet<>();
                    Queue<IRBBlock> queue = new LinkedList<>();
                    for(var def :defList){
                        if(def instanceof  StoreInst){
                            IRBBlock defBlock = def.getCurBBlock();
                            if(!visitedList.contains(defBlock)){
                                visitedList.add(defBlock);
                                queue.add(defBlock);
                            }
                        }
                    }
                    while(!queue.isEmpty()){
                        IRBBlock head = queue.poll();
                        HashSet<IRBBlock> dfList = head.getDfList();
                        for(var df : dfList){
                            if(!phiList.contains(df)){
                                register reg = new register(type, Identifier);
                                function.addRegs(reg);
                                PhiInst phiInst = new PhiInst(reg, new ArrayList<>(), new ArrayList<>());
                                df.addPhiInst(address, phiInst);
                                phiList.add(df);
                                queue.add(df);
                            }
                        }
                    }
                    OpStack.put(address, new Stack<>());
                    if(type instanceof IRIntType){
                        IRIntType tmpType = (IRIntType)type;
                        int bytes = tmpType.bytes();
                        if(bytes == 32)
                            push(address, new constInt(0));
                        else if(bytes == 1)
                            push(address, new constBool(false));
                        else
                            push(address, new constNull());
                    }
                    else
                        push(address, new constNull());
                    Inst.removeAll();
                }
            }
        }
    }

    public boolean isEmpty(IROperand address){
        return OpStack.get(address).empty();
    }

    public void push(IROperand address, IROperand res){
        OpStack.get(address).push(res);
    }

    public void pop(IROperand address){
        OpStack.get(address).pop();
    }

    public IROperand top(IROperand address){
        Stack<IROperand> tmp = OpStack.get(address);
        return tmp.peek();
    }

    public boolean contain(IROperand address){
        return OpStack.containsKey(address);
    }

    public void renameBlock(IRBBlock bblock){
        LinkedHashMap<register, PhiInst> phiMap = bblock.getPhiMap();
        for(var entry : phiMap.entrySet()){
            register address = entry.getKey();
            PhiInst phiInst = entry.getValue();
            push(address, phiInst.getRes());
        }
        ArrayList<IRInstruction> InstList = bblock.getInstList();
        for(var Inst : InstList){
            if(Inst instanceof LoadInst){
                IROperand address = ((LoadInst)Inst).getPtr();
                register reg = Inst.getRes();
                if(contain(address))
                    reg.replaceUsedInst(top(address));
            }
            else if(Inst instanceof StoreInst){
                IROperand address = ((StoreInst)Inst).getPtr();
                IROperand value = ((StoreInst)Inst).getValue();
                if(contain(address))
                    push(address, value);
            }
        }
        ArrayList<IRBBlock> succBBlocks = bblock.getSuccBBlock();
        for(var succBBlock : succBBlocks){
            LinkedHashMap<register, PhiInst> succPhiMap = succBBlock.getPhiMap();
            for (var entry : succPhiMap.entrySet()){
                register address = entry.getKey();
                PhiInst phiInst = entry.getValue();
                if(!isEmpty(address))
                    phiInst.addEntry(top(address), bblock);
            }
        }

        ArrayList<IRBBlock> dominateList = bblock.getDominateList();
        for(var dominate : dominateList)
            renameBlock(dominate);

        for(var Inst : InstList){
            if(Inst instanceof LoadInst){
                IROperand address = ((LoadInst)Inst).getPtr();
                if(contain(address))
                    Inst.removeAll();
            }
            else if(Inst instanceof StoreInst){
                IROperand address = ((StoreInst)Inst).getPtr();
                if(contain(address)){
                    pop(address);
                    Inst.removeAll();
                }
            }
        }
        for(var entry : phiMap.entrySet()){
            register address = entry.getKey();
            pop(address);
        }
    }
}
