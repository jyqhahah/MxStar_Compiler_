package AST;


import SemanticChecker.Scope.Scope;
import utility.Location;

abstract public class ASTNode {
    Location loc;
    Scope scope;

    public ASTNode(Location loc){
        this.loc = loc;
        this.scope = null;
    }

    public Scope getScope(){
        return scope;
    }

    public void setScope(Scope scope){
        this.scope = scope;
    }

    public Location getLoc(){
        return loc;
    }

    public abstract void accept(ASTVisitor visitor);
}
