package AST;

import utility.Location;

public class WhileStatNode extends StatmentNode {
    private ExprNode expr;
    private StatmentNode stat;

    public WhileStatNode (Location loc, ExprNode expr, StatmentNode stat){
        super(loc);
        this.expr = expr;
        this.stat = stat;
    }

    public ExprNode getExpr() {
        return expr;
    }

    public StatmentNode getStat() {
        return stat;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
