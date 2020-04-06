package AST;

import utility.Location;

public class IntLiterExprNode extends LiterExprNode {
    private long value;

    public IntLiterExprNode(Location loc, long value){
        super(loc);
        this.value = value;
    }

    public long getValue() {
        return value;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
