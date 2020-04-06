package AST;

import utility.Location;

import java.util.ArrayList;

public class MethodExprNode extends ExprNode {
    private String Identifier;
    private ArrayList<ExprNode> paraList;
    private ExprNode name;

    public MethodExprNode(Location loc, String Identifier, ArrayList<ExprNode> paraList, ExprNode name){
        super(loc);
        this.Identifier = Identifier;
        this.paraList = paraList;
        this.name = name;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public ArrayList<ExprNode> getParaList() {
        return paraList;
    }

    public ExprNode getName() {
        return name;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
