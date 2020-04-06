package AST;

import SemanticChecker.Scope.Symbol.FunctSymbol;
import utility.Location;
import java.util.ArrayList;

public class FuncdefNode extends DefNode {
    private String Identifier;
    private TypeNode type;
    private ArrayList<StatmentNode> statmentNodeArrayList;
    private ArrayList<VardefNode> paras;
    private FunctSymbol functSymbol;

    public FuncdefNode(Location loc, String Identifier, TypeNode type, ArrayList<StatmentNode> statmentNodeArrayList, ArrayList<VardefNode> paras){
        super(loc);
        this.Identifier = Identifier;
        this.type = type;
        this.statmentNodeArrayList = statmentNodeArrayList;
        this.paras = paras;
        this.functSymbol = null;
    }

    public TypeNode getType() {
        return type;
    }

    public String getIdentifier() {
        return Identifier;
    }

    public ArrayList<StatmentNode> getStatmentNodeArrayList() {
        return statmentNodeArrayList;
    }

    public ArrayList<VardefNode> getParas() {
        return paras;
    }

    public FunctSymbol getFunctSymbol() {
        return functSymbol;
    }

    public void setFunctSymbol(FunctSymbol functSymbol) {
        this.functSymbol = functSymbol;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
