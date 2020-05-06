package llvm_IR.type;

import llvm_IR.IRVisitor;

import java.util.ArrayList;

public class IRClassType extends IRType {
    private String Identifier;
    private ArrayList<IRType> member;

    public IRClassType(String Identifier, ArrayList<IRType> member){
        this.Identifier = Identifier;
        this.member = member;
    }

    @Override
    public String toString() {
        return "%" + Identifier;
    }

    public String declarePrinter(){
        StringBuilder str = new StringBuilder(toString());
        str.append(" = type { ");
        int cnt = 0;
        for(var tmp : member){
            str.append(tmp.toString());
            ++cnt;
            if(cnt != member.size())
                str.append(", ");
        }
        str.append(" }");
        return str.toString();
    }

    public void addMember(IRType type){
        member.add(type);
    }

    @Override
    public int bytes() {
        int ret = 0;
        for (var memb : member){
            ret += memb.bytes();
        }
        return ret;
    }

    @Override
    public void accept(IRVisitor visitor) {
        visitor.visit(this);
    }
}
