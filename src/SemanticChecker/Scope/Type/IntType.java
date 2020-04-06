package SemanticChecker.Scope.Type;

import SemanticChecker.Scope.Symbol.Symbol;

public class IntType extends Symbol implements Type {
    public IntType(){
        super("int");
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
        return new String("int");
    }

    @Override
    public String typeString() {
        return new String("int");
    }
}
