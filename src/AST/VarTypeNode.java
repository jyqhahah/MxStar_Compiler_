package AST;

import utility.Location;

public class VarTypeNode extends TypeNode {
    public VarTypeNode(Location loc, String Identifier){
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
