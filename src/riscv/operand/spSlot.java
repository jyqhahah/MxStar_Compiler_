package riscv.operand;

public class spSlot extends RvOperand {
    private int index;
    private int call;

    public spSlot(int index, int call){
        this.index = index;
        this.call = call;
    }

    public void addIndex(int add){
        this.index += add;
        this.call = 0;
    }

    public int getCall() {
        return call;
    }

    public int getIndex() {
        return index;
    }

    public void setCall(int call) {
        this.call = call;
    }

    public void setIndex(int index) {
        this.index = index;
        this.call = 0;
    }

    @Override
    public String toString() {
        return String.valueOf(index)+"(sp)";
    }
}
