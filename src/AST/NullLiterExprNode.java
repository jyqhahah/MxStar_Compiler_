package AST;

import utility.Location;

public class NullLiterExprNode extends LiterExprNode{
    public NullLiterExprNode(Location loc){
        super(loc);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
