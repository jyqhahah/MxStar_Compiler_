package SemanticChecker.SemanticChecker;

import AST.*;
import SemanticChecker.Scope.*;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;
import SemanticChecker.Scope.Symbol.VarSymbol;
import SemanticChecker.Scope.Type.*;
import utility.*;

import java.util.ArrayList;
import java.util.HashSet;


public class SemanticChecker implements ASTVisitor {
    private Scope scope;
    private GlobalScope globalScope;
    private errorReminder errorReminder;
    private StringType stringType;
    private HashSet<String> ClassSet;
    private String[] KeyWord = {"int", "bool", "string", "null", "void", "true", "false", "if", "else", "for", "while", "break", "continue", "return", "new", "class", "this"};

    public SemanticChecker(errorReminder errorReminder){
        scope = globalScope = new GlobalScope(null);
        this.errorReminder = errorReminder;
        stringType = new StringType(scope);
        ClassSet = new HashSet<>();
        ((GlobalScope)scope).initGlobalScope(scope, stringType);
        //System.out.println(((GlobalScope)scope).getFunctList().size());
    }

    public GlobalScope getGlobalScope() {
        return globalScope;
    }

    public StringType getStringType(){
        return stringType;
    }

    public boolean isKeyWord(String Identifier){
        for (String s : KeyWord) {
            if (s.equals(Identifier))
                return true;
        }
        return false;
    }

    @Override
    public void visit(ProgramNode Node) {
        Node.setScope(scope);
        ArrayList<DefNode> defList = Node.getDefList();
        for(var Class : defList){
            if(Class instanceof ClassdefNode) {
                ClassdefNode tmp = (ClassdefNode)Class;
                String Identifier = tmp.getIdentifier();
                if(isKeyWord(Identifier))
                    errorReminder.error(Class.getLoc(),"Class name is a keyword\'"+Identifier+"\'");
                else{
                    ClassSymbol classSymbol = scope.ClassDeclare(tmp, errorReminder);
                    ((ClassdefNode)Class).setClassSymbol(classSymbol);
                }
            }
        }
        for(var Class : defList){
            if(Class instanceof ClassdefNode){
                ClassdefNode tmp = (ClassdefNode)Class;
                String Identifier = tmp.getIdentifier();
                if(ClassSet.contains(Identifier)) continue;
                if(isKeyWord(Identifier)) ClassSet.add(Identifier);
                else{
                    ClassSymbol classScope = scope.getClassScope(Identifier);
                    ArrayList<VardefListNode> vardefList = tmp.getVardefList();
                    for(var vardef : vardefList){
                        ArrayList<VardefNode> varList = vardef.getVarList();
                        for(var var : varList){
                            String var_id = var.getIdentifier();
                            if(isKeyWord(var_id)){
                                errorReminder.error(var.getLoc(), "var name is a keyword"+var_id+"\'");
                                continue;
                            }
                            if(classScope.repeatedClassName(var_id)){
                                errorReminder.error(var.getLoc(), "var name has already existed"+var_id+"\'");
                                continue;
                            }
                            VarSymbol varSymbol = classScope.varDeclare(var, errorReminder);
                            var.setVarSymbol(varSymbol);
                        }
                    }
                    FunctSymbol constructor = classScope.constructorDeclare();
                    FuncdefNode cons_def = tmp.getConsDef();
                    if(cons_def!=null) cons_def.setFunctSymbol(constructor);
                    ArrayList<FuncdefNode> functList = tmp.getFuncList();
                    for(var funct : functList){
                        String funct_id = funct.getIdentifier();
                        if(isKeyWord(funct_id)){
                            errorReminder.error(funct.getLoc(), "function name is a keyword"+funct_id+"\'");
                            continue;
                        }
                        if(classScope.repeatedClassName(funct_id)){
                            errorReminder.error(funct.getLoc(), "function name has already existed"+funct_id+"\'");
                            continue;
                        }
                        FunctSymbol functSymbol = classScope.functDeclare(funct, errorReminder);
                        functSymbol.ParaListDeclare(funct.getParas(), errorReminder);
                        funct.setFunctSymbol(functSymbol);
                    }
                    ClassSet.add(Identifier);
                }
            }
        }
        boolean mainfunction = false;
        for(var funct : defList){
            if(funct instanceof FuncdefNode){
                FuncdefNode tmp = (FuncdefNode)funct;
                String funct_id = tmp.getIdentifier();
                if(isKeyWord(funct_id)){
                    errorReminder.error(funct.getLoc(),"function name is a keyword");
                    continue;
                }
                if(scope.repeatedClassName(funct_id)){
                    errorReminder.error(funct.getLoc(), "function name has already existed");
                    continue;
                }
                if(funct_id.equals("main")){
                    boolean check = true;
                    //System.out.println(tmp.getType().toString());
                    if(!tmp.getType().toString().equals("int"))
                        {errorReminder.error(tmp.getLoc(),"main function's returnValue type is not int");
                        check = false;}
                    if(!tmp.getParas().isEmpty())
                        {errorReminder.error(tmp.getLoc(), "main function has invalid paras");
                        check = false;}
                    if(check){
                        if(mainfunction)
                            errorReminder.error(tmp.getLoc(), "duplicate declare of main function");
                        else{
                            mainfunction = true;
                            FunctSymbol functSymbol = scope.functDeclare(tmp, errorReminder);
                            functSymbol.ParaListDeclare(tmp.getParas(), errorReminder);
                            tmp.setFunctSymbol(functSymbol);
                        }
                    }
                }
                else{
                    FunctSymbol functSymbol = scope.functDeclare(tmp, errorReminder);
                    if(functSymbol != null){
                        functSymbol.ParaListDeclare(tmp.getParas(), errorReminder);
                        tmp.setFunctSymbol(functSymbol);
                    }
                }
            }
        }
        if(!mainfunction){
            errorReminder.error(Node.getLoc(),"no main function");
        }
        for(var var : defList){
            //System.out.println(var.toString());
            if(var instanceof VardefListNode || var instanceof FuncdefNode || var instanceof ClassdefNode) var.accept(this);
        }
    }

