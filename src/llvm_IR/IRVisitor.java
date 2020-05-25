package llvm_IR;

import llvm_IR.instruction.*;
import llvm_IR.operand.*;
import llvm_IR.type.*;

public interface IRVisitor {
    public abstract void visit(IRType node);
    public abstract void visit(IRIntType node);
    public abstract void visit(IRClassType node);
    public abstract void visit(IRVoidType node);
    public abstract void visit(IRArrayType node);
    public abstract void visit(IRPointerType node);

    public abstract void visit(IRInstruction node);
    public abstract void visit(AllocaInst node);
    public abstract void visit(BinOpInst node);
    public abstract void visit(BranchInst node);
    public abstract void visit(IcmpInst node);
    public abstract void visit(StoreInst node);
    public abstract void visit(LoadInst node);
    public abstract void visit(CallInst node);
    public abstract void visit(RetInst node);
    public abstract void visit(BitCastInst node);
    public abstract void visit(GetElemPtrInst node);
    public abstract void visit(PhiInst node);
    public abstract void visit(MoveInst node);

    public abstract void visit(IROperand node);
    public abstract void visit(constInt node);
    public abstract void visit(constString node);
    public abstract void visit(constBool node);
    public abstract void visit(constNull node);
    public abstract void visit(register node);
    public abstract void visit(string node);
    public abstract void visit(variable node);

    public abstract void visit(IRBBlock node);
    public abstract void visit(IRModule node);
    public abstract void visit(IRFunction node);
}
