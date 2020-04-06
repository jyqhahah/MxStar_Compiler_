package AST;


import SemanticChecker.Scope.Type.Type;
import utility.Location;

public abstract class ExprNode extends ASTNode {
    Type type;
    boolean lvalue;

    public ExprNode(Location loc){
        super(loc);
        lvalue = false;
    }

    public void setType(Type type){
        this.type = type;
    }

    public Type getType(){
        return type;
    }

    public void setLvalue(boolean lvalue){
        this.lvalue = lvalue;
    }

    public boolean getLvalue(){
        return lvalue;
    }
}
