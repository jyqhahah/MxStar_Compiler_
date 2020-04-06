package AST;

import utility.Location;
import java.util.ArrayList;

public class ProgramNode extends ASTNode{
    private ArrayList<DefNode> defList;

    public ProgramNode(Location loc, ArrayList<DefNode> defList){
        super(loc);
        this.defList = defList;
    }

    public ArrayList<DefNode> getDefList(){
        return defList;
    }

    public void accept(ASTVisitor visitor){
        visitor.visit(this);
    }
}
