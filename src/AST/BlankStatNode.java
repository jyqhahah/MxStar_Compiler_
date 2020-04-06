package AST;

import utility.Location;

public class BlankStatNode extends StatmentNode {
    public BlankStatNode(Location loc){
        super(loc);
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
