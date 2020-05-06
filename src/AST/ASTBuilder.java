package AST;

import SemanticChecker.Scope.Type.Type;
import parser.MxStarBaseVisitor;
import parser.MxStarParser;
import utility.BinaryOperator;
import utility.Location;
import utility.UnaryOperator;
import utility.errorReminder;

import java.util.ArrayList;

public class ASTBuilder extends MxStarBaseVisitor<ASTNode> {
    private errorReminder errorReminder;

    public ASTBuilder(errorReminder errorReminder){
        this.errorReminder = errorReminder;
    }

    @Override
    public ASTNode visitProgram(MxStarParser.ProgramContext ctx) {
        ArrayList<DefNode> programDef = new ArrayList<>();
        for (var def : ctx.def()){
            programDef.add((DefNode)visit(def));
        }
        Location loc = new Location(ctx.getStart());
        return new ProgramNode(loc, programDef);
    }

    @Override
    public ASTNode visitDef(MxStarParser.DefContext ctx) {
        if (ctx.classdef() != null)
            return visit(ctx.classdef());
        else if (ctx.funcdef() != null)
            return visit(ctx.funcdef());
        else if (ctx.vardefList() != null)
            return visit(ctx.vardefList());
        else
            return null;
    }

    @Override
    public ASTNode visitVardef(MxStarParser.VardefContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = null;
        if(ctx.expr() != null)
            expr = (ExprNode)visit(ctx.expr());
        if(ctx.Identifier() != null)
            return new VardefNode(loc, ctx.Identifier().getText(), null, expr);
        else {
            errorReminder.error(loc, "invalid variable");
            return null;
        }
    }

    @Override
    public ASTNode visitVardefList(MxStarParser.VardefListContext ctx) {
        TypeNode type = (TypeNode)visit(ctx.type());
        ArrayList<VardefNode> varList = new ArrayList<>();
        for (var def :ctx.vardef()){
            VardefNode visitor = (VardefNode)visit(def);
            if(visitor != null){
                visitor.setType(type);
                varList.add(visitor);
            }
        }
        Location loc = new Location(ctx.getStart());
        return new VardefListNode(loc, type, varList);
    }

    @Override
    public ASTNode visitConsdef(MxStarParser.ConsdefContext ctx) {
        ArrayList<StatmentNode> statmentNodes = new ArrayList<>();
        Location loc = new Location(ctx.getStart());
        for(var stmt: ctx.stat()){
            StatmentNode tmp = (StatmentNode)visit(stmt);
            statmentNodes.add(tmp);
        }
        return new FuncdefNode(loc, ctx.Identifier().getText(), null, statmentNodes, new ArrayList<VardefNode>());
    }

    @Override
    public ASTNode visitFuncdef(MxStarParser.FuncdefContext ctx) {
        Location loc = new Location(ctx.getStart());
        //System.out.println(((TypeNode)visit(ctx.type())).typeName());
        if(ctx.Identifier() == null){
            errorReminder.error(loc, "invalid function");
            return null;
        }
        //System.out.println(ctx.Identifier());
        ArrayList<VardefNode> vardefNodes = new ArrayList<>();
        for(var para : ctx.paraList().para()){
            vardefNodes.add((VardefNode)visit(para));
        }
        ArrayList<StatmentNode> statNodes = new ArrayList<>();
        for(var stat : ctx.stat()){
            //System.out.println(stat.getText()+"    \\\'");
            statNodes.add((StatmentNode)visit(stat));
        }
        return new FuncdefNode(loc, ctx.Identifier().getText(), (TypeNode)visit(ctx.type()), statNodes, vardefNodes);
    }

    @Override
    public ASTNode visitClassdef(MxStarParser.ClassdefContext ctx) {
        Location loc = new Location(ctx.getStart());
        if (ctx.Identifier() == null) {
            errorReminder.error(loc, "Invalid class");
            return null;
        }
        String Identifier = ctx.Identifier().getText();
        ArrayList<VardefListNode> vardefNodes = new ArrayList<>();
        for (var variable : ctx.vardefList()){
            vardefNodes.add((VardefListNode)visit(variable));
        }
        ArrayList<FuncdefNode> funcdefNodes = new ArrayList<>();
        for (var function : ctx.funcdef()){
            funcdefNodes.add((FuncdefNode)visit(function));
        }
        FuncdefNode consDef = null;
        for (var constructor : ctx.consdef()){
            if(!constructor.Identifier().getText().equals(Identifier)){
                errorReminder.error(loc, "invalid constructor");
            }
            else{
                consDef = (FuncdefNode)visit(constructor);
            }
        }
        return new ClassdefNode(loc, Identifier, consDef, vardefNodes, funcdefNodes);
    }