    @Override
    public void visit(VardefListNode node) {
        //System.out.println("111");
        node.setScope(scope);
        ArrayList<VardefNode> varList = node.getVarList();
        for(var var : varList){
            //System.out.println(var.getType().toString());//你输出typeName当然是int了
            ExprNode initExpr = var.getExpr();
            String Identifier = var.getIdentifier();
            if(initExpr != null) initExpr.accept(this);
            if(isKeyWord(Identifier)){
                errorReminder.error(var.getLoc(), "var name is a keyword"+Identifier+"\'");
                continue;
            }
            if(scope.repeatedClassName(Identifier)){
                errorReminder.error(var.getLoc(), "var name has already existed"+Identifier+"\'");
                continue;
            }
            VarSymbol varSymbol = scope.varDeclare(var, errorReminder);
            if(varSymbol != null){
                var.setVarSymbol(varSymbol);
                if(initExpr != null) {
                    varSymbol.checkInitValue(initExpr, errorReminder);
                }
                varSymbol.IsDefined();
            }
        }
    }

    @Override
    public void visit(FuncdefNode node) {
        String Identifier = node.getIdentifier();
        if(isKeyWord(Identifier)){
            //errorReminder.error(node.getLoc(), "funct name is a keyword"+Identifier+"\'");
            return;
        }
        if(scope.repeatedClassName(Identifier)){
            //errorReminder.error(node.getLoc(), "funct name has already existed"+Identifier+"\'");
            return;
        }
        FunctSymbol functSymbol = scope.getFunctScope(Identifier);
        if(functSymbol != null && !functSymbol.IsDefined()){
            node.setScope(scope = functSymbol);
            ArrayList<StatmentNode> statArrayList = node.getStatmentNodeArrayList();
            for(var stat : statArrayList){
                //System.out.println(stat.toString());
                if(stat != null) stat.accept(this);
            }
            functSymbol.setDefined();
            scope = scope.getEnclosingScope();
        }
    }

