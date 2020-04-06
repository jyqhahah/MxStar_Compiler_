package SemanticChecker.Scope;


import AST.*;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;
import SemanticChecker.Scope.Symbol.VarSymbol;
import SemanticChecker.Scope.Type.Type;
import utility.errorReminder;

import java.util.ArrayList;

public interface Scope {
    public abstract Scope getGlobalScope();

    public abstract Scope getEnclosingScope();

    public abstract VarSymbol getVarSymbol(String Identifier);

    public abstract VarSymbol varDeclare(VardefNode var, errorReminder errorReminder);

    public abstract FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder);

    public abstract ClassSymbol ClassDeclare(ClassdefNode Class, errorReminder errorReminder);

    public abstract void ParaListDeclare(ArrayList<VardefNode> paraList, errorReminder errorReminder);

    public abstract FunctSymbol getFunctScope(String Identifier);

    public abstract ClassSymbol getClassScope(String Identifier);

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

