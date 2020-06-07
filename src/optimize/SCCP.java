package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.IRVisitor;
import llvm_IR.instruction.*;
import llvm_IR.operand.*;
import llvm_IR.type.*;

import java.util.*;

public class SCCP extends PASS implements IRVisitor {
    private Queue<IRBBlock> BBlockQueue;
    private Queue<register> regQueue;
    private boolean isChanged;

    public SCCP(IRModule irModule) {
        super(irModule);
    }

    public boolean run(){
        isChanged = false;
        visit(irModule);
        return isChanged;
    }

    @Override
    public void visit(IRType node) {

    }

    @Override
    public void visit(IRIntType node) {

    }

    @Override
    public void visit(IRClassType node) {

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
        markMutidefined(node.getRes());
    }

    @Override
    public void visit(BinOpInst node) {
        IROperand left = node.getLeft(), right = node.getRight();
        register reg = node.getRes();
        if(reg.status == register.Status.undefined){
            IRconst constLeft = getConst(left), constRight = getConst(right);
            if(constLeft != null && constRight != null){
                BinOpType bi_op = node.getType();
                if(bi_op == BinOpType.add)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()+((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.sub)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()-((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.mul)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()*((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.sdiv)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()/((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.srem)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()%((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.and)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()&((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.or)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()|((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.shl)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()<<((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.ashr)
                    markConstant(reg, new constInt(((constInt)constLeft).getValue()>>((constInt)constRight).getValue()));
                else if(bi_op == BinOpType.xor){
                    if(constLeft.getType() instanceof IRIntType){
                        int bytes = ((IRIntType)constLeft.getType()).bytes();
                        if(bytes == 32)
                            markConstant(reg, new constInt(((constInt)constLeft).getValue()^((constInt)constRight).getValue()));
                        else if(bytes == 1)
                            markConstant(reg, new constBool(((constBool)constLeft).getValue()^((constBool)constRight).getValue()));
                    }
                }
            }
            else if(isMultidefined(left) || isMultidefined(right))
                markMutidefined(reg);
        }
        else if(reg.status == register.Status.constant){
            if(isMultidefined(left) || isMultidefined(right))
                markMutidefined(reg);
        }
    }

    @Override
    public void visit(BranchInst node) {
        IROperand cond = node.getCond();
        if(cond == null)
            markExecutable(node.getTrueBBlock());
        else {
            constBool constCond = (constBool)getConst(cond);
            if(constCond != null){
                if(constCond.getValue())
                    markExecutable(node.getTrueBBlock());
                else
                    markExecutable(node.getFalseBBlock());
            }
            else{
                markExecutable(node.getTrueBBlock());
                markExecutable(node.getFalseBBlock());
            }
        }
    }

    @Override
    public void visit(IcmpInst node) {
        IROperand left = node.getLeft(), right = node.getRight();
        register reg = node.getRes();
        if(reg.status == register.Status.undefined){
            IRconst constLeft = getConst(left), constRight = getConst(right);
            if(constLeft != null && constRight != null){
                IcmpType cmp_op = node.getType();
                if(cmp_op == IcmpType.sgt)
                    markConstant(reg, new constBool(((constInt)constLeft).getValue()>((constInt)constRight).getValue()));
                else if(cmp_op == IcmpType.sge)
                    markConstant(reg, new constBool(((constInt)constLeft).getValue()>=((constInt)constRight).getValue()));
                else if(cmp_op == IcmpType.slt)
                    markConstant(reg, new constBool(((constInt)constLeft).getValue()<((constInt)constRight).getValue()));
                else if(cmp_op == IcmpType.sle)
                    markConstant(reg, new constBool(((constInt)constLeft).getValue()<=((constInt)constRight).getValue()));
                else if(cmp_op == IcmpType.eq){
                    if(constLeft instanceof constInt)
                        markConstant(reg, new constBool(((constInt)constLeft).getValue()==((constInt)constRight).getValue()));
                    else if(constLeft instanceof constBool)
                        markConstant(reg, new constBool(((constBool)constLeft).getValue()==((constBool)constRight).getValue()));
                }
                else if(cmp_op == IcmpType.ne){
                    if(constLeft instanceof constInt)
                        markConstant(reg, new constBool(((constInt)constLeft).getValue()!=((constInt)constRight).getValue()));
                    else if(constLeft instanceof constBool)
                        markConstant(reg, new constBool(((constBool)constLeft).getValue()!=((constBool)constRight).getValue()));
                }
            }
            else if(isMultidefined(left) || isMultidefined(right))
                markMutidefined(reg);
        }
        else if(reg.status == register.Status.constant){
            if(isMultidefined(left) || isMultidefined(right))
                markMutidefined(reg);
        }
    }

    @Override
    public void visit(StoreInst node) {

    }

    @Override
    public void visit(LoadInst node) {
        markMutidefined(node.getRes());
    }

    @Override
    public void visit(CallInst node) {
        if(node.getRes() != null)
            markMutidefined(node.getRes());
    }

    @Override
    public void visit(RetInst node) {

    }

    @Override
    public void visit(BitCastInst node) {
        markMutidefined(node.getRes());
    }

    @Override
    public void visit(GetElemPtrInst node) {
        markMutidefined(node.getRes());
    }

    @Override
    public void visit(PhiInst node) {
        register reg = node.getRes();
        ArrayList<IROperand> opList = node.getOperands();
        ArrayList<IRBBlock> bblockList = node.getBblocks();
        IRconst constant = null;
        for(int i=0; i<opList.size(); ++i){
            IROperand operand = opList.get(i);
            IRBBlock bblock = bblockList.get(i);
            if(bblock.getExecutable()){
                if(isMultidefined(operand)){
                    markMutidefined(reg);
                    return;
                }
                else{
                    IRconst constOp = getConst(operand);
                    if(constOp != null){
                        if(constant == null)
                            constant = constOp;
                        else if(!constant.valueEqual(constOp)){
                            markMutidefined(reg);
                            return;
                        }
                    }
                }
            }
        }
        if(constant != null)
            markConstant(reg, constant);
    }

    @Override
    public void visit(MoveInst node) {

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

    }

    @Override
    public void visit(variable node) {

    }

    @Override
    public void visit(IRBBlock node) {
        IRInstruction Inst = node.getHead();
        while(Inst != null){
            Inst.accept(this);
            Inst = Inst.getNext();
        }
    }

    @Override
    public void visit(IRModule node) {
        LinkedHashMap<String, IRFunction> functList = node.getFunctList();
        for(var entry : functList.entrySet())
            entry.getValue().accept(this);
    }

    @Override
    public void visit(IRFunction node) {
        BBlockQueue = new LinkedList<>();
        regQueue = new LinkedList<>();
        IRBBlock entryBBlock = node.getEntryBBlock();
        BBlockQueue.offer(entryBBlock);
        entryBBlock.setExecutable();
        ArrayList<register> paras = node.getParas();
        for(register para : paras){
            para.status = register.Status.multidefined;
        }
        while(!BBlockQueue.isEmpty() || !regQueue.isEmpty()){
            if(!BBlockQueue.isEmpty())
                BBlockQueue.poll().accept(this);
            if(!regQueue.isEmpty()){
                register reg = regQueue.poll();
                HashSet<IRInstruction> usedList = reg.getUsedInstruction();
                for(var used : usedList)
                    used.accept(this);
            }
        }
        ArrayList<IRBBlock> bblockList = node.getBBlockArray();
        for(var bblock : bblockList){
            if(!bblock.getExecutable()){
                bblock.removeAll();
                bblock.removeAllInst();
                bblock.removeAllUsedPhi();
                isChanged = true;
            }
            else{
                ArrayList<IRInstruction> InstList = bblock.getInstList();
                for(var Inst : InstList){
                    register reg = Inst.getRes();
                    if(reg != null && reg.status == register.Status.constant){
                        reg.replaceUsedInst(reg.getConstant());
                        Inst.removeAll();
                        isChanged = true;
                    }
                }
            }
        }
    }

    public void markExecutable(IRBBlock bblock){
        if(!bblock.getExecutable()){
            bblock.setExecutable();
            BBlockQueue.offer(bblock);
        }
        else {
            IRInstruction Inst = bblock.getHead();
            while(Inst instanceof PhiInst){
                Inst.accept(this);
                Inst = Inst.getNext();
            }
        }
    }

    public void markMutidefined(register reg){
        if(reg.status != register.Status.multidefined){
            reg.setConstant(null);
            reg.status = register.Status.multidefined;
            regQueue.offer(reg);
        }
    }

    public void markConstant(register reg, IRconst constant){
        if(reg.status != register.Status.constant){
            reg.setConstant(constant);
            reg.status = register.Status.constant;
            regQueue.offer(reg);
        }
    }

    public IRconst getConst(IROperand operand){
        if(operand instanceof IRconst)
            return ((IRconst)operand);
        if(operand instanceof register)
            return ((register)operand).getConstant();
        return null;
    }

    public boolean isMultidefined(IROperand operand){
        return operand instanceof register && ((register)operand).status == register.Status.multidefined;
    }
}