    @Override
    public void visit(VardefNode node) {
        //System.out.println(node.getType().toString());
        String Identifier = node.getIdentifier();
        node.setScope(scope);
        if(isKeyWord(Identifier)){
            //errorReminder.error(node.getLoc(), "var name is a keyword"+Identifier+"\'");
            return;
        }
        if(scope.repeatedClassName(Identifier)){
            //errorReminder.error(node.getLoc(), "var name has already existed"+Identifier+"\'");
            return;
        }
        VarSymbol varSymbol = scope.getVarSymbol(Identifier);
        node.setVarSymbol(varSymbol);
        if(varSymbol != null && !varSymbol.IsDefined()){
            ExprNode initExpr = node.getExpr();
            if(initExpr != null) {
                initExpr.accept(this);
                varSymbol.checkInitValue(initExpr, errorReminder);
            }
            varSymbol.IsDefined();
        }
    }

    @Override
    public void visit(ClassdefNode node) {
        String Identifier = node.getIdentifier();
        if(isKeyWord(Identifier)){
            errorReminder.error(node.getLoc(), "class name is a keyword"+Identifier+"\'");
            return;
        }
        ClassSymbol classSymbol = scope.getClassScope(Identifier);
        if(classSymbol != null && !classSymbol.IsDefined()){
            scope = classSymbol;
            node.setScope(scope);
            ArrayList<VardefListNode> vardefList = node.getVardefList();
            for(var vardef : vardefList){
                ArrayList<VardefNode> varList = vardef.getVarList();
                for(var var : varList) var.accept(this);
            }
            ArrayList<FuncdefNode> functList = node.getFuncList();
            for(var funct : functList){
                funct.accept(this);
            }
            FuncdefNode constructor = node.getConsDef();
            if(constructor != null) constructor.accept(this);
            classSymbol.IsDefined();
            scope = scope.getEnclosingScope();
        }
    }

