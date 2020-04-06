package AST;

import utility.Location;

public class BoolLiterExprNode extends LiterExprNode {
    private boolean value;

    public BoolLiterExprNode(Location loc, boolean value){
        super(loc);
        this.value = value;
    }

    public boolean isValue() {
        return value;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
