package llvm_IR.type;

public enum BinOpType {
    add(new String("add")),
    sub(new String("sub")),
    mul(new String("mul")),
    sdiv(new String("sdiv")),
    srem(new String("srem")),
    and(new String("and")),
    or(new String("or")),
    xor(new String("xor")),
    shl(new String("shl")),
    ashr(new String("ashr")),
    ;

    private String type;

    public String toString(){
        return type;
    }

    BinOpType(String type) {
        this.type = type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
