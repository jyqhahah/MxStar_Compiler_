package llvm_IR.instruction;

import llvm_IR.IRFunction;
import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;

import java.util.ArrayList;

public class CallInst extends IRInstruction {
    private IRFunction funct;
    private IROperand ret;
    private ArrayList<IROperand> paras;

    public CallInst(IRFunction funct, ArrayList<IROperand> paras, IROperand ret){
        super();
        this.funct = funct;
        this.paras = paras;
        this.ret = ret;
        for(var para : paras)
            para.addUsedInst(this);
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
    public IROperand getRes() {
        return ret;
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
    public void removeAllUsed() {
        for(var para : paras){
            para.removeUsedInst(this);
        }
    }

    @Override
    public void removeAllDef() {

    }
}
