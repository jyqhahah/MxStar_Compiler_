package AST;

import utility.Location;

public abstract class LiterExprNode extends ExprNode {
    public LiterExprNode(Location loc){
        super(loc);
    }

    public abstract void accept(ASTVisitor visitor);
}
