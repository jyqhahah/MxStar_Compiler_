package AST;

import SemanticChecker.Scope.Symbol.Symbol;
import utility.Location;

public class IdExprNode extends ExprNode {
    private String Identifier;
    private Symbol symbol;

    public IdExprNode(Location loc, String Identifier){
        super(loc);
        this.Identifier = Identifier;
        this.symbol = null;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public void setSymbol(Symbol symbol) {
        this.symbol = symbol;
    }

    public Symbol getSymbol() {
        return symbol;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
