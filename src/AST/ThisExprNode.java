package AST;

import utility.Location;

public class ThisExprNode extends ExprNode {
    public ThisExprNode (Location loc){
        super(loc);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
