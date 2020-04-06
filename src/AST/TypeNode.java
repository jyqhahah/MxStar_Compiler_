package AST;

import utility.Location;

public abstract class TypeNode extends ASTNode {
    String Identifier;

    public TypeNode(Location loc, String Identifier){
        super(loc);
        this.Identifier = Identifier;
    }

    public abstract String toString();

    public String typeName(){
        return Identifier;
    }

    public abstract void accept(ASTVisitor visitor);
}
