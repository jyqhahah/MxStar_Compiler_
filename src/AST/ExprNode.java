package AST;


import SemanticChecker.Scope.Type.Type;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;
import utility.Location;

public abstract class ExprNode extends ASTNode {
    Type type;
    boolean lvalue;
    register address;
    IROperand res;

    public ExprNode(Location loc){
        super(loc);
        lvalue = false;
    }

    public void setType(Type type){
        this.type = type;
    }

    public Type getType(){
        return type;
    }

    public void setLvalue(boolean lvalue){
        this.lvalue = lvalue;
    }

    public boolean getLvalue(){
        return lvalue;
    }

    public register getAddress() {
        return address;
    }

    public void setAddress(register address) {
        this.address = address;
    }

    public IROperand getRes() {
        return res;
    }

    public void setRes(IROperand res) {
        this.res = res;
    }
}
