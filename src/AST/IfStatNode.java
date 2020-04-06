package AST;

import utility.Location;

public class IfStatNode extends StatmentNode {
    private ExprNode condition;
    private StatmentNode Then, Else;

    public IfStatNode(Location loc, ExprNode condition, StatmentNode Then, StatmentNode Else){
        super(loc);
        this.condition = condition;
        this.Then = Then;
        this.Else = Else;
    }

    public ExprNode getCondition() {
        return condition;
    }

    public StatmentNode getElse() {
        return Else;
    }

    public StatmentNode getThen() {
        return Then;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
