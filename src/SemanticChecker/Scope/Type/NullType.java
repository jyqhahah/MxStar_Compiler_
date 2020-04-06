package SemanticChecker.Scope.Type;

import SemanticChecker.Scope.Symbol.Symbol;

public class NullType extends Symbol implements Type {
    public NullType(){
        super("null");
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
        return new String("null");
    }

    @Override
    public String typeString() {
        return new String("null");
    }
}
