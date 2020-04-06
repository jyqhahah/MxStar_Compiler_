package AST;

import SemanticChecker.Scope.Symbol.Symbol;
import utility.Location;

import javax.swing.*;

public class MemberExprNode extends ExprNode{
    private String Identifier;
    private ExprNode name, member;
    private Symbol symbol;

    public MemberExprNode(Location loc, String Identifier, ExprNode name, ExprNode member){
        super(loc);
        this.Identifier = Identifier;
        this.name = name;
        this.member = member;
        this.symbol = null;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public ExprNode getName() {
        return name;
    }

    public ExprNode getMember() {
        return member;
    }

    public void setIdentifier(String identifier) {
        Identifier = identifier;
    }

    public void setName(ExprNode name) {
        this.name = name;
    }

    public void setMember(ExprNode member) {
        this.member = member;
    }

    public void setSymbol(Symbol symbol) {
        this.symbol = symbol;
    }

    public Symbol getSymbol() {
        return symbol;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