    @Override
    public ASTNode visitPara(MxStarParser.ParaContext ctx) {
        Location loc = new Location(ctx.getStart());
        String Identifier = ctx.Identifier().getText();
        ExprNode expr = null;
        if(ctx.expr() != null)
            expr = (ExprNode)visit(ctx.expr());
        TypeNode type = (TypeNode)visit(ctx.type());
        return new VardefNode(loc,Identifier, type, expr);
    }

    @Override
    public ASTNode visitBlock(MxStarParser.BlockContext ctx) {
        ArrayList<StatmentNode> statmentNodes = new ArrayList<>();
        Location loc = new Location(ctx.getStart());
        for(var tmp : ctx.stat()){
            statmentNodes.add((StatmentNode)visit(tmp));
        }
        return new BlockStatNode(loc, statmentNodes);
    }

    @Override
    public ASTNode visitBlockStat(MxStarParser.BlockStatContext ctx) {
        ArrayList<StatmentNode> statmentNodes = new ArrayList<>();
        Location loc = new Location(ctx.getStart());
        for(var tmp : ctx.block().stat()){
            statmentNodes.add((StatmentNode)visit(tmp));
        }
        return new BlockStatNode(loc, statmentNodes);
    }

    @Override
    public ASTNode visitIfStat(MxStarParser.IfStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode condition = null;
        if(ctx.expr() != null){
            condition = (ExprNode)visit(ctx.expr());
        }
        StatmentNode stat = null;
        if(ctx.stat(1) != null){
            stat = (StatmentNode)visit(ctx.stat(1));
        }
        return new IfStatNode(loc, condition, (StatmentNode)visit(ctx.stat(0)), stat);
    }

    @Override
    public ASTNode visitForStat(MxStarParser.ForStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode init = null, condition = null, step = null;
        if(ctx.init != null) init = (ExprNode)visit(ctx.init);
        if(ctx.cond != null) condition = (ExprNode)visit(ctx.cond);
        if(ctx.step != null) step = (ExprNode)visit(ctx.step);
        return new ForStatNode(loc, init, condition, step, (StatmentNode)visit(ctx.stat()));
    }

    @Override
    public ASTNode visitVardefListStat(MxStarParser.VardefListStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        TypeNode type = (TypeNode)visit(ctx.vardefList().type());
        ArrayList<VardefNode> varList = new ArrayList<>();
        if(ctx.vardefList() != null){
            for(var variable : ctx.vardefList().vardef()){
                VardefNode tmp = (VardefNode)visit(variable);
                if(tmp!=null){
                    tmp.setType(type);
                    varList.add(tmp);
                }
            }
        }
        VardefListNode vardefListNode = new VardefListNode(loc, type, varList);
        return new VardefListStatNode(loc, vardefListNode);
    }

    @Override
    public ASTNode visitBlankStat(MxStarParser.BlankStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new BlankStatNode(loc);
    }

    @Override
    public ASTNode visitWhileStat(MxStarParser.WhileStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = null;
        if(ctx.expr() != null) expr = (ExprNode)visit(ctx.expr());
        return new WhileStatNode(loc, expr, (StatmentNode)visit(ctx.stat()));
    }

    @Override
    public ASTNode visitReturnStat(MxStarParser.ReturnStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = null;
        //System.out.println(ctx.expr().getText());
        if(ctx.expr() != null) expr = (ExprNode)visit(ctx.expr());
        return new ReturnStatNode(loc, expr);
    }

    @Override
    public ASTNode visitBreakStat(MxStarParser.BreakStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new BreakStatNode(loc);
    }

    @Override
    public ASTNode visitContinueStat(MxStarParser.ContinueStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new ContinueStatNode(loc);
    }

    @Override
    public ASTNode visitExprStat(MxStarParser.ExprStatContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = (ExprNode)visit(ctx.expr());
        return new ExprStatNode(loc, expr);
    }

