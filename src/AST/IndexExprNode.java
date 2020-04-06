package AST;

import SemanticChecker.Scope.Type.Type;
import utility.Location;

public class IndexExprNode extends ExprNode {
    private String Identifier;
    private ExprNode name, index;

    public IndexExprNode(Location loc, String Identifier, ExprNode name, ExprNode index){
        super(loc);
        this.Identifier = Identifier;
        this.name = name;
        this.index = index;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public ExprNode getName() {
        return name;
    }

    public ExprNode getIndex() {
        return index;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
