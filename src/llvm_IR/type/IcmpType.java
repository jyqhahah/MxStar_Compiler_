package llvm_IR.type;

public enum IcmpType {
    eq(new String("eq")),
    ne(new String("ne")),
    sgt(new String("sgt")),
    sge(new String("sge")),
    slt(new String("slt")),
    sle(new String("sle"))
    ;

    private String Identifier;

    private IcmpType(String Identifier){
        this.Identifier = Identifier;
    }

    public String toString(){
        return Identifier;
    }
}
