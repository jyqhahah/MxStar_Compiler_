package AST;

import utility.Location;

public class ArrayTypeNode extends TypeNode {
    private int dims;

    public ArrayTypeNode(Location loc, String Identifier, int dims){
        super(loc, Identifier);
        this.dims = dims;
        //System.out.println(Identifier);
    }

    public int getDims() {
        return dims;
    }

    @Override
    public String toString() {
        String totalName = Identifier;
        for(int i = 0; i<dims; ++i){
            totalName += "[]";
        }
        return totalName;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