    @Override
    public ASTNode visitWrong_creator(MxStarParser.Wrong_creatorContext ctx) {
        Location loc = new Location(ctx.getStart());
        errorReminder.error(loc, "invalid creator");
        System.err.println("Invalid creator" + ctx.getText());
        ArrayList<ExprNode> sz = new ArrayList<>();
        for(var tmp : ctx.expr()){
            sz.add((ExprNode)visit(tmp));
        }
        int dims = ctx.getText().length() - (ctx.getText().replaceAll("]","")).length();
        return new CreatorExprNode(loc, dims, (TypeNode)visit(ctx.varType()), sz);
    }

    @Override
    public ASTNode visitArray_creator(MxStarParser.Array_creatorContext ctx) {
        Location loc = new Location(ctx.getStart());
        ArrayList<ExprNode> sz = new ArrayList<>();
        for(var tmp : ctx.expr()){
            sz.add((ExprNode)visit(tmp));
        }
        int dims = ctx.getText().length() - (ctx.getText().replaceAll("]","")).length();
        return new CreatorExprNode(loc, dims, (TypeNode)visit(ctx.varType()), sz);
    }

    @Override
    public ASTNode visitClass_creator(MxStarParser.Class_creatorContext ctx) {
        Location loc = new Location(ctx.getStart());
        ArrayList<ExprNode> sz = new ArrayList<>();
        return new CreatorExprNode(loc, 0, (TypeNode)visit(ctx.varType()), sz);
    }

    @Override
    public ASTNode visitVarType_creator(MxStarParser.VarType_creatorContext ctx) {
        Location loc = new Location(ctx.getStart());
        ArrayList<ExprNode> sz = new ArrayList<>();
        return new CreatorExprNode(loc, 0, (TypeNode)visit(ctx.varType()), sz);
    }

    @Override
    public ASTNode visitSub_expr(MxStarParser.Sub_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = (ExprNode)visit(ctx.expr());
        return new SubExprNode(loc, expr);
    }

    @Override
    public ASTNode visitMember_expr(MxStarParser.Member_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode name = (ExprNode)visit(ctx.expr());
        String Identifier = null;
        if(ctx.Identifier() != null) Identifier = ctx.Identifier().getText();
        IdExprNode member = new IdExprNode(loc, Identifier);
        return new MemberExprNode(loc, Identifier, name, member);
    }

    @Override
    public ASTNode visitBinary_expr(MxStarParser.Binary_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        String opName = ctx.op.getText();
        BinaryOperator op = null;
        switch (opName){
            case"+":    op = BinaryOperator.ADD;break;
            case"-":    op = BinaryOperator.SUB;break;
            case"*":    op = BinaryOperator.MUL;break;
            case"/":    op = BinaryOperator.DIV;break;
            case"%":    op = BinaryOperator.MOD;break;
            case"<<":   op = BinaryOperator.LEFTSHIFT;break;
            case">>":   op = BinaryOperator.RIGHTSHIFT;break;
            case"<":    op = BinaryOperator.LESS;break;
            case">":    op = BinaryOperator.GREATER;break;
            case"<=":   op = BinaryOperator.LEQ;break;
            case">=":   op = BinaryOperator.GEQ;break;
            case"==":   op = BinaryOperator.EQ;break;
            case"!=":   op = BinaryOperator.NEQ;break;
            case"||":   op = BinaryOperator.LOGICALOR;break;
            case"&&":   op = BinaryOperator.LOGICALAND;break;
            case"|":    op = BinaryOperator.BITWISEOR;break;
            case"&":    op = BinaryOperator.BITWISEAND;break;
            case"^":    op = BinaryOperator.BITWISEXOR;break;
            case"=":    op = BinaryOperator.ASSIGN;break;
            default:    op = BinaryOperator.INVALID;
        }
        return new BinaryExprNode(loc, op, (ExprNode)visit(ctx.expr(0)), (ExprNode)visit(ctx.expr(1)));
    }

    @Override
    public ASTNode visitIndex_expr(MxStarParser.Index_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new IndexExprNode(loc, null, (ExprNode)visit(ctx.expr(0)), (ExprNode)visit(ctx.expr(1)));
    }

    @Override
    public ASTNode visitThis_expr(MxStarParser.This_exprContext ctx) {
        Location loc = new Location((ctx.getStart()));
        return new ThisExprNode(loc);
    }