    @Override
    public void visit(BinaryExprNode node) {
        //System.out.println("22222");
        node.setScope(scope);
        ExprNode lvalue = node.getLeft(), rvalue = node.getRight();
        //System.out.println("enter");
        lvalue.accept(this);rvalue.accept(this);
        //System.out.println("exit");
        BinaryOperator bi_op = node.getOp();
        //System.out.println(rvalue.toString());
        Type ltype = lvalue.getType(), rtype = rvalue.getType();
        //System.out.println("get");
        //lvalue.accept(this);rvalue.accept(this);
        node.setLvalue(false);
        //System.out.println("binary" + ltype.toString());
        //System.out.println(rtype == null);
        if(ltype == null || rtype == null) return;
        //System.out.println(1);
        if(bi_op == BinaryOperator.ADD){
            if(ltype instanceof IntType && rtype instanceof IntType) node.setType(new IntType());
            else if(ltype instanceof StringType && rtype instanceof StringType) node.setType(stringType);
            else errorReminder.error(node.getLoc(), "ltype and rtype not match");
        }
        else if(bi_op == BinaryOperator.MOD || bi_op == BinaryOperator.MUL || bi_op == BinaryOperator.DIV || bi_op == BinaryOperator.SUB){
            if(ltype instanceof IntType && rtype instanceof IntType) node.setType(new IntType());
            else errorReminder.error(node.getLoc(), "ltype and rtype not match");
        }
        else if(bi_op == BinaryOperator.BITWISEAND || bi_op == BinaryOperator.BITWISEOR || bi_op == BinaryOperator.BITWISEXOR){
            if(ltype instanceof IntType && rtype instanceof IntType) node.setType(new IntType());
            else errorReminder.error(node.getLoc(), "ltype and rtype not match");
        }
        else if(bi_op == BinaryOperator.LEFTSHIFT || bi_op == BinaryOperator.RIGHTSHIFT){
            if(ltype instanceof IntType && rtype instanceof IntType) node.setType(new IntType());
            else errorReminder.error(node.getLoc(), "ltype and rtype not match");
        }
        else if(bi_op == BinaryOperator.LOGICALAND || bi_op == BinaryOperator.LOGICALOR){
            if(ltype instanceof BoolType && rtype instanceof BoolType) node.setType(new BoolType());
            else errorReminder.error(node.getLoc(), "ltype and rtype not match111");
        }
        else if(bi_op == BinaryOperator.GEQ || bi_op == BinaryOperator.LEQ || bi_op == BinaryOperator.LESS || bi_op == BinaryOperator.GREATER){
            if((ltype instanceof IntType && rtype instanceof IntType) || (ltype instanceof StringType && rtype instanceof StringType)) node.setType(new BoolType());
            else errorReminder.error(node.getLoc(), "ltype and rtype not match");
        }
        else if(bi_op == BinaryOperator.EQ || bi_op == BinaryOperator.NEQ){
            if((ltype instanceof IntType && rtype instanceof IntType)
                    || (ltype instanceof BoolType && rtype instanceof BoolType)
                    || (ltype instanceof StringType && rtype instanceof StringType)
                    || (ltype instanceof NullType && rtype instanceof NullType)
                    || (ltype instanceof ClassSymbol && rtype instanceof NullType)
                    || (ltype instanceof NullType && rtype instanceof ClassSymbol)){
                node.setType(new BoolType());
            }
            else errorReminder.error(node.getLoc(), "ltype and rtype not match");
        }
        else if(bi_op == BinaryOperator.ASSIGN){
            //System.out.println(lvalue.getType().typeString() + " " + lvalue.toString());
            if(!lvalue.getLvalue()) errorReminder.error(node.getLoc(), "left have no lvalue");
            else if(!ltype.toString().equals(rtype.toString())){
                //System.out.println(ltype.toString() + " " + rtype.toString());
                if(!(rtype instanceof NullType && ltype instanceof ClassSymbol))
                    errorReminder.error(rvalue.getLoc(), "ltype and rtype not match");
            }
            else node.setType(ltype);
        }
    }

    @Override
    public void visit(IndexExprNode node) {
        //System.out.println("indexepxr");
        node.setScope(scope);
        ExprNode index = node.getIndex(),name = node.getName();
        if(index == null) errorReminder.error(node.getLoc(), "the index is invalid");
        else{
            index.accept(this);
            Type indexType = index.getType();
            if(!(indexType instanceof IntType)) {errorReminder.error(index.getLoc(),"invalid type of index"+index.toString()+"\'");}
        }
        if(name instanceof IdExprNode){
            name.setScope(scope);
            node.setIdentifier(((IdExprNode)name).getIdentifier());
            VarSymbol varSymbol = scope.ArrayResolver(node, errorReminder);
            ((IdExprNode)name).setSymbol(scope.VarResolver((IdExprNode)name, errorReminder));
            if(varSymbol != null){
                node.setType(varSymbol.getType());
                node.setLvalue(true);
             //System.out.println(node.getType());//run
            }
        }
        else if(name instanceof MemberExprNode){
            MemberExprNode tmp_name = (MemberExprNode)name;
            node.setIdentifier(tmp_name.getIdentifier());
            ((MemberExprNode)name).setMember(node);
            name.accept(this);
            node.setType(name.getType());
            node.setLvalue(true);
        }
        else{
            //System.out.println("else");
            name.accept(this);
            Type type = name.getType();
            if(type != null){
                if(!(type instanceof ArrayType)) errorReminder.error(index.getLoc(), "invalid type of name");
                else {
                    int dims = ((ArrayType) type).getDims();
                    if(dims == 1) type = scope.TypeResolver(type.typeString());
                    else type = new ArrayType(globalScope, type.typeString(), dims-1);
                    node.setType(type);
                    node.setLvalue(true);
                    //System.out.println("type2" + node.getType());
                }
            }
        }

    }

