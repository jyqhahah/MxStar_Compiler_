package riscv.operand;

public class imm extends RvOperand {
    private int imm;

    public imm(int imm){
        this.imm = imm;
    }

    public int getValue(){
        return imm;
    }

    @Override
    public String toString() {
        return String.valueOf(imm);
    }
}
