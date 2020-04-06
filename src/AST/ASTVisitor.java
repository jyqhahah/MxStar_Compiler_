package AST;

public interface ASTVisitor {
    public abstract void visit(ProgramNode Node);

    public abstract void visit(VardefListNode node);
    public abstract void visit(FuncdefNode node);
    public abstract void visit(VardefNode node);
    public abstract void visit(ClassdefNode node);
    public abstract void visit(BinaryExprNode node);
    public abstract void visit(IndexExprNode node);
    public abstract void visit(CreatorExprNode node);
    public abstract void visit(ThisExprNode node);
    public abstract void visit(IdExprNode node);
    public abstract void visit(PrefixExprNode node);
    public abstract void visit(PostfixExprNode node);
    public abstract void visit(SubExprNode node);
    public abstract void visit(MemberExprNode node);
    public abstract void visit(MethodExprNode node);
    public abstract void visit(BlankStatNode node);
    public abstract void visit(BreakStatNode node);
    public abstract void visit(BlockStatNode node);
    public abstract void visit(ContinueStatNode node);
    public abstract void visit(ExprStatNode node);
    public abstract void visit(ForStatNode node);
    public abstract void visit(IfStatNode node);
    public abstract void visit(ReturnStatNode node);
    public abstract void visit(VardefListStatNode node);
    public abstract void visit(WhileStatNode node);
    public abstract void visit(PrimTypeNode node);
    public abstract void visit(ArrayTypeNode node);
    public abstract void visit(VarTypeNode node);
    public abstract void visit(BoolLiterExprNode node);
    public abstract void visit(IntLiterExprNode node);
    public abstract void visit(StringLiterExprNode node);
    public abstract void visit(NullLiterExprNode node);

}