    @Override
    public void visit(CreatorExprNode node) {
        //System.out.println(1);
        node.setScope(scope);
        ArrayList<ExprNode> exprList = node.getExpr();
        for(var expr : exprList){
            expr.accept(this);
            Type exprType = expr.getType();
            if(!(exprType == null || exprType instanceof IntType))
                errorReminder.error(expr.getLoc(), "invalid type of expr in creator");
        }
        Type type = scope.TypeResolver(node.getTypeNode().typeName());
        if(type == null) errorReminder.error(node.getLoc(), "node is not declared"+node.getTypeNode().toString());
        else{
            int dims = node.getDims();
            if(dims == 0){
                switch (node.getTypeNode().typeName()){
                    case("bool"):errorReminder.error(node.getTypeNode().getLoc(), "new expr's type is bool");
                    case("void"):errorReminder.error(node.getTypeNode().getLoc(), "new expr's type is void");
                    case("int"):errorReminder.error(node.getTypeNode().getLoc(), "new expr's type is int");
                }
                node.setType(type);
            }
            else{
                if(node.getTypeNode().typeName().equals("void"))
                    errorReminder.error(node.getTypeNode().getLoc(), "new expr's type is void");
                node.setType(new ArrayType(globalScope, node.getTypeNode().typeName(), dims));
            }
        }
    }

    @Override
    public void visit(ThisExprNode node) {
        node.setScope(scope);
        ClassSymbol classSymbol = scope.inClassSymbol();
        if(classSymbol == null)
            errorReminder.error(node.getLoc(), "the function has no element, invalid use 'this'");
        else
            node.setType(classSymbol);
    }

    @Override
    public void visit(IdExprNode node) {
        //System.out.println(node.getIdentifier());
        node.setScope(scope);
        VarSymbol varSymbol = scope.VarResolver(node, errorReminder);
        node.setSymbol(varSymbol);
        if(varSymbol != null){
            node.setType(varSymbol.getType());
            node.setLvalue(true);
        }
    }

    @Override
    public void visit(PrefixExprNode node) {
        node.setScope(scope);
        ExprNode expr = node.getExpr();
        expr.accept(this);
        UnaryOperator un_op = node.getOp();
        Type type = expr.getType();
        if(type == null) return;
            if(un_op == UnaryOperator.POS || un_op == UnaryOperator.NEG  || un_op == UnaryOperator.BITWISENEG){
                if(!(type instanceof IntType)) errorReminder.error(node.getLoc(), "invalid type of prefixExpr" + un_op.toString());
                else node.setType(type);
            }
            if(un_op == UnaryOperator.LOGICALNOT){
                if(!(type instanceof BoolType)) errorReminder.error(node.getLoc(), "invalid type of prefixExpr" + un_op.toString());
                else node.setType(type);
            }
            if(un_op == UnaryOperator.PREFIXADD || un_op == UnaryOperator.PREFIXSUB){
                if(!expr.getLvalue()) errorReminder.error(node.getLoc(), "lvalue has no operator"+un_op.toString());
                else if(!(type instanceof IntType)) errorReminder.error(node.getLoc(), "invalid type of prefixExpr"+un_op.toString());
                else {
                    node.setType(type);
                    node.setLvalue(true);
                }
            }
    }

    @Override
    public void visit(PostfixExprNode node) {
        node.setScope(scope);
        ExprNode expr = node.getExpr();
        expr.accept(this);
        UnaryOperator un_op = node.getOp();
        Type type = expr.getType();
        if(type == null) return;
        if(!expr.getLvalue()) errorReminder.error(node.getLoc(), "lvalue has no operator"+un_op.toString());
        else if(!(type instanceof IntType)) errorReminder.error(node.getLoc(), "invalid type of postfixExpr"+un_op.toString());
        else {
            node.setType(type);
        }
    }

