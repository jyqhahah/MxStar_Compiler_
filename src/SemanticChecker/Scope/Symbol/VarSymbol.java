package SemanticChecker.Scope.Symbol;

import AST.ExprNode;
import SemanticChecker.Scope.Scope;
import SemanticChecker.Scope.Type.NullType;
import SemanticChecker.Scope.Type.StringType;
import SemanticChecker.Scope.Type.Type;
import llvm_IR.operand.register;
import llvm_IR.type.IRType;
import utility.errorReminder;

public class VarSymbol extends Symbol {
    private Scope scope;
    private Type type;
    private register address;
    private IRType irType;

    public VarSymbol(String Identifier, Scope scope, Type type){
        super(Identifier);
        this.scope = scope;
        this.type = type;
    }

    public Scope getScope() {
        return scope;
    }

    public Type getType() {
        return type;
    }

    public void setScope(Scope scope) {
        this.scope = scope;
    }

    public void setType(Type type){
        this.type = type;
    }

    public void setAddress(register address) {
        this.address = address;
    }

    public register getAddress() {
        return address;
    }

    public void setIrType(IRType irType) {
        this.irType = irType;
    }

    public IRType getIrType() {
        return irType;
    }

    @Override
    public boolean isFunct() {
        return false;
    }

    @Override
    public boolean isVar() {
        return true;
    }

    public void checkInitValue(ExprNode initValue, errorReminder errorReminder){
        Type initType = initValue.getType();
        if (initType != null) {
            if (initType instanceof NullType) {
                if (!(type instanceof ClassSymbol) || (type instanceof StringType)) {
                    errorReminder.error(initValue.getLoc(),
                            "\'" + type.toString() + "\' cannot be assigned to \'null\'."
                    );
                }
            }
            else if (!initType.toString().equals(type.toString())) {
                errorReminder.error(initValue.getLoc(),
                        "cannot convert \'" + initType.toString() + "\' to \'" + type.toString() + "\' in initialization."
                );
            }
        }
    }
}
