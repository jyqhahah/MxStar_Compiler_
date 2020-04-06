package SemanticChecker.Scope.Symbol;

public abstract class Symbol {
    private boolean isDefined;
    protected String Identifier;

    public Symbol(String Identifier){
        this.Identifier = Identifier;
    }

    public boolean IsDefined(){
        return isDefined;
    }

    public String getIdentifier(){
        return Identifier;
    }

    public void setDefined(){
        this.isDefined = true;
    }

    public abstract boolean isFunct();

    public abstract boolean isVar();

}
