package AST;

import utility.Location;

public class ExprStatNode extends StatmentNode {
    private ExprNode expr;

    public ExprStatNode(Location loc, ExprNode expr){
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
