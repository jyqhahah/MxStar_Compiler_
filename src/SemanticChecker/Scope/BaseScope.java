package SemanticChecker.Scope;

import AST.*;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;
import SemanticChecker.Scope.Symbol.VarSymbol;
import SemanticChecker.Scope.Type.ArrayType;
import SemanticChecker.Scope.Type.Type;
import utility.errorReminder;

import java.util.ArrayList;
import java.util.LinkedHashMap;

abstract public class BaseScope implements Scope{
    Scope scope;
    LinkedHashMap<String, VarSymbol> varList;

    public BaseScope(Scope scope){
        this.scope = scope;
        this.varList = new LinkedHashMap<>();
    }

    public abstract Scope getGlobalScope();

    @Override
    public Scope getEnclosingScope() {
        return scope;
    }

    @Override
    public VarSymbol varDeclare(VardefNode var, errorReminder errorReminder) {
        TypeNode typeNode = var.getType();
        String id = typeNode.typeName();
        Type type = TypeResolver(id);
        String Identifier = var.getIdentifier();
        if(type == null) {
            errorReminder.error(var.getLoc(), "invalid typename" + id + "\'");
            return null;
        }
        if(id.equals("void")){
            errorReminder.error(var.getLoc(), "invalid declare of variable 'void'");
            return null;
        }
        if(varList.containsKey(Identifier)){
            errorReminder.error(var.getLoc(), "redeclare of var"+Identifier+"\'");
            return null;
        }
        if(typeNode instanceof ArrayTypeNode){
            ArrayTypeNode tmp_node = (ArrayTypeNode)typeNode;
            type = new ArrayType(getGlobalScope(), id, tmp_node.getDims());
        }
        VarSymbol varSymbol = new VarSymbol(Identifier, this, type);
        varList.put(Identifier, varSymbol);
        return varSymbol;
    }

    public abstract FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder);

    public abstract ClassSymbol ClassDeclare(ClassdefNode Class, errorReminder errorReminder);

    @Override
    public void ParaListDeclare(ArrayList<VardefNode> paraList, errorReminder errorReminder) {
        return;
    }

    @Override
    public VarSymbol getVarSymbol(String Identifier) {
        return varList.get(Identifier);
    }

    public abstract FunctSymbol getFunctScope(String Identifier);

    public abstract FunctSymbol inFunctSymbol();

    public abstract ClassSymbol inClassSymbol();

    public abstract boolean repeatedClassName(String Identifier);

    public abstract Type TypeResolver(String Indentifier);

    public abstract FunctSymbol FunctResolver(MethodExprNode node, errorReminder errorReminder);

    public abstract VarSymbol VarResolver(IdExprNode var, errorReminder errorReminder);

    public abstract VarSymbol ArrayResolver(IndexExprNode array, errorReminder errorReminder);

    public abstract boolean isInLoop();

    public abstract boolean isInIf();
}
