package AST;

import utility.Location;

public class ContinueStatNode extends StatmentNode {
    public ContinueStatNode(Location loc){
        super(loc);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
