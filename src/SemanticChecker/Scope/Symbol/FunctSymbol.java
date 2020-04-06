package SemanticChecker.Scope.Symbol;

import AST.*;
import SemanticChecker.Scope.Scope;
import SemanticChecker.Scope.Type.ArrayType;
import SemanticChecker.Scope.Type.Type;
import utility.errorReminder;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class FunctSymbol extends SymbolTable{
    private Type type;
    private LinkedHashMap<String, VarSymbol> paraList;
    private boolean isConstructor;

    public FunctSymbol(Scope scope, String Identifier, Type type, LinkedHashMap<String, VarSymbol> paraList){
        super(scope, Identifier);
        this.type = type;
        this.paraList = paraList;
        this.isConstructor = false;
    }

    public FunctSymbol(Scope scope, String Identifier, Type type, LinkedHashMap<String, VarSymbol> paraList, LinkedHashMap<String, VarSymbol> varList){
        super(scope, Identifier);
        this.type = type;
        this.paraList = paraList;
        this.varList = varList;
        this.isConstructor = false;
    }

    public void setConstructor(boolean isConstructor) {
        this.isConstructor = isConstructor;
    }

    public boolean isConstructor() {
        return isConstructor;
    }

    public LinkedHashMap<String, VarSymbol> getParaList() {
        return paraList;
    }

    public Type getType() {
        return type;
    }

    @Override
    public FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder) {
        errorReminder.error(funct.getLoc(), "invalid declare of function");
        return null;
    }

    @Override
    public void ParaListDeclare(ArrayList<VardefNode> paraList, errorReminder errorReminder) {
        for(var para: paraList){
            if(para == null) continue;
            TypeNode typeNode = para.getType();
            String id = typeNode.typeName();
            Type type = TypeResolver(id);
            if(type == null){
                errorReminder.error(para.getLoc(),"invalid typename"+id+"\'");
                return;
            }
            if(type.equals("void")){
                errorReminder.error(para.getLoc(), "invalid declare of variable 'void'");
                return;
            }
            String Identifier = para.getIdentifier();
            if(varList.containsKey(Identifier)){
                errorReminder.error(para.getLoc(),"redeclare of para"+Identifier+"\'");
                return;
            }
            if(typeNode instanceof ArrayTypeNode){
                ArrayTypeNode tmp = (ArrayTypeNode)typeNode;
                ArrayType array_tmp= new ArrayType(getGlobalScope(), id, tmp.getDims());
                VarSymbol varSymbol = new VarSymbol(Identifier, this, array_tmp);
                varList.put(Identifier, varSymbol);
                this.paraList.put(Identifier, varSymbol);
            }
            else{
                VarSymbol varSymbol = new VarSymbol(Identifier, this, type);
                varList.put(Identifier, varSymbol);
                this.paraList.put(Identifier, varSymbol);
            }
        }
    }

    @Override
    public FunctSymbol getFunctScope(String Identifier) {
        return null;
    }

    @Override
    public FunctSymbol inFunctSymbol() {
        return this;
    }

    @Override
    public ClassSymbol inClassSymbol() {
        return scope.inClassSymbol();
    }

    @Override
    public FunctSymbol FunctResolver(MethodExprNode node, errorReminder errorReminder) {
        return scope.FunctResolver(node, errorReminder);
    }

    @Override
    public boolean isFunct() {
        return true;
    }
}
