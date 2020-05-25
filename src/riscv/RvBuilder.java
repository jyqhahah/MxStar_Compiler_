package riscv;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.IRVisitor;
import llvm_IR.instruction.*;
import llvm_IR.operand.*;
import llvm_IR.type.*;
import riscv.instruction.*;
import riscv.operand.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;

public class RvBuilder implements IRVisitor {
    private final int MAX_IMM = 2047;
    private final int MIN_IMM = -2048;
    private RvModule RvModule;
    private IRModule IRModule;
    private RvBBlock curBBlock;
    private RvFunction curFunct;
    private RvVirReg[] calleeRegs;

    public RvBuilder (IRModule IRModule){
        this.IRModule = IRModule;
        this.calleeRegs = new RvVirReg[13];
    }

    public RvModule run(){
        RvModule = new RvModule();
        visit(IRModule);
        return RvModule;
    }

    public RvModule getRvModule(){
        return RvModule;
    }

    public RvRegister getRvRegister(IROperand irOperand){
        if(irOperand instanceof constInt){
            int value  = (int)((constInt)irOperand).getValue();
            RvRegister tmp = curFunct.newVirReg("tmp");
            curBBlock.addInst(new RvLiInst(curBBlock, tmp, new imm(value)));
            return tmp;
        }
        if(irOperand instanceof constBool){
            boolean value = (boolean)((constBool)irOperand).getValue();
            if(value){
                RvRegister tmp = curFunct.newVirReg("tmp");
                curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.addi, tmp, RegisterList.zero, new imm(1)));
                return tmp;
            }
            else
                return RegisterList.zero;
        }
        if(irOperand instanceof constNull)
            return RegisterList.zero;
        if(irOperand instanceof register){
            RvRegister tmp = ((register)irOperand).getRvReg();
            if(tmp != null)
                return tmp;
            tmp = curFunct.newVirReg(((register)irOperand).getIdentifier());
            ((register)irOperand).setRvReg(tmp);
            return tmp;
        }
        return null;
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

    }

    @Override
    public void visit(BinOpInst node) {
        BinOpType bi_op = node.getType();
        IROperand right = node.getRight(), left = node.getLeft();
        register tmp = node.getRes();
        RvRegister RvReg = getRvRegister(tmp);
        if(bi_op == BinOpType.add || bi_op == BinOpType.and || bi_op == BinOpType.or || bi_op == BinOpType.xor){
            RvIInst.i_op I_op; RvRInst.r_op R_op;
            if(bi_op == BinOpType.add){
                I_op = RvIInst.i_op.addi; R_op = RvRInst.r_op.add;
            }
            else if(bi_op == BinOpType.and){
                I_op = RvIInst.i_op.andi; R_op = RvRInst.r_op.and;
            }
            else if(bi_op == BinOpType.or){
                I_op = RvIInst.i_op.ori; R_op = RvRInst.r_op.or;
            }
            else{
                I_op = RvIInst.i_op.xori; R_op = RvRInst.r_op.xor;
            }
            if(right instanceof constInt){
                constInt tmpR = (constInt)right;
                int rvalue = (int)tmpR.getValue();
                if(inImmScope(rvalue))
                    curBBlock.addInst(new RvIInst(curBBlock, I_op, RvReg, getRvRegister(left), new imm(rvalue)));
                else
                    curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
            }
            else if(left instanceof constInt){
                constInt tmpL =(constInt)left;
                int lvalue = (int)tmpL.getValue();
                if(inImmScope(lvalue))
                    curBBlock.addInst(new RvIInst(curBBlock, I_op, RvReg, getRvRegister(right), new imm(lvalue)));
                else
                    curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
            }
            else
                curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
        }
        else if(bi_op == BinOpType.shl || bi_op == BinOpType.ashr){
            RvIInst.i_op I_op; RvRInst.r_op R_op;
            if(bi_op == BinOpType.shl){
                I_op = RvIInst.i_op.slli; R_op = RvRInst.r_op.sll;
            }
            else {
                I_op = RvIInst.i_op.srai; R_op = RvRInst.r_op.sra;
            }
            if(right instanceof constInt){
                constInt tmpR = (constInt)right;
                int rvalue = (int)tmpR.getValue();
                if(inShamtScope(rvalue))
                    curBBlock.addInst(new RvIInst(curBBlock, I_op, RvReg, getRvRegister(left), new imm(rvalue)));
                else
                    curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
            }
            else
                curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
        }
        else if(bi_op == BinOpType.sub){
            RvIInst.i_op I_op = RvIInst.i_op.addi; RvRInst.r_op R_op = RvRInst.r_op.sub;
            if(right instanceof constInt){
                constInt tmpR = (constInt)right;
                int rvalue = -(int)tmpR.getValue();
                if(inImmScope(rvalue))
                    curBBlock.addInst(new RvIInst(curBBlock, I_op, RvReg, getRvRegister(left), new imm(rvalue)));
                else
                    curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
            }
            else
                curBBlock.addInst(new RvRInst(curBBlock, R_op, RvReg, getRvRegister(left), getRvRegister(right)));
        }
        else if(bi_op == BinOpType.mul){
            curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.mul, RvReg, getRvRegister(left), getRvRegister(right)));
        }
        else if(bi_op == BinOpType.sdiv){
            curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.div, RvReg, getRvRegister(left), getRvRegister(right)));
        }
        else if(bi_op == BinOpType.srem){
            curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.rem, RvReg, getRvRegister(left), getRvRegister(right)));
        }
    }

    @Override
    public void visit(BranchInst node) {
        IROperand cond = node.getCond();
        if(cond != null){
            RvInstruction Inst = node.getRvInst();
            if(Inst == null)
                curBBlock.addInst(new RvBInst(curBBlock, RvBInst.b_op.bne, getRvRegister(cond), RegisterList.zero, node.getTrueBBlock().getRvBBlock()));
            else{
                Inst.setCurBBlock(curBBlock);
                curBBlock.addInst(Inst);
            }
            curBBlock.addInst(new RvJInst(curBBlock, node.getFalseBBlock().getRvBBlock()));
        }
        else
            curBBlock.addInst(new RvJInst(curBBlock, node.getTrueBBlock().getRvBBlock()));
    }

    @Override
    public void visit(IcmpInst node) {
        IROperand left = node.getLeft(), right = node.getRight();
        register reg = node.getRes();
        if(reg.usedByBranch()){
            RvBInst.b_op b_op;
            HashSet<IRInstruction> usedList = reg.getUsedInstruction();
            switch (node.getType()){
                case eq  : b_op = RvBInst.b_op.beq; break;
                case ne  : b_op = RvBInst.b_op.bne; break;
                case slt : b_op = RvBInst.b_op.blt; break;
                case sle : b_op = RvBInst.b_op.ble; break;
                case sgt : b_op = RvBInst.b_op.bgt; break;
                case sge : b_op = RvBInst.b_op.bge; break;
                default  : b_op = null;
            }
            for(var Inst : usedList){
                RvBBlock tmp = ((BranchInst)Inst).getTrueBBlock().getRvBBlock();
                Inst.setRvInst(new RvBInst(curBBlock, b_op, getRvRegister(left), getRvRegister(right), tmp));
            }
        }
        else{
            IcmpType icmp_op = node.getType();
            if(icmp_op == IcmpType.eq || icmp_op == IcmpType.ne){
                RvRegister RvCmpReg = getRvRegister(reg);
                RvCmpzInst.cmp_op op = (icmp_op == IcmpType.eq)? RvCmpzInst.cmp_op.seqz : RvCmpzInst.cmp_op.snez;
                if(right instanceof constNull)
                    curBBlock.addInst(new RvCmpzInst(curBBlock, op, RvCmpReg, getRvRegister(left)));
                else if(left instanceof constNull)
                    curBBlock.addInst(new RvCmpzInst(curBBlock, op, RvCmpReg, getRvRegister(right)));
                else{
                    RvVirReg RvXorReg = (RvVirReg)getRvRegister(reg);
                    if(right instanceof constInt){
                        int rvalue = (int)((constInt)right).getValue();
                        if(inImmScope(rvalue))
                            curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.xori, RvXorReg, getRvRegister(left), new imm(rvalue)));
                        else
                            curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.xor, RvXorReg, getRvRegister(left), getRvRegister(right)));
                    }
                    else if(left instanceof constInt){
                        int lvalue = (int)((constInt)left).getValue();
                        if(inImmScope(lvalue))
                            curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.xori, RvXorReg, getRvRegister(right), new imm(lvalue)));
                        else
                            curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.xor, RvXorReg, getRvRegister(left), getRvRegister(right)));
                    }
                    else
                        curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.xor, RvXorReg, getRvRegister(left), getRvRegister(right)));
                    curBBlock.addInst(new RvCmpzInst(curBBlock, op, RvCmpReg, RvXorReg));
                }
            }
            else if(icmp_op == IcmpType.sle || icmp_op == IcmpType.sgt){
                RvRegister RvSReg = getRvRegister(reg);
                if(left instanceof constInt){
                    int lvalue = (int)((constInt)left).getValue();
                    if(inImmScope(lvalue))
                        curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.slti, RvSReg, getRvRegister(right), new imm(lvalue)));
                    else
                        curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.slt, RvSReg, getRvRegister(right), getRvRegister(left)));
                }
                else
                    curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.slt, RvSReg, getRvRegister(right), getRvRegister(left)));
                if(icmp_op == IcmpType.sle){
                    RvRegister RvXorReg = getRvRegister(reg);
                    curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.xori, RvXorReg, RvSReg, new imm(1)));
                }
            }
            else if(icmp_op == IcmpType.slt || icmp_op == IcmpType.sge){
                RvRegister RvSReg = getRvRegister(reg);
                if(right instanceof constInt){
                    int rvalue = (int)((constInt)right).getValue();
                    if(inImmScope(rvalue))
                        curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.slti, RvSReg, getRvRegister(left), new imm(rvalue)));
                    else
                        curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.slt, RvSReg, getRvRegister(left), getRvRegister(right)));
                }
                else
                    curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.slt, RvSReg, getRvRegister(left), getRvRegister(right)));
                if(icmp_op == IcmpType.sge){
                    RvRegister RvXorReg = getRvRegister(reg);
                    curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.xori, RvXorReg, RvSReg, new imm(1)));
                }
            }
        }
    }

    @Override
    public void visit(StoreInst node) {
        if(node.getValue() instanceof register){
            register tmpValue = (register)node.getValue();
            if(tmpValue.getIdentifier().contains("__stringLiteral")){
                if(node.isIgnored())
                    return;
            }
        }
        RvInstruction Inst = node.getRvInst();
        if(Inst != null){
            Inst.setCurBBlock(curBBlock);
            curBBlock.addInst(Inst);
        }
        else{
            IROperand ptr = node.getPtr();
            if(ptr instanceof variable){
                RvVirReg VirReg = curFunct.newVirReg("tmp");
                RvVariable RvVar = ((variable)ptr).getRvVariable();
                curBBlock.addInst(new RvLuiInst(curBBlock, VirReg, new address(RegisterList.hi, RvVar)));
                curBBlock.addInst(new RvStoreInst(curBBlock, getRvRegister(node.getValue()), VirReg, new address(RegisterList.lo, RvVar)));
            }
            else if(ptr instanceof string){
                RvVirReg VirReg = curFunct.newVirReg("tmp");
                RvString RvStr = ((string)ptr).getRvStr();
                curBBlock.addInst(new RvLuiInst(curBBlock, VirReg, new address(RegisterList.hi, RvStr)));
                curBBlock.addInst(new RvStoreInst(curBBlock, getRvRegister(node.getValue()), VirReg, new address(RegisterList.lo, RvStr)));
            }
            else
                curBBlock.addInst(new RvStoreInst(curBBlock, getRvRegister(node.getValue()), getRvRegister(node.getPtr()), new imm(0)));
        }
    }

    @Override
    public void visit(LoadInst node) {
        RvInstruction Inst = node.getRvInst();
        if(Inst != null){
            Inst.setCurBBlock(curBBlock);
            curBBlock.addInst(Inst);
        }
        else{
            IROperand ptr = node.getPtr();
            if(ptr instanceof variable){
                RvVirReg VirReg = curFunct.newVirReg("tmp");
                RvVariable RvVar = ((variable)ptr).getRvVariable();
                curBBlock.addInst(new RvLuiInst(curBBlock, VirReg, new address(RegisterList.hi, RvVar)));
                curBBlock.addInst(new RvLoadInst(curBBlock, getRvRegister(node.getRes()), VirReg, new address(RegisterList.lo, RvVar)));
            }
            else if(ptr instanceof string){
                RvVirReg VirReg = curFunct.newVirReg("tmp");
                RvString RvStr = ((string)ptr).getRvStr();
                curBBlock.addInst(new RvLuiInst(curBBlock, VirReg, new address(RegisterList.hi, RvStr)));
                curBBlock.addInst(new RvLoadInst(curBBlock, getRvRegister(node.getRes()), VirReg, new address(RegisterList.lo, RvStr)));
            }
            else
                curBBlock.addInst(new RvLoadInst(curBBlock, getRvRegister(node.getRes()), getRvRegister(node.getPtr()), new imm(0)));
        }
    }

    @Override
    public void visit(CallInst node) {
        ArrayList<IROperand> paras = node.getParas();
        ArrayList<spSlot> slotList = new ArrayList<>();
        for(int i = 0; i< Math.min(8, paras.size()); ++i)
            curBBlock.addInst(new RvMoveInst(curBBlock, RegisterList.argumentRegister[i], getRvRegister(paras.get(i))));
        for(int i = 8; i< paras.size(); ++i){
            spSlot slot = new spSlot((i-8)<<2, 0);
            curBBlock.addInst(new RvStoreInst(curBBlock, getRvRegister(paras.get(i)), slot, null));
            slotList.add(slot);
        }
        curBBlock.addInst(new RvCallInst(curBBlock, node.getFunct().getIdentifier().substring(1), paras.size()));
        curFunct.addCallSlot(slotList);
        register reg = node.getRes();
        if(reg != null)
            curBBlock.addInst(new RvMoveInst(curBBlock, getRvRegister(reg), RegisterList.a0));
    }

    @Override
    public void visit(RetInst node) {
        IROperand value = node.getValue();
        if(value != null){
            curBBlock.addInst(new RvMoveInst(curBBlock, RegisterList.a0, getRvRegister(value)));
        }
        for(int i = 11; i>=0 ;--i){
            RvPhyReg PhyReg = RegisterList.calleeSavedRegister[i];
            curBBlock.addInst(new RvMoveInst(curBBlock, PhyReg, calleeRegs[i]));
        }
        curBBlock.addInst(new RvMoveInst(curBBlock, RegisterList.ra, calleeRegs[12]));
        curBBlock.addInst(new RvJrInst(curBBlock, RegisterList.ra));
        curFunct.setExitBBlock(curBBlock);
    }

    @Override
    public void visit(BitCastInst node) {
        curBBlock.addInst(new RvMoveInst(curBBlock, getRvRegister(node.getRes()), getRvRegister(node.getSrc())));
    }

    public RvRegister getRvRegister(int value){
        RvVirReg VirReg = curFunct.newVirReg("tmp");
        curBBlock.addInst(new RvLiInst(curBBlock, VirReg, new imm(value)));
        return VirReg;
    }

    @Override
    public void visit(GetElemPtrInst node) {
        IROperand ptr = node.getPtr();
        register reg = node.getRes();
        if(reg.getIdentifier().contains("__stringLiteral")){
            if(node.isIgnored())
                return;
            else{
                RvVirReg VirReg = curFunct.newVirReg("tmp");
                RvString str = ((string)ptr).getRvStr();
                curBBlock.addInst(new RvLuiInst(curBBlock, VirReg, new address(RegisterList.hi, str)));
                curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.addi, getRvRegister(reg), VirReg, new address(RegisterList.lo, str)));
                return;
            }
        }
        ArrayList<IROperand> indexList = node.getIndex();
        IROperand index = indexList.get(0);
        IROperand index1 = (indexList.size() == 1)? null : indexList.get(1);
        int offset = (index1 == null)? 0 : (int)(((constInt)index1).getValue() << 2);
        int bytes = node.getBytes();
        boolean inLS = reg.usedByLS();
        if(index instanceof constInt && inImmScope((int)((constInt)index).getValue()*bytes)){
            int indexValue = (int)((constInt)index).getValue();
                if(inImmScope(offset + indexValue * bytes)){
                    offset += indexValue * bytes;
                    if(inLS){
                        HashSet<IRInstruction> instructions = reg.getUsedInstruction();
                        for (var Inst : instructions){
                            if(Inst instanceof LoadInst)
                                Inst.setRvInst(new RvLoadInst(curBBlock, getRvRegister(Inst.getRes()), getRvRegister(ptr), new imm(offset)));
                            else
                                Inst.setRvInst(new RvStoreInst(curBBlock, getRvRegister(((StoreInst)Inst).getValue()), getRvRegister(ptr), new imm(offset)));
                        }
                    }
                    else{
                        if(offset == 0)
                            curBBlock.addInst(new RvMoveInst(curBBlock, getRvRegister(reg), getRvRegister(ptr)));
                        else
                            curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.addi, getRvRegister(reg), getRvRegister(ptr), new imm(offset)));
                    }
                }
                else{
                    RvVirReg VirReg = curFunct.newVirReg("tmp");
                    curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.addi, VirReg, getRvRegister(offset), new imm(indexValue*bytes)));
                    curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.add, getRvRegister(reg), getRvRegister(ptr), VirReg));
                }
        }
        else{
            RvVirReg VirReg = curFunct.newVirReg("tmp");
            curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.slli, VirReg, getRvRegister(index), new imm(2)));
            RvVirReg tmp = VirReg;
            if(offset != 0){
                tmp = curFunct.newVirReg("tmp");
                if(inImmScope(offset))
                    curBBlock.addInst(new RvIInst(curBBlock, RvIInst.i_op.addi, tmp, VirReg, new imm(offset)));
                else {
                    curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.add, tmp, VirReg, getRvRegister(offset)));
                }
            }
            curBBlock.addInst(new RvRInst(curBBlock, RvRInst.r_op.add, getRvRegister(reg), getRvRegister(ptr), tmp));
        }
    }

    @Override
    public void visit(PhiInst node) {

    }

    @Override
    public void visit(MoveInst node) {
        curBBlock.addInst(new RvMoveInst(curBBlock, getRvRegister(node.getRes()), getRvRegister(node.getSrc())));
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
        curBBlock = node.getRvBBlock();
        IRInstruction Inst = node.getHead();
        while(Inst != null){
            Inst.accept(this);
            Inst = Inst.getNext();
        }
    }

    @Override
    public void visit(IRModule node) {
        LinkedHashMap<String, IRFunction> functList = node.getFunctList();
        for(var entry : functList.entrySet()){
            IRFunction IRFunction = entry.getValue();
            RvFunction RvFunction = new RvFunction(IRFunction.getIdentifier().substring(1), IRFunction.getParas().size());
            IRFunction.setRvFunction(RvFunction);
            RvModule.addFunct(RvFunction);
        }
        LinkedHashMap<String, string> strList = node.getStringList();
        for(var entry : strList.entrySet()){
            string str = entry.getValue();
            RvString RvStr = new RvString(str.getIdentifier(), str.getInitValue().getStr());
            str.setRvStr(RvStr);
            RvModule.addStr(RvStr);
        }
        LinkedHashMap<String, variable> varList = node.getVarList();
        for(var entry : varList.entrySet()){
            variable var = entry.getValue();
            RvVariable RvVar = new RvVariable(var.getIdentifier());
            var.setRvVariable(RvVar);
            RvModule.addVar(RvVar);
            IROperand init = var.getInitValue();
            if(init != null){
                if(init instanceof constInt){
                    imm imm = new imm((int)((constInt)init).getValue());
                    RvVar.setValue(imm);
                }
                else if(init instanceof string){
                    RvString tmp = ((string)init).getRvStr();
                    RvVar.setValue(tmp);
                }
            }
        }
        for(var funct : functList.entrySet()){
            funct.getValue().accept(this);
        }
    }

    @Override
    public void visit(IRFunction node) {
        curFunct = node.getRvFunction();
        ArrayList<IRBBlock> bblockList = node.getBBlockArray();
        for(var bblock : bblockList){
            RvBBlock RvBBlock = new RvBBlock(bblock.getIdentifier(), node.getIdentifier().substring(1));
            bblock.setRvBBlock(RvBBlock);
            curFunct.addBBlock(RvBBlock);
        }
        IRBBlock entryBBlock = node.getEntryBBlock();
        curBBlock = entryBBlock.getRvBBlock();
        curFunct.setEntryBBlock(curBBlock);
        calleeRegs[12] = curFunct.newVirReg("ra");
        curBBlock.addInst(new RvMoveInst(curBBlock, calleeRegs[12], RegisterList.ra));
        for(int i=0; i<12; ++i){
            calleeRegs[i] = curFunct.newVirReg("calleeSaved");
            curBBlock.addInst(new RvMoveInst(curBBlock, calleeRegs[i], RegisterList.calleeSavedRegister[i]));
        }
        ArrayList<register> paras = node.getParas();
        for(int i=0; i<Math.min(8, paras.size()); ++i)
            curBBlock.addInst(new RvMoveInst(curBBlock, getRvRegister(paras.get(i)), RegisterList.argumentRegister[i]));
        for(int i=8; i<paras.size(); ++i)
            curBBlock.addInst(new RvLoadInst(curBBlock, getRvRegister(paras.get(i)), new spSlot((i-8)<<2, 2), null));
        for(var bblock : bblockList)
            bblock.accept(this);
    }

    public boolean inImmScope(int value){
        return value >= MIN_IMM && value <= MAX_IMM;
    }

    public boolean inShamtScope(int value){
        return value < 32 && value >= 0;
    }
}
