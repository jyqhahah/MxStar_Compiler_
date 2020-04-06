package AST;

import utility.Location;

public class BreakStatNode extends StatmentNode {
    public BreakStatNode(Location loc){
        super(loc);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
