package utility;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;

public class Location {
    private int row, col;

    public Location(Token token){
        this.row = token.getLine();
        this.col = token.getCharPositionInLine();
    }

    public Location(int row, int col){
        this.row = row;
        this.col = col;
    }

    public Location(ParserRuleContext ctx){
        this(ctx.start);
    }

    public String toString(){
        return "(" + row + "," + col + ")";
    }
}
