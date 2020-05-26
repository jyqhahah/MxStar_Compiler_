package riscv;

import riscv.instruction.*;
import riscv.operand.RvString;
import riscv.operand.RvVariable;

public interface RvVisitor {
    public void visit(RvBInst node);
    public void visit(RvCallInst node);
    public void visit(RvCmpzInst node);
    public void visit(RvJInst node);
    public void visit(RvJrInst node);
    public void visit(RvLaInst node);
    public void visit(RvLiInst node);
    public void visit(RvIInst node);
    public void visit(RvLoadInst node);
    public void visit(RvLuiInst node);
    public void visit(RvMoveInst node);
    public void visit(RvRInst node);
    public void visit(RvStoreInst node);

    public void visit(RvVariable node);
    public void visit(RvString node);

    public void visit(RvInstruction node);
    public void visit(RvBBlock node);
    public void visit(RvFunction node);
    public void visit(RvModule node);
}
