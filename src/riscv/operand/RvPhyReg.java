package riscv.operand;

public class RvPhyReg extends RvRegister {
    public RvPhyReg(String Identifier) {
        super(Identifier);
        isPhyReg = this;
    }
}
