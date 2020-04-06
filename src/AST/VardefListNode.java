package AST;

import utility.Location;
import java.util.ArrayList;

public class VardefListNode extends DefNode{
    private ArrayList<VardefNode> varList;
    private TypeNode type;

    public VardefListNode(Location loc, TypeNode type, ArrayList<VardefNode>varList){
        super(loc);
        this.type = type;
        this.varList = varList;
    }

    public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }

    public TypeNode getType(){
        return type;
    }

    public ArrayList<VardefNode> getVarList() {
        return varList;
    }
}
