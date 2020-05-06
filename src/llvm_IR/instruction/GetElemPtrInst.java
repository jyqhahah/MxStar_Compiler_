package llvm_IR.instruction;

import llvm_IR.IRVisitor;
import llvm_IR.operand.IROperand;
import llvm_IR.type.IRPointerType;
import llvm_IR.type.IRType;

import java.util.ArrayList;

public class GetElemPtrInst extends IRInstruction {
    private IROperand ptr, res;
    private ArrayList<IROperand> index;

    public GetElemPtrInst(IROperand res, IROperand ptr, ArrayList<IROperand> index){
        super();
        this.ptr = ptr;
        this.res = res;
        this.index = index;
        ptr.addUsedInst(this);
        for(var tmp : index)
            tmp.addUsedInst(this);
    }


    @Override
    public String toString() {
        if(ptr.getType() instanceof IRPointerType){
            IRType ptrType = ((IRPointerType)(ptr.getType())).getPointerType();
            StringBuilder str = new StringBuilder(res.toString()+" = ");
            str.append("getelementptr ").append(ptrType.toString()).append(", ").append(ptr.getType().toString()).append(" ").append(ptr.toString()).append(", ");
            int cnt = 0;
            for(var tmp : index){
                str.append(tmp.getType().toString()).append(" ").append(tmp.toString());
                ++cnt;
                if(cnt != index.size())
                    str.append(", ");
            }
            return str.toString();
        }
        else{
            System.err.println("err in getelemptr");
            return null;
        }
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public IROperand getRes() {
        return res;
    }

    @Override
    public void replaceUsedInst(IROperand oldOp, IROperand newOp) {
        boolean flag = true;
        if(ptr == oldOp){
            ptr = newOp;
            flag = false;
        }
        for(int i=0; i<index.size(); ++i){
            if(index.get(i) == oldOp){
                index.set(i, newOp);
                flag = false;
            }
        }
        if(!flag) newOp.addUsedInst(this);
    }

    @Override
    public void removeAllUsed() {
        ptr.removeUsedInst(this);
        for(var ind : index){
            ind.removeUsedInst(this);
        }
    }

    @Override
    public void removeAllDef() {

    }
}
