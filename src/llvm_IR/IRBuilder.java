package llvm_IR;

import AST.*;
import SemanticChecker.Scope.Symbol.*;
import SemanticChecker.Scope.Type.*;
import llvm_IR.operand.*;
import llvm_IR.type.*;
import llvm_IR.instruction.*;
import SemanticChecker.Scope.*;
import utility.BinaryOperator;
import utility.UnaryOperator;

import java.util.ArrayList;
import java.util.LinkedHashMap;


public class IRBuilder implements ASTVisitor {
    private GlobalScope scope;
    private IRModule module;
    private IRFunction curFunct, mallocFunct;
    private IRBBlock curBBlock, retBBlock, afterStack, updateStack;
    private register retAddress;
    private ClassSymbol curClass;


    public IRBuilder(GlobalScope scope, StringType stringType){
        this.scope = scope;
        this.module = new IRModule(scope, stringType);
        this.curFunct = null;
        this.mallocFunct = module.getBuiltInFunct("__malloc");
        this.curBBlock = this.retBBlock = afterStack = updateStack = null;
    }

    @Override
    public void visit(ProgramNode Node) {
        ArrayList<DefNode> defList = Node.getDefList();
        for(var Class : defList){
            if(Class instanceof ClassdefNode){
                ClassdefNode tmp = (ClassdefNode)Class;
                ClassSymbol classSymbol = tmp.getClassSymbol();
                String Identifier = "class."+tmp.getIdentifier();
                IRClassType classType = new IRClassType(Identifier, new ArrayList<>());
                classSymbol.setClassType(classType);
                module.addClass(Identifier, classType);
            }
        }
        for(var Class : defList){
            if(Class instanceof ClassdefNode){
                ClassdefNode tmp = (ClassdefNode)Class;
                ClassSymbol classSymbol = tmp.getClassSymbol();
                IRClassType classType = classSymbol.getClassType();
                ArrayList<VardefListNode> varDefList = tmp.getVardefList();
                for(var vardef : varDefList){
                    ArrayList<VardefNode> varList = vardef.getVarList();
                    for(var var : varList){
                        IRType type = getIRType(var.getType());
                        register address = new register(new IRPointerType(type), var.getIdentifier());
                        classType.addMember(type);
                        VarSymbol varSymbol = var.getVarSymbol();
                        varSymbol.setIrType(type);
                        varSymbol.setAddress(address);
                    }
                }
                FuncdefNode constructor = tmp.getConsDef();
                if(constructor != null){
                    String id = tmp.getIdentifier()+"."+constructor.getIdentifier();
                    IRFunction consFunct = new IRFunction(new IRVoidType(), id, new ArrayList<>());
                    FunctSymbol functSymbol = constructor.getFunctSymbol();
                    functSymbol.setFunction(consFunct);
                    module.addFunct(id, consFunct);
                }
                ArrayList<FuncdefNode> functDefList = tmp.getFuncList();
                for(var funct : functDefList){
                    IRType retType;
                    if(funct.getType() != null) retType = getIRType(funct.getType());
                    else retType = new IRVoidType();
                    String id = tmp.getIdentifier()+"."+funct.getIdentifier();
                    IRFunction function = new IRFunction(retType, id, new ArrayList<>());
                    FunctSymbol functSymbol = funct.getFunctSymbol();
                    functSymbol.setFunction(function);
                    module.addFunct(id, function);
                }
            }
        }
        for(var funct : defList){
            if(funct instanceof FuncdefNode){
                FuncdefNode tmpNode = (FuncdefNode)funct;
                IRType retType = getIRType(tmpNode.getType());
                String Identifier = tmpNode.getIdentifier();
                IRFunction function = new IRFunction(retType, Identifier, new ArrayList<>());
                FunctSymbol functSymbol = tmpNode.getFunctSymbol();
                functSymbol.setFunction(function);
                module.addFunct(Identifier, function);
            }
        }
        IRFunction initFunct = new IRFunction(new IRVoidType(), "__init__", new ArrayList<>());
        curFunct = initFunct;
        IRBBlock entryBBlock = new IRBBlock("entryBBlock");
        curBBlock = entryBBlock;
        module.addFunct("__init__", initFunct);
        curFunct.addBBlocks(entryBBlock);
        for(var item : defList){
            if(item instanceof VardefListNode){
                VardefListNode varDefList = (VardefListNode)item;
                ArrayList<VardefNode> varList = varDefList.getVarList();
                for(var var : varList){
                    IRType type = getIRType(var.getType());
                    variable variable = new variable(new IRPointerType(type), var.getIdentifier());
                    module.addVar(variable);
                    VarSymbol varSymbol = var.getVarSymbol();
                    varSymbol.setAddress(variable);
                    varSymbol.setIrType(type);
                    ExprNode expr = var.getExpr();
                    boolean flag = true;
                    if(type instanceof IRIntType) {
                        IRIntType tmp1 = (IRIntType)type;
                        int bytes = tmp1.bytes();
                        if(bytes == 32) flag = false;
                    }
                    if(expr == null)
                        if(!flag)
                            variable.setInitValue(new constInt(0));
                        else
                            variable.setInitValue(new constNull());
                    else{
                        expr.accept(this);
                        if(!flag){
                            if(expr.getRes() instanceof constInt)
                                variable.setInitValue(expr.getRes());
                            else{
                                variable.setInitValue(new constInt(0));
                                curBBlock.addInst(new StoreInst(expr.getRes(), variable));
                            }
                        }
                        else{
                            variable.setInitValue(new constNull());
                            curBBlock.addInst(new StoreInst(expr.getRes(), variable));
                        }
                    }

                }
            }
        }
        IRBBlock returnBBlock = new IRBBlock("returnBBlock");
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(returnBBlock, curBBlock));
        curBBlock = returnBBlock;
        curFunct.addBBlocks(returnBBlock);
        curFunct.setExitBBlock(returnBBlock);
        curBBlock.addInst(new RetInst(null));
        for(var funct : defList){
            if(funct instanceof FuncdefNode || funct instanceof ClassdefNode) funct.accept(this);
        }
    }

    @Override
    public void visit(VardefListNode node) {
        ArrayList<VardefNode> varDefList = node.getVarList();
        for(var var : varDefList)
            var.accept(this);
    }

    @Override
    public void visit(FuncdefNode node) {
        Scope enclosingScope = node.getScope().getEnclosingScope();
        FunctSymbol functSymbol = node.getFunctSymbol();
        IRFunction function = functSymbol.getFunction();
        curFunct = function;
        IRBBlock entryBBlock = new IRBBlock("entryBBlock");
        curBBlock = entryBBlock;
        curFunct.addBBlocks(entryBBlock);
        IRBBlock returnBBlock = new IRBBlock("returnBBlock");
        retBBlock = returnBBlock;
        if(enclosingScope == scope){
            if(node.getIdentifier().equals("main")) curBBlock.addInst(new CallInst(module.getFunct("__init__"), new ArrayList<>(), null));
        }
        else if(enclosingScope instanceof ClassSymbol){
            ClassSymbol tmp = (ClassSymbol)enclosingScope;
            IRType thisType = new IRPointerType(tmp.getClassType());
            register thisAddress = new register(new IRPointerType(thisType), "this$");
            curBBlock.addInst(new AllocaInst(thisType, thisAddress));
            curFunct.addRegs(thisAddress);
            register thisReg = new register(thisType, "this");
            curBBlock.addInst(new StoreInst(thisReg, thisAddress));
            curFunct.addRegs(thisReg);
            curFunct.addParas(thisReg);
        }
        LinkedHashMap<String, VarSymbol> paraList = functSymbol.getParaList();
        ArrayList<VardefNode> paras = node.getParas();
        int cnt = 0;
        for(var entry : paraList.entrySet()){
            VarSymbol varSymbol = entry.getValue();
            VardefNode para = paras.get(cnt);
            cnt++;
            IRType paraType = getIRType(para.getType());
            register paraAddress = new register(new IRPointerType(paraType), para.getIdentifier()+"$");
            varSymbol.setIrType(paraType);
            varSymbol.setAddress(paraAddress);
            curBBlock.addInst(new AllocaInst(paraType, paraAddress));
            curFunct.addRegs(paraAddress);
            register storeAddress = new register(paraType, para.getIdentifier());
            curBBlock.addInst(new StoreInst(storeAddress, paraAddress));
            curFunct.addParas(storeAddress);
            curFunct.addRegs(storeAddress);
        }
        IRType retType =function.getType();
        if(!(retType instanceof IRVoidType)){
            retAddress = new register(new IRPointerType(retType), "returnValue$");
            curBBlock.addInst(new AllocaInst(retType, retAddress));
            curFunct.addRegs(retAddress);
        }
        ArrayList<StatmentNode> stmts = node.getStatmentNodeArrayList();
        for(var stmt : stmts)
            stmt.accept(this);
        if(!(curBBlock.getRear() instanceof BranchInst)){
            if(retType instanceof IRIntType){
                int bytes = ((IRIntType)retType).bytes();
                if(bytes == 1) curBBlock.addInst(new StoreInst(new constBool(false),retAddress));
                else if(bytes == 32) curBBlock.addInst(new StoreInst(new constInt(0), retAddress));
                else curBBlock.addInst(new StoreInst(new constNull(), retAddress));
            }
            else if(!(retType instanceof IRVoidType)) {
                curBBlock.addInst(new StoreInst(new constNull(), retAddress));
            }
            curBBlock.addInst(new BranchInst(returnBBlock, curBBlock));
        }
        curBBlock = returnBBlock;
        curFunct.addBBlocks(returnBBlock);
        curFunct.setExitBBlock(returnBBlock);
        if(retType instanceof IRVoidType) curBBlock.addInst(new RetInst(null));
        else {
            register retValue = new register(retType, "returnValue");
            curBBlock.addInst(new LoadInst(retValue, retAddress));
            curBBlock.addInst(new RetInst(retValue));
            curFunct.addRegs(retValue);
        }
    }

    @Override
    public void visit(VardefNode node) {
        VarSymbol varSymbol = node.getVarSymbol();
        IRType varType = getIRType(node.getType());
        varSymbol.setIrType(varType);
        register varAddress = new register(new IRPointerType(varType), node.getIdentifier()+"$");
        curBBlock.addInst(new AllocaInst(varType, varAddress));
        curFunct.addRegs(varAddress);
        varSymbol.setAddress(varAddress);
        ExprNode expr = node.getExpr();
        if(expr != null) {
            expr.accept(this);
            curBBlock.addInst(new StoreInst(expr.getRes(), varAddress));
        }
    }

    @Override
    public void visit(ClassdefNode node) {
        ClassSymbol classSymbol = node.getClassSymbol();
        curClass = classSymbol;
        FuncdefNode constructor = node.getConsDef();
        if(constructor != null) constructor.accept(this);
        ArrayList<FuncdefNode> FunctList = node.getFuncList();
        for(var funct : FunctList)
            funct.accept(this);
    }

    @Override
    public void visit(BinaryExprNode node) {
        ExprNode right = node.getRight(), left = node.getLeft();
        BinaryOperator bi_op = node.getOp();
        if(bi_op == BinaryOperator.ADD){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type addType = node.getType();
            if(addType instanceof IntType){
                register reg = new register(new IRIntType(32), "add");
                curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.add));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
            else if(addType instanceof StringType){
                register reg = new register(new IRPointerType(new IRIntType(8)), "add");
                IRFunction function = module.getBuiltInFunct("__stringAdd");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
        }
        else if(bi_op == BinaryOperator.SUB){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "sub");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.sub));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.MUL){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "mul");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.mul));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.DIV){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "sdiv");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.sdiv));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.MOD){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "srem");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.srem));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.LEFTSHIFT){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "shl");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.shl));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.RIGHTSHIFT){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "ashr");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.ashr));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.BITWISEOR){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "or");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.or));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.BITWISEXOR){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "xor");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.xor));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.BITWISEAND){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            register reg = new register(new IRIntType(32), "and");
            curBBlock.addInst(new BinOpInst(lReg, rReg, reg, BinOpType.and));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(bi_op == BinaryOperator.LOGICALOR){
            left.accept(this);IROperand lReg = left.getRes();
            if(lReg instanceof constBool){
                constBool lvalue = (constBool)lReg;
                if(lvalue.getValue()) node.setRes(lReg);
                else{
                    right.accept(this);node.setRes(right.getRes());
                }
            }
            else{
                IRBBlock LogicalOr = new IRBBlock("logicalOr");
                IRBBlock afterLogicalOr = new IRBBlock("afterLogicalOr");
                curFunct.addBBlocks(LogicalOr);curFunct.addBBlocks(afterLogicalOr);
                curBBlock.addInst(new BranchInst(afterLogicalOr, LogicalOr, lReg, curBBlock));
                IRBBlock currentBB = curBBlock;
                curBBlock = LogicalOr;
                right.accept(this);
                IROperand rReg = right.getRes();
                curBBlock.addInst(new BranchInst(afterLogicalOr, curBBlock));
                curBBlock = afterLogicalOr;
                register reg = new register(new IRIntType(1), "phi");
                PhiInst phiInst = new PhiInst(reg, new ArrayList<>(), new ArrayList<>());
                phiInst.addEntry(new constBool(true), currentBB);
                phiInst.addEntry(rReg, LogicalOr);
                curBBlock.addInst(phiInst);
                curFunct.addRegs(reg);
                node.setRes(reg);
            }

        }
        else if(bi_op == BinaryOperator.LOGICALAND){
            left.accept(this);IROperand lReg = left.getRes();
            if(lReg instanceof constBool){
                constBool lvalue = (constBool)lReg;
                if(!lvalue.getValue()) node.setRes(lReg);
                else{
                    right.accept(this);node.setRes(right.getRes());
                }
            }
            else {
                IRBBlock LogicalAnd = new IRBBlock("logicalAnd");
                IRBBlock afterLogicalAnd = new IRBBlock("afterLogicalAnd");
                curFunct.addBBlocks(LogicalAnd);curFunct.addBBlocks(afterLogicalAnd);
                if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(LogicalAnd, afterLogicalAnd, lReg, curBBlock));
                IRBBlock currentBB = curBBlock;
                curBBlock = LogicalAnd;
                right.accept(this);
                IROperand rReg = right.getRes();
                if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(afterLogicalAnd, curBBlock));
                curBBlock = afterLogicalAnd;
                register reg = new register(new IRIntType(1), "phi");
                PhiInst phiInst = new PhiInst(reg, new ArrayList<>(), new ArrayList<>());
                phiInst.addEntry(new constBool(false), currentBB);
                phiInst.addEntry(rReg, LogicalAnd);
                curBBlock.addInst(phiInst);
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
        }
        else if(bi_op == BinaryOperator.EQ){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type lType = node.getLeft().getType(), rType = node.getRight().getType();
            if(lType instanceof IntType && rType instanceof IntType){
                if(lReg instanceof constInt && rReg instanceof constInt){
                    constInt lvalue = (constInt)lReg, rvalue = (constInt)rReg;
                    node.setRes(new constBool(lvalue.getValue() == rvalue.getValue()));
                }
                else{
                    register reg = new register(new IRIntType(1), "eq");
                    curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.eq));
                    curFunct.addRegs(reg);
                    node.setRes(reg);
                }
            }
            else if(lType instanceof StringType && rType instanceof StringType){
                register reg = new register(new IRIntType(1), "eq");
                IRFunction function = module.getBuiltInFunct("__stringEqual");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
            else if((lType instanceof BoolType && rType instanceof BoolType) ||
                    (lType instanceof NullType && rType instanceof ClassSymbol)||
                    (lType instanceof ClassSymbol && rType instanceof NullType)){
                register reg = new register(new IRIntType(1), "eq");
                curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.eq));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
            else if(lType instanceof NullType && rType instanceof NullType) node.setRes(new constBool(true));
        }
        else if(bi_op == BinaryOperator.NEQ){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type lType = node.getLeft().getType(), rType = node.getRight().getType();
            if(lType instanceof IntType && rType instanceof IntType){
                if(lReg instanceof constInt && rReg instanceof constInt){
                    constInt lvalue = (constInt)lReg, rvalue = (constInt)rReg;
                    node.setRes(new constBool(lvalue.getValue() != rvalue.getValue()));
                }
                else{
                    register reg = new register(new IRIntType(1), "ne");
                    curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.ne));
                    curFunct.addRegs(reg);
                    node.setRes(reg);
                }
            }
            else if(lType instanceof StringType && rType instanceof StringType){
                register reg = new register(new IRIntType(1), "ne");
                IRFunction function = module.getBuiltInFunct("__stringNotEqual");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
            else if((lType instanceof BoolType && rType instanceof BoolType) ||
                    (lType instanceof NullType && rType instanceof ClassSymbol)||
                    (lType instanceof ClassSymbol && rType instanceof NullType)){
                register reg = new register(new IRIntType(1), "ne");
                curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.ne));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
            else if(lType instanceof NullType && rType instanceof NullType) node.setRes(new constBool(false));
        }
        else if(bi_op == BinaryOperator.GREATER){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type type = node.getLeft().getType();
            if(type instanceof IntType){
                if(lReg instanceof constInt && rReg instanceof constInt){
                    constInt lvalue = (constInt)lReg, rvalue = (constInt)rReg;
                    node.setRes(new constBool(lvalue.getValue() > rvalue.getValue()));
                }
                else{
                    register reg = new register(new IRIntType(1), "sgt");
                    curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.sgt));
                    curFunct.addRegs(reg);
                    node.setRes(reg);
                }
            }
            else if(type instanceof StringType){
                register reg = new register(new IRIntType(1), "sgt");
                IRFunction function = module.getBuiltInFunct("__stringGreater");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
        }
        else if(bi_op == BinaryOperator.GEQ){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type type = node.getLeft().getType();
            if(type instanceof IntType){
                if(lReg instanceof constInt && rReg instanceof constInt){
                    constInt lvalue = (constInt)lReg, rvalue = (constInt)rReg;
                    node.setRes(new constBool(lvalue.getValue() >= rvalue.getValue()));
                }
                else{
                    register reg = new register(new IRIntType(1), "sge");
                    curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.sge));
                    curFunct.addRegs(reg);
                    node.setRes(reg);
                }
            }
            else if(type instanceof StringType){
                register reg = new register(new IRIntType(1), "sge");
                IRFunction function = module.getBuiltInFunct("__stringGreaterEqual");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
        }
        else if(bi_op == BinaryOperator.LESS){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type type = node.getLeft().getType();
            if(type instanceof IntType){
                if(lReg instanceof constInt && rReg instanceof constInt){
                    constInt lvalue = (constInt)lReg, rvalue = (constInt)rReg;
                    node.setRes(new constBool(lvalue.getValue() < rvalue.getValue()));
                }
                else{
                    register reg = new register(new IRIntType(1), "slt");
                    curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.slt));
                    curFunct.addRegs(reg);
                    node.setRes(reg);
                }
            }
            else if(type instanceof StringType){
                register reg = new register(new IRIntType(1), "slt");
                IRFunction function = module.getBuiltInFunct("__stringLess");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
        }
        else if(bi_op == BinaryOperator.LEQ){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            Type type = node.getLeft().getType();
            if(type instanceof IntType){
                if(lReg instanceof constInt && rReg instanceof constInt){
                    constInt lvalue = (constInt)lReg, rvalue = (constInt)rReg;
                    node.setRes(new constBool(lvalue.getValue() <= rvalue.getValue()));
                }
                else{
                    register reg = new register(new IRIntType(1), "sle");
                    curBBlock.addInst(new IcmpInst(lReg, rReg, reg, IcmpType.sle));
                    curFunct.addRegs(reg);
                    node.setRes(reg);
                }
            }
            else if(type instanceof StringType){
                register reg = new register(new IRIntType(1), "sle");
                IRFunction function = module.getBuiltInFunct("__stringLessEqual");
                ArrayList<IROperand> paras = new ArrayList<>();
                paras.add(lReg);paras.add(rReg);
                curBBlock.addInst(new CallInst(function, paras, reg));
                curFunct.addRegs(reg);
                node.setRes(reg);
            }
        }
        else if(bi_op == BinaryOperator.ASSIGN){
            left.accept(this);right.accept(this);
            IROperand lReg = left.getRes(), rReg = right.getRes();
            //System.out.println(node.getLeft().getAddress() == null);
            curBBlock.addInst(new StoreInst(rReg, node.getLeft().getAddress()));
            node.setRes(rReg);
        }

    }

    @Override
    public void visit(IndexExprNode node) {
        ExprNode name = node.getName();
        if(!(name instanceof MemberExprNode)){
            ExprNode index = node.getIndex();
            name.accept(this);index.accept(this);
            register arrayAddress = (register)name.getRes();
            IRPointerType arrayType = (IRPointerType)arrayAddress.getType();
            register elemAddress = new register(arrayType, "element$");
            ArrayList<IROperand> tmp = new ArrayList<>();tmp.add(index.getRes());
            curBBlock.addInst(new GetElemPtrInst(elemAddress, arrayAddress, tmp));
            curFunct.addRegs(elemAddress);
            register elem = new register(arrayType.getPointerType(), "element");
            curBBlock.addInst(new LoadInst(elem, elemAddress));
            curFunct.addRegs(elem);
            node.setAddress(elemAddress);
            node.setRes(elem);
        }
        else{
            name.accept(this);
            node.setAddress(name.getAddress());
            node.setRes(name.getRes());
        }
    }

    @Override
    public void visit(CreatorExprNode node) {
        int dims = node.getDims();
        ArrayList<ExprNode> indexList = node.getExpr();
        for(var index : indexList) index.accept(this);
        String Identifier = node.getTypeNode().typeName();
        if(Identifier.equals("int")){
            register reg = intStringCreator(new IRIntType(32), indexList, dims);
            node.setRes(reg);
        }
        else if(Identifier.equals("string")){
            register reg = intStringCreator(new IRPointerType(new IRIntType(8)), indexList, dims);
            node.setRes(reg);
        }
        else if(Identifier.equals("bool")){
            register reg = intStringCreator(new IRIntType(1), indexList, dims);
            node.setRes(reg);
        }
        else{
            ClassSymbol classSymbol = scope.getClassScope(node.getType().typeString());
            IRFunction constructor = classSymbol.getConstructor().getFunction();
            register reg = classCreator(classSymbol.getClassType(), indexList, dims, constructor);
            node.setRes(reg);
        }
    }

    @Override
    public void visit(ThisExprNode node) {
        register thisAddress = curFunct.getRegister("this$");
        IRPointerType thisType = (IRPointerType)thisAddress.getType();
        register thisReg = new register(thisType.getPointerType(), "this");
        curBBlock.addInst(new LoadInst(thisReg, thisAddress));
        curFunct.addRegs(thisReg);
        node.setRes(thisReg);
    }

    @Override
    public void visit(IdExprNode node) {
        VarSymbol varSymbol = (VarSymbol)node.getSymbol();
        if(varSymbol.getScope() == curClass && node.getScope().inClassSymbol() == curClass){
            register thisAddress = curFunct.getRegister("this$");
            IRPointerType thisType = (IRPointerType)thisAddress.getType();
            register thisReg = new register(thisType.getPointerType(), "this");
            curBBlock.addInst(new LoadInst(thisReg, thisAddress));
            curFunct.addRegs(thisReg);
            IRType memberType = varSymbol.getIrType();
            register memberAddress = new register(new IRPointerType(memberType), varSymbol.getIdentifier()+"$");
            ArrayList<IROperand> tmp = new ArrayList<>();
            tmp.add(new constInt(0));tmp.add(new constInt(curClass.getOrder(varSymbol.getIdentifier())));
            curBBlock.addInst(new GetElemPtrInst(memberAddress, thisReg, tmp));
            curFunct.addRegs(memberAddress);
            register memberReg = new register(memberType, varSymbol.getIdentifier());
            curBBlock.addInst(new LoadInst(memberReg, memberAddress));
            curFunct.addRegs(memberReg);
            node.setAddress(memberAddress);
            node.setRes(memberReg);
        }
        else{
            register varAddress = varSymbol.getAddress();
            IRPointerType varType = (IRPointerType)varAddress.getType();
            register reg = new register(varType.getPointerType(), node.getIdentifier());
            curBBlock.addInst(new LoadInst(reg, varAddress));
            curFunct.addRegs(reg);
            node.setAddress(varAddress);
            node.setRes(reg);
        }
    }

    @Override
    public void visit(PrefixExprNode node) {
        ExprNode expr = node.getExpr();
        expr.accept(this);
        UnaryOperator un_op = node.getOp();
        IROperand exprReg = expr.getRes();
        if(un_op == UnaryOperator.POS) node.setRes(exprReg);
        else if(un_op == UnaryOperator.NEG){
            register reg = new register(new IRIntType(32), "neg");
            curBBlock.addInst(new BinOpInst(new constInt(0), exprReg, reg, BinOpType.sub));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
        else if(un_op == UnaryOperator.PREFIXSUB){
            register reg = new register(new IRIntType(32), "prefixDecr");
            curBBlock.addInst(new BinOpInst(exprReg, new constInt(1), reg, BinOpType.sub));
            curFunct.addRegs((register)reg);
            curBBlock.addInst(new StoreInst(reg, expr.getAddress()));
            node.setAddress(expr.getAddress());
            node.setRes(reg);
        }
        else if(un_op == UnaryOperator.PREFIXADD){
            register reg = new register(new IRIntType(32), "prefixIncr");
            curBBlock.addInst(new BinOpInst(exprReg, new constInt(1), reg, BinOpType.add));
            curFunct.addRegs((register)reg);
            curBBlock.addInst(new StoreInst(reg, expr.getAddress()));
            node.setAddress(expr.getAddress());
            node.setRes(reg);
        }
        else if(un_op == UnaryOperator.LOGICALNOT){
            register reg = new register(new IRIntType(1), "logicalNot");
            curBBlock.addInst(new BinOpInst(exprReg, new constBool(true), reg, BinOpType.xor));
            curFunct.addRegs(reg);
            node.setRes(reg);

        }
        else if(un_op == UnaryOperator.BITWISENEG){
            register reg = new register(new IRIntType(32), "bitwiseNot");
            curBBlock.addInst(new BinOpInst(new constInt(-1), exprReg, reg, BinOpType.xor));
            curFunct.addRegs(reg);
            node.setRes(reg);
        }
    }

    @Override
    public void visit(PostfixExprNode node) {
        ExprNode expr = node.getExpr();
        expr.accept(this);
        UnaryOperator un_op = node.getOp();
        IROperand exprReg = expr.getRes();
        if(un_op == UnaryOperator.SUFFIXSUB){
            register reg = new register(new IRIntType(32), "suffixDecr");
            curBBlock.addInst(new BinOpInst(exprReg, new constInt(1), reg, BinOpType.sub));
            curFunct.addRegs((register)reg);
            curBBlock.addInst(new StoreInst(reg, expr.getAddress()));
            node.setAddress(expr.getAddress());
            node.setRes(exprReg);
        }
        else if(un_op == UnaryOperator.SUFFIXADD){
            register reg = new register(new IRIntType(32), "suffixIncr");
            curBBlock.addInst(new BinOpInst(exprReg, new constInt(1), reg, BinOpType.add));
            curFunct.addRegs((register)reg);
            curBBlock.addInst(new StoreInst(reg, expr.getAddress()));
            node.setAddress(expr.getAddress());
            node.setRes(exprReg);
        }
    }

    @Override
    public void visit(SubExprNode node) {
        ExprNode expr = node.getExpr();
        expr.accept(this);
        node.setAddress(expr.getAddress());
        node.setRes(expr.getRes());
    }

    @Override
    public void visit(MemberExprNode node) {
        ExprNode name = node.getName(), member = node.getMember();
        name.accept(this);
        String Identifier = node.getIdentifier();
        ClassSymbol classSymbol = (ClassSymbol)name.getType();
        if(member instanceof IdExprNode){
            VarSymbol varSymbol = (VarSymbol)node.getSymbol();
            IRPointerType memberType = (IRPointerType)varSymbol.getAddress().getType();
            register memberAddress = new register(memberType, Identifier+"$");
            register nameReg = (register)name.getRes();
            ArrayList<IROperand> tmpList = new ArrayList<>();
            tmpList.add(new constInt(0));tmpList.add(new constInt(classSymbol.getOrder(Identifier)));
            curBBlock.addInst(new GetElemPtrInst(memberAddress, nameReg, tmpList));
            curFunct.addRegs(memberAddress);

            register memberLoad = new register(memberType.getPointerType(), Identifier);
            curBBlock.addInst(new LoadInst(memberLoad, memberAddress));
            curFunct.addRegs(memberLoad);
            node.setAddress(memberAddress);
            node.setRes(memberLoad);

        }
        else if(member instanceof MethodExprNode){//funct
            if(name.getType() instanceof ArrayType&&Identifier.equals("size")){
                register head = (register)name.getRes(), arrayHead;
                IRPointerType arrayType = (IRPointerType)head.getType();
                boolean flag = false;
                if(arrayType.getPointerType() instanceof IRIntType){
                    IRIntType tmpType = (IRIntType)arrayType.getPointerType();
                    if(tmpType.bytes() == 32) flag = true;
                }
                if(flag) arrayHead = head;
                else{
                    arrayHead = new register(new IRPointerType(new IRIntType(32)), "arrayHead32");
                    curBBlock.addInst(new BitCastInst(head, arrayHead));
                    curFunct.addRegs(arrayHead);
                }
                register sizePtr = new register(new IRPointerType(new IRIntType(32)), "sizePtr");
                register size = new register(new IRIntType(32), "size");
                ArrayList<IROperand> tmpList = new ArrayList<>();
                tmpList.add(new constInt(-1));
                curBBlock.addInst(new GetElemPtrInst(sizePtr, arrayHead, tmpList));
                curFunct.addRegs(sizePtr);
                curBBlock.addInst(new LoadInst(size, sizePtr));
                curFunct.addRegs(size);
                node.setRes(size);
            }
            else{
                FunctSymbol functSymbol = (FunctSymbol) node.getSymbol();
                IRFunction function = functSymbol.getFunction();
                IRType retType = function.getType();
                register nameReg = (register)name.getRes();
                MethodExprNode tmpNode = (MethodExprNode)member;
                ArrayList<IROperand> paraRegList = new ArrayList<>();
                ArrayList<ExprNode> paraList = tmpNode.getParaList();
                paraRegList.add(nameReg);
                for(var para : paraList){
                    para.accept(this);
                    paraRegList.add(para.getRes());
                }
                register retReg = null;
                if(!(retType instanceof IRVoidType)) {
                    retReg = new register(retType, "call");
                    curFunct.addRegs(retReg);
                }
                curBBlock.addInst(new CallInst(function, paraRegList, retReg));
                node.setRes(retReg);
            }
        }
        else if(member instanceof IndexExprNode){//array
            ExprNode index = ((IndexExprNode)member).getIndex();
            index.accept(this);
            VarSymbol varSymbol = (VarSymbol)node.getSymbol();
            IRPointerType memberType = (IRPointerType)varSymbol.getIrType();
            register nameReg = (register)name.getRes();
            register memberAddress = new register(new IRPointerType(memberType), Identifier+"$");
            ArrayList<IROperand> tmpList = new ArrayList<>();
            tmpList.add(new constInt(0));tmpList.add(new constInt(classSymbol.getOrder(Identifier)));
            curBBlock.addInst(new GetElemPtrInst(memberAddress, nameReg, tmpList));
            curFunct.addRegs(memberAddress);
            register arrayLoad = new register(memberType, Identifier);
            curBBlock.addInst(new LoadInst(arrayLoad, memberAddress));
            curFunct.addRegs(arrayLoad);
            register ptrAddress = new register(memberType, "element$");
            ArrayList<IROperand> tmpList1 = new ArrayList<>();tmpList1.add(index.getRes());
            curBBlock.addInst(new GetElemPtrInst(ptrAddress, arrayLoad, tmpList1));
            curFunct.addRegs(ptrAddress);
            register elementLoad = new register(memberType.getPointerType(), "element");
            curBBlock.addInst(new LoadInst(elementLoad, ptrAddress));
            curFunct.addRegs(elementLoad);
            node.setAddress(ptrAddress);
            node.setRes(elementLoad);
        }
    }

    @Override
    public void visit(MethodExprNode node) {
        ExprNode name = node.getName();
        if(name instanceof MemberExprNode || name instanceof CreatorExprNode){
            name.accept(this);
            node.setRes(name.getRes());
            node.setAddress(name.getAddress());
        }
        else if(name instanceof IdExprNode){
            IdExprNode tmp = (IdExprNode)name;
            FunctSymbol functSymbol = (FunctSymbol)tmp.getSymbol();
            IRFunction function = functSymbol.getFunction();
            IRType retType = function.getType();
            register reg = null;
            if(!(retType instanceof IRVoidType)) reg = new register(retType, "call");
            if(reg != null) curFunct.addRegs(reg);
            if(functSymbol.getEnclosingScope() == scope){
                ArrayList<IROperand> paraRegList = new ArrayList<>();
                ArrayList<ExprNode> paraList = node.getParaList();
                for(var para : paraList){
                    para.accept(this);
                    paraRegList.add(para.getRes());
                }
                curBBlock.addInst(new CallInst(functSymbol.getFunction(), paraRegList, reg));
                node.setRes(reg);
            }
            else {
                register thisAddress = curFunct.getRegister("this$");
                IRPointerType tmpType = (IRPointerType)thisAddress.getType();
                register thisReg = new register(tmpType.getPointerType(), "this");
                curBBlock.addInst(new LoadInst(thisReg, thisAddress));
                curFunct.addRegs(thisReg);
                ArrayList<IROperand> paraRegList = new ArrayList<>();
                ArrayList<ExprNode> paraList = node.getParaList();
                paraRegList.add(thisReg);
                for(var para : paraList){
                    para.accept(this);
                    paraRegList.add(para.getRes());
                }
                curBBlock.addInst(new CallInst(functSymbol.getFunction(), paraRegList, reg));
                node.setRes(reg);
            }
        }
    }

    @Override
    public void visit(BlankStatNode node) {

    }

    @Override
    public void visit(BreakStatNode node) {
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(afterStack, curBBlock));
    }

    @Override
    public void visit(BlockStatNode node) {
        ArrayList<StatmentNode> statList = node.getStats();
        for(var stat : statList) stat.accept(this);
    }

    @Override
    public void visit(ContinueStatNode node) {
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(updateStack, curBBlock));
    }

    @Override
    public void visit(ExprStatNode node) {
        node.getExpr().accept(this);
    }

    @Override
    public void visit(ForStatNode node) {
        IRBBlock condBBlock = new IRBBlock("forCondBBlock");curFunct.addBBlocks(condBBlock);
        IRBBlock bodyBBlock = new IRBBlock("forBodyBBlock");curFunct.addBBlocks(bodyBBlock);
        IRBBlock stepBBlock = new IRBBlock("forStepBBlock");curFunct.addBBlocks(stepBBlock);
        IRBBlock afterBBlock = new IRBBlock("afterForBBlock");curFunct.addBBlocks(afterBBlock);
        ExprNode init = node.getInit();
        if(init != null) init.accept(this);
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        curBBlock = condBBlock;
        ExprNode cond = node.getCondition();
        if(cond == null) curBBlock.addInst(new BranchInst(bodyBBlock, curBBlock));
        else{
            cond.accept(this);
            curBBlock.addInst(new BranchInst(bodyBBlock, afterBBlock, cond.getRes(), curBBlock));
        }
        curBBlock = bodyBBlock;
        IRBBlock update = updateStack, after = afterStack;
        updateStack = stepBBlock; afterStack = afterBBlock;
        node.getStat().accept(this);
        updateStack = update; afterStack = after;
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(stepBBlock, curBBlock));
        curBBlock = stepBBlock;
        ExprNode step = node.getStep();
        if(step != null) step.accept(this);
        curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        curBBlock = afterBBlock;
    }

    @Override
    public void visit(IfStatNode node) {
        IRBBlock condBBlock = new IRBBlock("ifCondBBlock");curFunct.addBBlocks(condBBlock);
        IRBBlock thenBBlock = new IRBBlock("thenBodyBBlock");curFunct.addBBlocks(thenBBlock);
        IRBBlock elseBBlock = new IRBBlock("elseBodyBBlock");if(node.getElse() != null) curFunct.addBBlocks(elseBBlock);
        IRBBlock afterBBlock = new IRBBlock("afterIfBBlock");curFunct.addBBlocks(afterBBlock);
        ExprNode cond = node.getCondition();
        StatmentNode thenStat = node.getThen(), elseStat = node.getElse();
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        if(condBBlock.getIdentifier().equals("ifCondBBlock.16")){
            int i = 1;
        }
        curBBlock = condBBlock;
        //System.out.println(condBBlock.getIdentifier());
        cond.accept(this);
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(thenBBlock, elseStat == null?afterBBlock:elseBBlock, cond.getRes(), curBBlock));
        curBBlock = thenBBlock;
        thenStat.accept(this);
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(afterBBlock, curBBlock));
        if(elseStat != null){
            curBBlock = elseBBlock;
            elseStat.accept(this);
            if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(afterBBlock, curBBlock));
        }
        curBBlock = afterBBlock;
    }

    @Override
    public void visit(WhileStatNode node) {
        IRBBlock condBBlock = new IRBBlock("whileCondBBlock");curFunct.addBBlocks(condBBlock);
        IRBBlock bodyBBlock = new IRBBlock("whileBodyBBlock");curFunct.addBBlocks(bodyBBlock);
        IRBBlock afterBBlock = new IRBBlock("afterWhileBBlock");curFunct.addBBlocks(afterBBlock);
        ExprNode cond = node.getExpr();
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        curBBlock = condBBlock;
        cond.accept(this);
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(bodyBBlock, afterBBlock, cond.getRes(), curBBlock));
        curBBlock = bodyBBlock;
        IRBBlock update = updateStack, after = afterStack;
        updateStack = condBBlock; afterStack = afterBBlock;
        node.getStat().accept(this);
        updateStack = update; afterStack = after;
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        curBBlock = afterBBlock;
    }

    @Override
    public void visit(ReturnStatNode node) {
        ExprNode expr = node.getExpr();
        if(expr != null) {
            expr.accept(this);
            curBBlock.addInst(new StoreInst(expr.getRes(), retAddress));
        }
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(retBBlock, curBBlock));
    }

    @Override
    public void visit(VardefListStatNode node) {
        node.getVardefList().accept(this);
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
        node.setRes(new constBool(node.isValue()));
    }

    @Override
    public void visit(IntLiterExprNode node) {
        node.setRes(new constInt(node.getValue()));
    }

    @Override
    public void visit(StringLiterExprNode node) {
        string str = module.addString(node.getStringLiter());
        register reg = new register(new IRPointerType(new IRIntType(8)), "__stringLiteral");
        ArrayList<IROperand> indexList = new ArrayList<>();
        indexList.add(new constInt(0));indexList.add(new constInt(0));
        curBBlock.addInst(new GetElemPtrInst(reg, str, indexList));
        curFunct.addRegs(reg);
        node.setRes(reg);
    }

    @Override
    public void visit(NullLiterExprNode node) {
        node.setRes(new constNull());
    }

    public IRType getIRType(TypeNode typeNode){
        String Identifier = typeNode.typeName();
        if(typeNode instanceof PrimTypeNode){
            if(Identifier.equals("int"))         return new IRIntType(32);
            else if(Identifier.equals("bool"))   return new IRIntType(1);
            else if(Identifier.equals("string")) return new IRPointerType(new IRIntType(8));
            else                                 return new IRVoidType();

        }
        if(typeNode instanceof ArrayTypeNode){
            IRType type;
            if(Identifier.equals("int")) type = new IRIntType(32);
            else if(Identifier.equals("bool")) type = new IRIntType(1);
            else if(Identifier.equals("string")) type = new IRPointerType(new IRIntType(8));
            else if(Identifier.equals("void")) type = new IRVoidType();
            else type = new IRPointerType(scope.getClassScope(Identifier).getClassType());
            ArrayTypeNode tmp = (ArrayTypeNode)typeNode;
            int dims = tmp.getDims();
            for(int i=0;i<dims;++i) type = new IRPointerType(type);
            return type;
        }
        return new IRPointerType(scope.getResolveScope(Identifier).getClassType());
    }

    public register intStringCreator(IRType type, ArrayList<ExprNode> indexList, int dims){
        ExprNode index = indexList.get(0);
        IRType ptrType = type;
        for(int i=0; i<dims; ++i) ptrType = new IRPointerType(ptrType);
        register mul = new register(new IRIntType(32), "mul");
        curBBlock.addInst(new BinOpInst(new constInt(((IRPointerType)ptrType).getPointerType().getBytes()), index.getRes(), mul, BinOpType.mul));
        curFunct.addRegs(mul);
        register add = new register(new IRIntType(32), "add");
        curBBlock.addInst(new BinOpInst(mul, new constInt(4), add, BinOpType.add));
        curFunct.addRegs(add);
        register malloc8 = new register(new IRPointerType(new IRIntType(8)), "malloc8");
        ArrayList<IROperand> tmpList1 = new ArrayList<>();tmpList1.add(add);
        curBBlock.addInst(new CallInst(mallocFunct, tmpList1, malloc8));
        curFunct.addRegs(malloc8);
        register malloc32 = new register(new IRPointerType(new IRIntType(32)), "malloc32");
        curBBlock.addInst(new BitCastInst(malloc8, malloc32));
        curFunct.addRegs(malloc32);
        curBBlock.addInst(new StoreInst(index.getRes(), malloc32));
        register arrayHead = new register(new IRPointerType(new IRIntType(32)), "arrayHead32");
        ArrayList<IROperand> tmpList2 = new ArrayList<>();tmpList2.add(new constInt(1));
        curBBlock.addInst(new GetElemPtrInst(arrayHead, malloc32, tmpList2));
        curFunct.addRegs(arrayHead);
        boolean flag = false;register head;
        if(((IRPointerType)ptrType).getPointerType() instanceof IRIntType){
            IRIntType tmpType = (IRIntType)(((IRPointerType)ptrType).getPointerType());
            if(tmpType.bytes() == 32) flag = true;
        }
        if(flag) head = arrayHead;
        else{
            head = new register(ptrType, "arrayHead");
            curBBlock.addInst(new BitCastInst(arrayHead, head));
            curFunct.addRegs(head);
        }
        if(indexList.size() == 1) return head;
        IRBBlock condBBlock = new IRBBlock("creatorCondBBlock");curFunct.addBBlocks(condBBlock);
        IRBBlock bodyBBlock = new IRBBlock("creatorBodyBBlock");curFunct.addBBlocks(bodyBBlock);
        IRBBlock stepBBlock = new IRBBlock("creatorStepBBlock");curFunct.addBBlocks(stepBBlock);
        IRBBlock afterBBlock = new IRBBlock("afterCreatorBBlock");curFunct.addBBlocks(afterBBlock);
        ArrayList<ExprNode> updateIndexList = new ArrayList<>();
        for(int i = 1; i<indexList.size(); ++i) updateIndexList.add(indexList.get(i));
        register rear = new register(ptrType, "arrayTail");curFunct.addRegs(rear);
        register now = new register(ptrType, "arrayNow");curFunct.addRegs(now);
        register next = new register(ptrType, "arrayNext");curFunct.addRegs(next);
        ArrayList<IROperand> tmpList3 = new ArrayList<>(); tmpList3.add(index.getRes());
        curBBlock.addInst(new GetElemPtrInst(rear, head, tmpList3));
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        IRBBlock tmpCurBBlock = curBBlock;
        curBBlock = condBBlock;
        PhiInst phiInst = new PhiInst(now, new ArrayList<>(), new ArrayList<>());
        phiInst.addEntry(head, tmpCurBBlock);phiInst.addEntry(next, stepBBlock);
        curBBlock.addInst(phiInst);
        register ne = new register(new IRIntType(1), "ne");
        curBBlock.addInst(new IcmpInst(now, rear, ne, IcmpType.ne));
        curFunct.addRegs(ne);
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(bodyBBlock, afterBBlock, ne, curBBlock));
        curBBlock = bodyBBlock;
        register subCreator = intStringCreator(type, updateIndexList, dims-1);
        curBBlock.addInst(new StoreInst(subCreator, now));
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(stepBBlock, curBBlock));
        curBBlock = stepBBlock;
        ArrayList<IROperand> tmpList4 = new ArrayList<>();tmpList4.add(new constInt(1));
        curBBlock.addInst(new GetElemPtrInst(next, now, tmpList4));
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        curBBlock = afterBBlock;
        return head;
    }

    public register classCreator(IRType type, ArrayList<ExprNode> indexList, int dims, IRFunction constructor){
        if(dims == 0){
            register malloc8 = new register(new IRPointerType(new IRIntType(8)), "malloc8");
            curFunct.addRegs(malloc8);
            ArrayList<IROperand> tmpList = new ArrayList<>(); tmpList.add(new constInt(type.getBytes()));
            curBBlock.addInst(new CallInst(mallocFunct, tmpList, malloc8));
            register malloc = new register(new IRPointerType(type), "malloc");
            curBBlock.addInst(new BitCastInst(malloc8, malloc));
            curFunct.addRegs(malloc);
            if(constructor != null){
                ArrayList<IROperand> tmpList1 = new ArrayList<>();tmpList1.add(malloc);
                curBBlock.addInst(new CallInst(constructor, tmpList1, null));
            }
            return malloc;
        }
        ExprNode index = indexList.get(0);
        IRType ptrType = new IRPointerType(type);
        for(int i=0; i<dims; ++i) ptrType = new IRPointerType(ptrType);
        register mul = new register(new IRIntType(32), "mul");
        curBBlock.addInst(new BinOpInst(new constInt(8), index.getRes(), mul, BinOpType.mul));
        curFunct.addRegs((register)mul);
        register add = new register(new IRIntType(32), "add");
        curBBlock.addInst(new BinOpInst(mul, new constInt(4), add, BinOpType.add));
        curFunct.addRegs(add);
        register malloc8 = new register(new IRPointerType(new IRIntType(8)), "malloc8");
        ArrayList<IROperand> tmpList1 = new ArrayList<>();tmpList1.add(add);
        curBBlock.addInst(new CallInst(mallocFunct, tmpList1, malloc8));
        curFunct.addRegs(malloc8);
        register malloc32 = new register(new IRPointerType(new IRIntType(32)), "malloc32");
        curBBlock.addInst(new BitCastInst(malloc8, malloc32));
        curFunct.addRegs(malloc32);
        curBBlock.addInst(new StoreInst(index.getRes(), malloc32));
        register arrayHead = new register(new IRPointerType(new IRIntType(32)), "arrayHead32");
        ArrayList<IROperand> tmpList2 = new ArrayList<>();tmpList2.add(new constInt(1));
        curBBlock.addInst(new GetElemPtrInst(arrayHead, malloc32, tmpList2));
        curFunct.addRegs(arrayHead);
        register head = new register(ptrType, "arrayHead");
        curBBlock.addInst(new BitCastInst(arrayHead, head));
        curFunct.addRegs(head);
        if(indexList.size() == 1) return head;
        IRBBlock condBBlock = new IRBBlock("creatorCondBlock");curFunct.addBBlocks(condBBlock);
        IRBBlock bodyBBlock = new IRBBlock("creatorBodyBlock");curFunct.addBBlocks(bodyBBlock);
        IRBBlock stepBBlock = new IRBBlock("creatorStepBlock");curFunct.addBBlocks(stepBBlock);
        IRBBlock afterBBlock = new IRBBlock("afterCreatorBlock");curFunct.addBBlocks(afterBBlock);
        ArrayList<ExprNode> updateIndexList = new ArrayList<>();
        for(int i = 1; i<indexList.size(); ++i) updateIndexList.add(indexList.get(i));
        register rear = new register(ptrType, "arrayTail");curFunct.addRegs(rear);
        register now = new register(ptrType, "arrayNow");curFunct.addRegs(now);
        register next = new register(ptrType, "arrayNext");curFunct.addRegs(next);
        ArrayList<IROperand> tmpList3 = new ArrayList<>(); tmpList3.add(index.getRes());
        curBBlock.addInst(new GetElemPtrInst(rear, head, tmpList3));
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        IRBBlock tmpCurBBlock = curBBlock;
        curBBlock = condBBlock;
        PhiInst phiInst = new PhiInst(now, new ArrayList<>(), new ArrayList<>());
        phiInst.addEntry(head, tmpCurBBlock);phiInst.addEntry(next, stepBBlock);
        curBBlock.addInst(phiInst);
        register ne = new register(new IRIntType(1), "ne");
        curBBlock.addInst(new IcmpInst(now, rear, ne, IcmpType.ne));
        curFunct.addRegs(ne);
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(bodyBBlock, afterBBlock, ne, curBBlock));
        curBBlock = bodyBBlock;
        register subCreator = classCreator(type, updateIndexList, dims-1, constructor);
        curBBlock.addInst(new StoreInst(subCreator, now));
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(stepBBlock, curBBlock));
        curBBlock = stepBBlock;
        ArrayList<IROperand> tmpList4 = new ArrayList<>();tmpList4.add(new constInt(1));
        curBBlock.addInst(new GetElemPtrInst(next, now, tmpList4));
        if(!(curBBlock.getRear() instanceof BranchInst)) curBBlock.addInst(new BranchInst(condBBlock, curBBlock));
        curBBlock = afterBBlock;
        return head;
    }

    public IRModule getModule(){
        return module;
    }
}
