package AST;

import utility.BinaryOperator;
import utility.Location;

public class BinaryExprNode extends ExprNode {
    private BinaryOperator op;
    private ExprNode left, right;

    public BinaryExprNode(Location loc, BinaryOperator op, ExprNode left, ExprNode right){
        super(loc);
        this.op = op;
        this.left = left;
        this.right = right;
    }

    public BinaryOperator getOp() {
        return op;
    }

    public ExprNode getLeft() {
        return left;
    }

    public ExprNode getRight() {
        return right;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
