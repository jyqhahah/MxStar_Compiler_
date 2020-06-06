package llvm_IR.operand;

import llvm_IR.IRVisitor;
import llvm_IR.type.IRIntType;
import llvm_IR.type.IRPointerType;

public class constString extends IRconst {
    private String str;

    public constString(String str){
        super(new IRPointerType(new IRIntType(8)));
        this.str = str;
    }

    public String getStr() {
        return str;
    }

    @Override
    public String toString() {
        String tmp = str;
        tmp = tmp.replace("\\", "\\5C");
        tmp = tmp.replace("\n", "\\0A");
        tmp = tmp.replace("\0", "\\00");
        tmp = tmp.replace("\t", "\\09");
        tmp = tmp.replace("\"", "\\22");
        tmp = "c\"" + tmp + "\"";
        return tmp;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }

    @Override
    public boolean valueEqual(IRconst other) {
        return other instanceof constString && str.equals(((constString)other).getStr());
    }
}
