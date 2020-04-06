package AST;

import utility.Location;
import java.util.ArrayList;

public class ClassdefNode extends DefNode{
    private String Identifier;
    private FuncdefNode consDef;
    private ArrayList<VardefListNode> vardefList;
    private ArrayList<FuncdefNode> funcList;

    public ClassdefNode(Location loc, String Identifier, FuncdefNode consDef, ArrayList<VardefListNode> vardefList, ArrayList<FuncdefNode> funcList){
        super(loc);
        this.Identifier = Identifier;
        this.consDef = consDef;
        this.vardefList = vardefList;
        this.funcList = funcList;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public FuncdefNode getConsDef() {
        return consDef;
    }

    public ArrayList<VardefListNode> getVardefList() {
        return vardefList;
    }

    public ArrayList<FuncdefNode> getFuncList() {
        return funcList;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
