package SemanticChecker.Scope.Symbol;

import SemanticChecker.Scope.Scope;
import AST.*;
import SemanticChecker.Scope.Type.*;
import SemanticChecker.Scope.Type.ArrayType;
import utility.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public abstract class SymbolTable extends Symbol implements Scope {
    LinkedHashMap<String, VarSymbol> varList;
    Scope scope;

    public SymbolTable(Scope scope, String Identifier){
        super(Identifier);
        this.scope = scope;
        this.varList = new LinkedHashMap<>();
    }

    public VarSymbol getVarSymbol(String Identifier){
        return varList.get(Identifier);
    }

    public abstract FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder);

    public abstract void ParaListDeclare(ArrayList<VardefNode> paraList, errorReminder errorReminder);

    public abstract FunctSymbol getFunctScope(String Identifier);

    @Override
    public VarSymbol varDeclare(VardefNode var, errorReminder errorReminder) {
        //System.out.println("1");
        TypeNode typeNode = var.getType();
        String id = typeNode.typeName();
        Type type = TypeResolver(id);
        String Identifier = var.getIdentifier();
        if(type == null){
            errorReminder.error(var.getLoc(), "invalid type of variable");
            return null;
        }
        if(id.equals("void")){
            errorReminder.error(var.getLoc(), "invalid declare of variable 'void'");
            return null;
        }
        if(typeNode instanceof ArrayTypeNode) {
            ArrayTypeNode tmp_node = (ArrayTypeNode)typeNode;
            type = new ArrayType(getGlobalScope(), id, tmp_node.getDims());
        }
        if(this.varList.containsKey(Identifier)){
            //for(var vartmp : varList.keySet()) System.out.println(vartmp.toString());
            errorReminder.error(var.getLoc(), "redeclare variable \''"+Identifier+"\'.");
            return null;
        }
        VarSymbol varSymbol = new VarSymbol(Identifier, this, type);
        varList.put(Identifier, varSymbol);
        return varSymbol;
    }

    @Override
    public ClassSymbol ClassDeclare(ClassdefNode Class, errorReminder errorReminder) {
        errorReminder.error(Class.getLoc(), "invalid declare of class");
        return null;
    }

    @Override
    public Type TypeResolver(String Indentifier) {
        if(scope == null){
            return null;
        }
        return scope.TypeResolver(Indentifier);
    }

    @Override
    public VarSymbol VarResolver(IdExprNode var, errorReminder errorReminder) {
        String Identifier = var.getIdentifier();
        if(varList.containsKey(Identifier))
            return varList.get(Identifier);
        else
            return scope.VarResolver(var, errorReminder);
    }

    public abstract FunctSymbol FunctResolver(MethodExprNode node, errorReminder errorReminder);

    @Override
    public VarSymbol ArrayResolver(IndexExprNode array, errorReminder errorReminder) {
        String Identifier = array.getIdentifier();
        if(varList.containsKey(Identifier)){
            VarSymbol varSymbol = varList.get(Identifier);
            Type type = varSymbol.getType();
            if(type instanceof ArrayType) {
                String id = type.typeString();
                ArrayType tmp = (ArrayType) type;
                int dims = tmp.getDims();
                if (dims == 1)
                    return new VarSymbol(Identifier, null, TypeResolver(id));
                else {
                    ArrayType tmp_type = new ArrayType(getGlobalScope(), id, dims - 1);
                    return new VarSymbol(Identifier, null, tmp_type);
                }
            }
            else {
                errorReminder.error(array.getLoc(), Identifier+"is not an array");
                return null;
            }
        }
        else
            return scope.ArrayResolver(array, errorReminder);
    }

    @Override
    public boolean isVar() {
        return false;
    }

    public abstract boolean isFunct();

    @Override
    public Scope getGlobalScope() {
        return scope;
    }

    @Override
    public boolean repeatedClassName(String Identifier) {
        return false;
    }

    @Override
    public Scope getEnclosingScope() {
        return scope;
    }

    @Override
    public ClassSymbol getClassScope(String Identifier) {
        return null;
    }

    public abstract FunctSymbol inFunctSymbol();

    public abstract ClassSymbol inClassSymbol();

    @Override
    public boolean isInLoop() {
        return false;
    }

    @Override
    public boolean isInIf() {
        return false;
    }
}