    @Override
    public ASTNode visitPostfix_expr(MxStarParser.Postfix_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        String opName = ctx.op.getText();
        UnaryOperator op = null;
        switch(opName){
            case"++" :  op = UnaryOperator.SUFFIXADD;break;
            case"--" :  op = UnaryOperator.SUFFIXSUB;break;
            default  :  op = UnaryOperator.INVALID;
        }
        return new PostfixExprNode(loc, op, (ExprNode)visit(ctx.expr()));
    }

    @Override
    public ASTNode visitCreator_expr(MxStarParser.Creator_exprContext ctx) {
        return visit(ctx.new_creator());
    }

    @Override
    public ASTNode visitPrefix_expr(MxStarParser.Prefix_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        String opName = ctx.op.getText();
        UnaryOperator op = null;
        switch(opName){
            case"+" :   op = UnaryOperator.POS;break;
            case"-" :   op = UnaryOperator.NEG;break;
            case"++":   op = UnaryOperator.PREFIXADD;break;
            case"--":   op = UnaryOperator.PREFIXSUB;break;
            case"~":    op = UnaryOperator.BITWISENEG;break;
            case"!":    op = UnaryOperator.LOGICALNOT;break;
            default:    op = UnaryOperator.INVALID;
        }
        return new PrefixExprNode(loc, op, (ExprNode)visit(ctx.expr()));
    }

    @Override
    public ASTNode visitMethod_expr(MxStarParser.Method_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        ExprNode expr = (ExprNode)visit(ctx.expr());
        ArrayList<ExprNode> exprNodes = new ArrayList<>();
        if(ctx.exprList() != null){
            for(var para : ctx.exprList().expr()){
                ExprNode tmp = (ExprNode)visit(para);
                exprNodes.add(tmp);
            }
        }
        return new MethodExprNode(loc, null, exprNodes, (ExprNode)visit(ctx.expr()));
    }

    @Override
    public ASTNode visitId_expr(MxStarParser.Id_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        String Identifier = ctx.Identifier().getText();
        return new IdExprNode(loc, Identifier);
    }

    @Override
    public ASTNode visitLiter_expr(MxStarParser.Liter_exprContext ctx) {
        Location loc = new Location(ctx.getStart());
        if(ctx.literal().StringLiteral() != null)
            {
                //System.out.println(333);
                String tmp = ctx.literal().StringLiteral().getText();
                return new StringLiterExprNode(loc, tmp.substring(1, tmp.length()-1));
            }
        else if(ctx.literal().BoolLiteral() != null)
            {
                //System.out.println(222);
                return new BoolLiterExprNode(loc, ctx.literal().BoolLiteral().getText().equals("true"));
            }
        else if(ctx.literal().IntLiteral() != null)
            {
                //System.out.println(ctx.literal().IntLiteral().getText());
                return new IntLiterExprNode(loc, Long.parseLong(ctx.literal().IntLiteral().getText()));
            }
        else
            {
                //System.out.println(444);
                return new NullLiterExprNode(loc);
            }
    }

    @Override
    public ASTNode visitType(MxStarParser.TypeContext ctx) {
        if(ctx.arrayType() != null){
            //System.out.println(333);
            return visit(ctx.arrayType());
        }
        else if(ctx.varType() != null){
            return visit(ctx.varType());
        }
        else
            return null;
    }

    @Override
    public ASTNode visitVarType(MxStarParser.VarTypeContext ctx) {
        Location loc = new Location(ctx.getStart());
        if(ctx.primType() != null){
            return visit(ctx.primType());
        }
        else if(ctx.Identifier() != null){
            String Identifier = ctx.Identifier().getText();
            return new VarTypeNode(loc, Identifier);
        }
        else
            return null;
    }

    @Override
    public ASTNode visitArrayType(MxStarParser.ArrayTypeContext ctx) {
        Location loc = new Location(ctx.getStart());
        int dims = ctx.getText().length() - (ctx.getText().replaceAll("]","")).length();
        //System.out.println(ctx.getText());
        TypeNode type = (TypeNode)visit(ctx.varType());
        return new ArrayTypeNode(loc, type.toString(), dims);
    }

    @Override
    public ASTNode visitPrimType(MxStarParser.PrimTypeContext ctx) {
        Location loc = new Location(ctx.getStart());
        return new PrimTypeNode(loc, ctx.getText());
    }
}

