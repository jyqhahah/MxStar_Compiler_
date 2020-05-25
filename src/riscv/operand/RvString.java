package riscv.operand;

import riscv.RvVisitor;

public class RvString extends RvVariable {
    private String str;

    public RvString(String Identifier, String str){
        super(Identifier);
        str = str.replace("\\", "\\\\");
        str = str.replace("\n","\\n");
        str = str.replace("\0", "");
        str = str.replace("\t","\\t");
        str = str.replace("\"", "\\\"");
        str = "\"" + str + "\"";
        this.str = str;
    }

    public String getStr() {
        return str;
    }

    public void accept(RvVisitor visitor){
        visitor.visit(this);
    }

}
