package AST;

import utility.Location;

public class SubExprNode extends ExprNode {
    private ExprNode expr;

    public SubExprNode (Location loc, ExprNode expr){
        super(loc);
        this.expr = expr;
    }

    public ExprNode getExpr() {
        return expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
