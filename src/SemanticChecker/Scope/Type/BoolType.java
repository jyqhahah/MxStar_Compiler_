package SemanticChecker.Scope.Type;

import SemanticChecker.Scope.Symbol.Symbol;

public class BoolType extends Symbol implements Type{
    public BoolType(){
        super("bool");
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
        return new String("bool");
    }

    @Override
    public String typeString() {
        return new String("bool");
    }
}
