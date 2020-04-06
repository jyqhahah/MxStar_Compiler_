package AST;

import utility.Location;

public class PrimTypeNode extends TypeNode {
    public PrimTypeNode(Location loc, String Identifier){
        super(loc, Identifier);
    }

    @Override
    public String toString() {
        return Identifier;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
