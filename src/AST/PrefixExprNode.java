package AST;

import utility.Location;
import utility.UnaryOperator;

public class PrefixExprNode extends ExprNode {
    private UnaryOperator op;
    private ExprNode expr;

    public PrefixExprNode(Location loc, UnaryOperator op, ExprNode expr){
        super(loc);
        this.op = op;
        this.expr = expr;
    }

    public UnaryOperator getOp() {
        return op;
    }

    public ExprNode getExpr() {
        return expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
