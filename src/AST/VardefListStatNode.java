package AST;

import utility.Location;

public class VardefListStatNode extends StatmentNode {
    private VardefListNode VardefList;

    public VardefListStatNode(Location loc, VardefListNode VardefList){
        super(loc);
        this.VardefList = VardefList;
    }

    public VardefListNode getVardefList() {
        return VardefList;
    }

    @Override
    public void accept(ASTVisitor visitor) {
        visitor.visit(this);
    }
}
