package AST;

import utility.Location;
import java.util.ArrayList;

public class BlockStatNode extends StatmentNode{
    ArrayList<StatmentNode> stats;

    public BlockStatNode(Location loc, ArrayList<StatmentNode> stats){
        super(loc);
        this.stats = stats;
    }

    public ArrayList<StatmentNode> getStats() {
        return stats;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
