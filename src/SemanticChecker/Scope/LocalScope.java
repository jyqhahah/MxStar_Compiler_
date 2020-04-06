package SemanticChecker.Scope;

import AST.*;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;
import SemanticChecker.Scope.Symbol.VarSymbol;
import SemanticChecker.Scope.Type.ArrayType;
import SemanticChecker.Scope.Type.ScopeType;
import SemanticChecker.Scope.Type.Type;
import utility.errorReminder;

public class LocalScope extends BaseScope {
    private ScopeType scopeType;


    public LocalScope(Scope scope, ScopeType scopeType){
        super(scope);
        this.scopeType = scopeType;
    }


    @Override
    public Scope getGlobalScope() {
        return scope.getGlobalScope();
    }

    @Override
    public FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder) {
        errorReminder.error(funct.getLoc(), "error in LocalScope");
        return null;
    }

    @Override
    public ClassSymbol ClassDeclare(ClassdefNode Class, errorReminder errorReminder) {
        errorReminder.error(Class.getLoc(), "error in LocalScope");
        return null;
    }

    @Override
    public FunctSymbol getFunctScope(String Identifier) {
        return null;
    }

    @Override
    public ClassSymbol getClassScope(String Identifier) {
        return null;
    }

    @Override
    public FunctSymbol inFunctSymbol() {
        return scope.inFunctSymbol();
    }

    @Override
    public ClassSymbol inClassSymbol() {
        return scope.inClassSymbol();
    }

    @Override
    public boolean repeatedClassName(String Identifier) {
        return false;
    }

    @Override
    public Type TypeResolver(String Indentifier) {
        return (scope == null)?null:scope.TypeResolver(Indentifier);
    }

    @Override
    public FunctSymbol FunctResolver(MethodExprNode node, errorReminder errorReminder) {
        return scope.FunctResolver(node, errorReminder);
    }

    @Override
    public VarSymbol VarResolver(IdExprNode var, errorReminder errorReminder) {
        String var_id = var.getIdentifier();
        if(varList.containsKey(var_id))
            return varList.get(var_id);
        else
            return scope.VarResolver(var, errorReminder);
    }

    @Override
    public VarSymbol ArrayResolver(IndexExprNode array, errorReminder errorReminder) {
        String index_id = array.getIdentifier();
        if(varList.containsKey(index_id)){
            VarSymbol varSymbol = varList.get(index_id);
            Type varType = varSymbol.getType();
            if(varType instanceof ArrayType){
                ArrayType tmp = (ArrayType)varType;
                int dims = tmp.getDims();
                String id = varType.typeString();
                if(dims == 1) return new VarSymbol(index_id, null, TypeResolver(id));
                else return new VarSymbol(index_id, null, new ArrayType(getGlobalScope(), id, dims-1));
            }
            else{
                errorReminder.error(array.getLoc(), "error in LocalScope");
                return null;
            }
        }
        else
            return scope.ArrayResolver(array, errorReminder);
    }

    @Override
    public boolean isInLoop() {
        if(scopeType == ScopeType.LoopScope) return true;
        return scope.isInLoop();
    }

    @Override
    public boolean isInIf() {
        if(scopeType == ScopeType.LoopScope) return true;
        return scope.isInIf();
    }
}
