package SemanticChecker.Scope.Type;

import SemanticChecker.Scope.Symbol.Symbol;

public class VoidType extends Symbol implements Type {
    public VoidType(){
        super("void");
    }


    @Override
    public boolean isFunct() {
        return false;
    }

    @Override
    public boolean isVar() {
        return false;
    }

    @Override
    public String toString() {
        return new String("void");
    }

    @Override
    public String typeString() {
        return new String("void");
    }
}
