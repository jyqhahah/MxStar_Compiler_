package AST;

import utility.Location;

public class ForStatNode extends StatmentNode {
    private ExprNode init, condition, step;
    private StatmentNode stat;

    public ForStatNode (Location loc, ExprNode init, ExprNode condition, ExprNode step, StatmentNode stat){
        super(loc);
        this.init = init;
        this.condition = condition;
        this.step = step;
        this.stat = stat;
    }

    public ExprNode getInit() {
        return init;
    }

    public ExprNode getCondition() {
        return condition;
    }

    public ExprNode getStep() {
        return step;
    }

    public StatmentNode getStat() {
        return stat;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