    @Override
    public void visit(SubExprNode node) {
        node.setScope(scope);
        ExprNode expr = node.getExpr();
        expr.accept(this);
        node.setType(expr.getType());
        node.setLvalue(expr.getLvalue());
    }

    @Override
    public void visit(MemberExprNode node) {
        node.setScope(scope);
        ExprNode name = node.getName(), member = node.getMember();
        name.accept(this);
        Type nameType = name.getType();
        if(nameType == null) return;
        if(nameType instanceof ClassSymbol){
            ClassSymbol tmp_nameType = (ClassSymbol)nameType;
            if(member instanceof IdExprNode){
                VarSymbol varSymbol = tmp_nameType.getVarSymbol((IdExprNode)member, errorReminder);
                if(varSymbol != null){
                    node.setType(varSymbol.getType());
                    node.setLvalue(true);
                }
                node.setSymbol(varSymbol);
            }
            else if(member instanceof MethodExprNode){
                FunctSymbol functSymbol = tmp_nameType.getFunctSymbol((MethodExprNode)member, errorReminder);
                if(functSymbol != null){
                    node.setType(functSymbol.getType());
                    node.setLvalue(false);
                }
                node.setSymbol(functSymbol);
            }
            else if(member instanceof IndexExprNode){
                VarSymbol indexSymbol = tmp_nameType.getIndexSymbol((IndexExprNode)member, errorReminder);
                if(indexSymbol != null){
                    node.setType(indexSymbol.getType());
                    node.setLvalue(true);
                }
                node.setSymbol(tmp_nameType.getArray(node.getIdentifier()));
            }
        }
        else
            errorReminder.error(member.getLoc(), "invalid member call in nonClass type");
    }

    @Override
    public void visit(MethodExprNode node) {
        //System.out.println(node.getIdentifier());
        node.setScope(scope);
        ArrayList<ExprNode> exprList = node.getParaList();
        for(var expr : exprList) expr.accept(this);
        ExprNode name = node.getName();
        if(name instanceof IdExprNode){
            node.setIdentifier(((IdExprNode) name).getIdentifier());
            FunctSymbol functSymbol = scope.FunctResolver(node, errorReminder);
            if(functSymbol != null){
                node.setType(functSymbol.getType());
                node.setLvalue(false);
            }
            ((IdExprNode)name).setSymbol(functSymbol);
        }
        else if(name instanceof MemberExprNode){
            node.setIdentifier(((MemberExprNode) name).getIdentifier());
            ((MemberExprNode)name).setMember(node);
            name.accept(this);
            node.setType(name.getType());
            node.setLvalue(false);
        }
        else
            {System.out.println(1);
                errorReminder.error(node.getLoc(), "visit methodExprNode");}
    }

    @Override
    public void visit(BlankStatNode node) {
        node.setScope(scope);
    }

    @Override
    public void visit(BreakStatNode node) {
        node.setScope(scope);
        if(!scope.isInLoop())
            errorReminder.error(node.getLoc(), "break not in a loop");
    }

    @Override
    public void visit(BlockStatNode node) {
        scope = new LocalScope(scope, ScopeType.BlockScope);
        node.setScope(scope);
        ArrayList<StatmentNode> statList = node.getStats();
        for(var stat : statList) stat.accept(this);
        scope = scope.getEnclosingScope();
    }

    @Override
    public void visit(ContinueStatNode node) {
        node.setScope(scope);
        if(!scope.isInLoop()){
            errorReminder.error(node.getLoc(), "continue not in a loop");
        }
    }

    @Override
    public void visit(ExprStatNode node) {
        node.setScope(scope);
        node.getExpr().accept(this);
    }

    @Override
    public void visit(ForStatNode node) {
        scope = new LocalScope(scope, ScopeType.LoopScope);
        node.setScope(scope);
        ExprNode init = node.getInit(), condition = node.getCondition(), step = node.getStep();
        if(init != null) init.accept(this);
        if(condition != null) {
            condition.accept(this);
            if(condition.getType()!=null&&!(condition.getType() instanceof BoolType))
                errorReminder.error(condition.getLoc(), "forLoop condition has invalid type"+condition.getType().typeString());
        }
        if(step != null) step.accept(this);
        node.getStat().accept(this);
        scope = scope.getEnclosingScope();
    }

