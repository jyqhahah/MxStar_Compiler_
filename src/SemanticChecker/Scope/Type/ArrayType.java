package SemanticChecker.Scope.Type;

import SemanticChecker.Scope.Scope;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class ArrayType extends ClassSymbol implements Type {
    private int dims;

    public ArrayType (Scope scope, String Identifier, int dims){
        super(scope, Identifier);
        this.dims= dims;
        FunctList.put("size", new FunctSymbol(scope, "size", new IntType(), new LinkedHashMap<>()));
    }

    @Override
    public String toString() {
        String total_String = Identifier;
        for(int i = 0; i<dims; ++i){
            total_String += "[]";
        }
        return total_String;
    }

    @Override
    public String typeString() {
        return Identifier;
    }

    public int getDims() {
        return dims;
    }

    @Override
    public boolean isVar() {
        return false;
    }

    @Override
    public boolean isFunct() {
        return false;
    }
}
