package SemanticChecker.Scope.Type;

import SemanticChecker.Scope.Scope;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;
import SemanticChecker.Scope.Symbol.VarSymbol;

import java.util.LinkedHashMap;

public class StringType extends ClassSymbol implements Type {
    public StringType(Scope GlobalScope){
        super(GlobalScope, "string");
        // length
        FunctList.put("length", new FunctSymbol(this, "length", new IntType(), new LinkedHashMap<>()));
        // string(left,right)
        LinkedHashMap<String, VarSymbol> paras = new LinkedHashMap<>();
        paras.put("left", new VarSymbol("left", null, new IntType()));
        paras.put("right", new VarSymbol("right", null, new IntType()));
        FunctList.put("substring", new FunctSymbol(this, "substring", this, paras, paras));
        // parseInt
        FunctList.put("parseInt", new FunctSymbol(this, "parseInt", new IntType(), new LinkedHashMap<>()));
        //int pos(int ord)
        LinkedHashMap<String, VarSymbol> paras1 = new LinkedHashMap<>();
        paras1.put("pos", new VarSymbol("pos", null ,new IntType()));
        FunctList.put("ord", new FunctSymbol(this, "ord", new IntType(), paras1, paras1));
    }

    public LinkedHashMap<String, FunctSymbol> getFunctList(){
        return FunctList;
    }

    @Override
    public String toString() {
        return new String("string");
    }

    @Override
    public String typeString() {
        return new String("string");
    }

    @Override
    public boolean isFunct() {
        return false;
    }

    @Override
    public boolean isVar() {
        return false;
    }
}
