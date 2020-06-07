package llvm_IR.instruction;

import llvm_IR.IRFunction;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

import java.util.ArrayList;

public class CallInst extends IRInstruction {
    private IRFunction funct;
    private register ret;
    private boolean isInLined;
    private ArrayList<IROperand> paras;

    public CallInst(IRFunction funct, ArrayList<IROperand> paras, register ret){
        super();
        this.funct = funct;
        this.paras = paras;
        this.isInLined = false;
        this.ret = ret;
    }

    @Override
    public String toString() {
        StringBuilder str = new StringBuilder();
        if(ret != null)
            str.append(ret.toString()).append(" = ");
        str.append("call ").append(funct.getType().toString()).append(" ").append(funct.toString()).append("(");
        int cnt = 0;
        for(var para : paras){
            str.append(para.getType().toString()).append(" ").append(para.toString());
            ++cnt;
            if(cnt != paras.size()) str.append(", ");
        }
        str.append(")");
        return str.toString();
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public register getRes() {
        return ret;
    }

    public IRFunction getFunct() {
        return funct;
    }

    public ArrayList<IROperand> getParas() {
        return paras;
    }

    public boolean isInLined() {
        return isInLined;
    }

    public void setInLined() {
        isInLined = true;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        boolean flag = true;
        for(int i=0; i<paras.size(); ++i){
            if(paras.get(i) == oldOp){
                paras.set(i, newOp);
                flag = false;
            }
        }
        if(!flag) newOp.addUsedInst(this);
    }

    @Override
    public void initDefAndUsed() {
        if(ret != null)
            ret.addDefInst(this);
        for(var para : paras)
            para.addUsedInst(this);
    }

    @Override
    public ArrayList<register> getUsedRegList() {
        ArrayList<register> regList = new ArrayList<>();
        for(var para : paras){
            if(para instanceof register)
                regList.add((register)para);
        }
        return regList;
    }

    @Override
    public void removeAllUsed() {
        for(var para : paras){
            para.removeUsedInst(this);
        }
    }

    @Override
    public void removeAllDef() {

    }
}
