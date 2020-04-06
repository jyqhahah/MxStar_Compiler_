package AST;

import utility.Location;

public abstract class StatmentNode extends ASTNode{
    public StatmentNode(Location loc){
        super(loc);
    }

    public abstract void accept(ASTVisitor visitor);
}
