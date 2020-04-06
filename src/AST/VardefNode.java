package AST;

import SemanticChecker.Scope.Symbol.VarSymbol;
import utility.Location;

public class VardefNode extends ASTNode {
    private String Identifier;
    private TypeNode type;
    private ExprNode expr;
    private VarSymbol varSymbol;

    public VardefNode(Location loc, String Idenntifier, TypeNode type, ExprNode expr) {
        super(loc);
        this.Identifier = Idenntifier;
        this.type = type;
        this.expr = expr;
        this.varSymbol = null;
    }

    public String getIdentifier(){
        return Identifier;
    }

    public TypeNode getType(){
        return type;
    }

    public ExprNode getExpr(){
        return expr;
    }

    public VarSymbol getVarSymbol(){ return varSymbol; }

    public void setType(TypeNode type){
        this.type = type;
    }

    public void setExpr(ExprNode expr) {
        this.expr = expr;
    }

    public void setVarSymbol(VarSymbol varSymbol){
        this.varSymbol = varSymbol;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
