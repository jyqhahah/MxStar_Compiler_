package AST;

import utility.Location;

public class StringLiterExprNode extends LiterExprNode {
    private String stringLiter;

    public StringLiterExprNode(Location loc, String stringLiter){
        super(loc);
        this.stringLiter = stringLiter;
    }

    public String getStringLiter(){
        return getStringLiter();
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
