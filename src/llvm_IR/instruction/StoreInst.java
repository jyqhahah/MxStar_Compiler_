package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;
import llvm_IR.type.IRPointerType;

import java.util.ArrayList;

public class StoreInst extends IRInstruction {
    private IROperand ptr, res;

    public StoreInst(IROperand res, IROperand ptr){
        super();
        this.ptr = ptr;
        this.res = res;
    }

    public IROperand getValue(){
        return res;
    }

    @Override
    public register getRes() {
        return null;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        boolean flag = false;
        if(res == oldOp){
            res = newOp;
            flag = true;
        }
        if(ptr == oldOp){
            ptr = newOp;
            flag = true;
        }
        if(flag) newOp.addUsedInst(this);
    }

    @Override
    public void initDefAndUsed() {
        ptr.addUsedInst(this);
        //ptr.addDefInst(this);
        res.addUsedInst(this);
    }

    @Override
    public ArrayList<register> getUsedRegList() {
        ArrayList<register> regList = new ArrayList<>();
        if(res instanceof register)
            regList.add((register)res);
        if(ptr instanceof register)
            regList.add((register)ptr);
        return regList;
    }

    @Override
    public void removeAllUsed() {
        res.removeUsedInst(this);
        ptr.removeUsedInst(this);
    }

    @Override
    public void removeAllDef() {
        //ptr.removeUsedInst(this);
    }

    public IROperand getPtr() {
        return ptr;
    }

    @Override
    public String toString() {
        IRPointerType ptrType = (IRPointerType)ptr.getType();
        return "store "+ ptrType.getPointerType().toString() + " " + res.toString() +", "+ptr.getType().toString()+" "+ptr.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
