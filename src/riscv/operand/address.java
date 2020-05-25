package riscv.operand;

public class address extends imm {
    private RvVariable var;
    private RvPhyReg phyReg;

    public address(RvPhyReg phyReg, RvVariable var){
        super(0);
        this.phyReg = phyReg;
        this.var = var;
    }

    public int getValue(){
        return 0;
    }

    @Override
    public String toString() {
        return phyReg + "(" + var + ")";
    }
}
