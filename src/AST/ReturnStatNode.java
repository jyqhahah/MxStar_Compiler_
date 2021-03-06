package AST;

import utility.Location;

public class ReturnStatNode extends StatmentNode {
    private ExprNode expr;

    public ReturnStatNode(Location loc, ExprNode expr){
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
