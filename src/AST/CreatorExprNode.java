package AST;

import utility.Location;
import java.util.ArrayList;

public class CreatorExprNode extends ExprNode {
    private int dims;
    private TypeNode type;
    private ArrayList<ExprNode> expr;

    public CreatorExprNode(Location loc, int dims, TypeNode type, ArrayList<ExprNode> expr){
        super(loc);
        this.dims = dims;
        this.type = type;
        this.expr = expr;
    }

    public TypeNode getTypeNode() {
        return type;
    }

    public int getDims() {
        return dims;
    }

    public ArrayList<ExprNode> getExpr() {
        return expr;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
