package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRIntType;
import llvm_IR.type.IRPointerType;

public class constString extends IROperand {
    private String str;

    public constString(String str){
        super(new IRPointerType(new IRIntType(8)));
        str = str.replace("\\", "\\5C");
        str = str.replace("\n", "\\0A");
        str = str.replace("\0", "\\00");
        str = str.replace("\t", "\\09");
        str = str.replace("\"", "\\22");
        str = "c\"" + str + "\"";
        this.str = str;
    }

    public String getStr() {
        return str;
    }

    @Override
    public String toString() {
        return str;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