    @Override
    public void visit(IfStatNode node) {
        scope = new LocalScope(scope, ScopeType.IfScope);
        node.setScope(scope);
        ExprNode condition = node.getCondition();
        if(condition == null) errorReminder.error(node.getLoc(), "if has no condition");
        else {
            condition.accept(this);
            if(condition.getType()!=null&&!(condition.getType() instanceof BoolType))
                errorReminder.error(condition.getLoc(), "if condition has invalid type"+condition.getType().typeString());
        }
        node.getThen().accept(this);
        scope = scope.getEnclosingScope();
        if(node.getElse() != null){
            scope = new LocalScope(scope, ScopeType.ElseScope);
            node.getElse().accept(this);
            scope = scope.getEnclosingScope();
        }
    }

    @Override
    public void visit(ReturnStatNode node) {
        node.setScope(scope);
        ExprNode expr = node.getExpr();
        FunctSymbol functSymbol = scope.inFunctSymbol();
        if(functSymbol == null) errorReminder.error(node.getLoc(), "return not in a function");
        else if(expr == null){
            Type returnType = functSymbol.getType();
            if(returnType != null && !(returnType instanceof VoidType || functSymbol.isConstructor()))
                errorReminder.error(node.getLoc(), "invalid returnType"+returnType.typeString());
        }
        else{
            expr.accept(this);
            Type exprType = expr.getType(), returnType = functSymbol.getType();
            if(exprType != null && returnType != null){
                //System.out.println(exprType instanceof NullType && !(returnType instanceof ClassSymbol));
                if(functSymbol.isConstructor()) errorReminder.error(node.getLoc(), "constructor return a value");
                else if(exprType instanceof NullType){if(!(returnType instanceof ClassSymbol))
                    errorReminder.error(node.getLoc(), "returnValueType is not null, returnStat is null");}
                else if(returnType instanceof  VoidType)
                    errorReminder.error(node.getLoc(), "returnValue Type is void, but returnStat is not null");
                else if(!returnType.toString().equals(exprType.toString()))
                    errorReminder.error(node.getLoc(), "mismatch between returnValueType and returnStat");
            }
        }
    }

    @Override
    public void visit(VardefListStatNode node) {
        //System.out.println(11111);
        node.setScope(scope);
        node.getVardefList().accept(this);
    }

    @Override
    public void visit(WhileStatNode node) {
        scope = new LocalScope(scope, ScopeType.LoopScope);
        node.setScope(scope);
        ExprNode condition = node.getExpr();
        if(condition == null) errorReminder.error(node.getLoc(), "whileLoop has no condition");
        else{
            condition.accept(this);
            if(condition.getType()!=null&&!(condition.getType() instanceof BoolType))
                errorReminder.error(condition.getLoc(), "while condition has invalid type"+condition.getType().typeString());
        }
        node.getStat().accept(this);
        scope = scope.getEnclosingScope();
    }

    @Override
    public void visit(PrimTypeNode node) {

    }

    @Override
    public void visit(ArrayTypeNode node) {

    }

    @Override
    public void visit(VarTypeNode node) {

    }

    @Override
    public void visit(BoolLiterExprNode node) {
        node.setScope(scope);
        node.setType(new BoolType());
        node.setLvalue(false);
    }

    @Override
    public void visit(IntLiterExprNode node) {
        node.setScope(scope);
        node.setType(new IntType());
        node.setLvalue(false);
    }

    @Override
    public void visit(StringLiterExprNode node) {
        node.setScope(scope);
        node.setType(stringType);
        node.setLvalue(false);
    }

    @Override
    public void visit(NullLiterExprNode node) {
        node.setScope(scope);
        node.setType(new NullType());
        node.setLvalue(false);
    }
}

