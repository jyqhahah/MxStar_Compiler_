package SemanticChecker.Scope;

import AST.*;
import SemanticChecker.Scope.Symbol.*;
import SemanticChecker.Scope.Type.*;
import utility.errorReminder;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class GlobalScope extends BaseScope {
    private LinkedHashMap<String, Type> typeList;
    private LinkedHashMap<String, FunctSymbol> FunctList;

    public GlobalScope(Scope scope){
        super(scope);
        this.typeList = new LinkedHashMap<>();
        this.FunctList = new LinkedHashMap<>();
    }

    @Override
    public Scope getGlobalScope() {
        return this;
    }

    @Override
    public FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder) {
        String Identifier = funct.getIdentifier();
        TypeNode typeNode = funct.getType();
        Type type = null;
        if(typeNode == null){
            errorReminder.error(funct.getLoc(), "have no return value");
            return null;
        }
        if(FunctList.containsKey(Identifier)){
            errorReminder.error(funct.getLoc(),"redeclare of function"+Identifier+"\'");
            return null;
        }
        String id = typeNode.typeName();
        type = TypeResolver(id);
        if(type == null){
            errorReminder.error(funct.getLoc(), "invalid type name"+id +"\'");
            return null;
        }
        if(typeNode instanceof ArrayTypeNode){
            ArrayTypeNode tmp_node = (ArrayTypeNode)typeNode;
            int dims = tmp_node.getDims();
        }
        FunctSymbol functSymbol = new FunctSymbol(this, Identifier, type, new LinkedHashMap<>());
        FunctList.put(Identifier, functSymbol);
        return functSymbol;
    }

    @Override
    public ClassSymbol ClassDeclare(ClassdefNode Class, errorReminder errorReminder) {
        String Identifier = Class.getIdentifier();
        if(typeList.containsKey(Identifier)){
            errorReminder.error(Class.getLoc(),"redeclare of Class"+Identifier+"\'");
            return null;
        }
        ClassSymbol classSymbol = new ClassSymbol(this, Identifier);
        typeList.put(Identifier, classSymbol);
        return classSymbol;
    }

    @Override
    public FunctSymbol getFunctScope(String Identifier) {
        return FunctList.get(Identifier);
    }

    @Override
    public ClassSymbol getClassScope(String Identifier) {
        ClassSymbol tmp = (ClassSymbol)typeList.get(Identifier);
        return tmp;
    }

    @Override
    public FunctSymbol inFunctSymbol() {
        return null;
    }

    @Override
    public ClassSymbol inClassSymbol() {
        return null;
    }

    @Override
    public boolean repeatedClassName(String Identifier) {
        return typeList.containsKey(Identifier);
    }

    @Override
    public Type TypeResolver(String Indentifier) {
        //System.out.println(typeList.keySet());
        return typeList.getOrDefault(Indentifier, null);
    }

    @Override
    public FunctSymbol FunctResolver(MethodExprNode node, errorReminder errorReminder) {
        String Identifier = node.getIdentifier();
        if(typeList.containsKey(Identifier)){
            Type type = typeList.get(Identifier);
            if(type instanceof IntType||type instanceof BoolType||type instanceof StringType){
                errorReminder.error(node.getLoc(), "invalid function name");
                return null;
            }
            else{
                ClassSymbol tmp = (ClassSymbol)type;
                return tmp.getFunctSymbol(node, errorReminder);
            }
        }
        else {
            if(!FunctList.containsKey(Identifier)){
                errorReminder.error(node.getLoc(), "the function"+Identifier+"\'is not declared");
                return null;
            }
            ArrayList<ExprNode> paraList = node.getParaList();
            FunctSymbol functSymbol = FunctList.get(Identifier);
            LinkedHashMap<String, VarSymbol> tmpParaList = functSymbol.getParaList();
            if(paraList.size()!=tmpParaList.size())
                errorReminder.error(node.getLoc(), "function parameter number not match");
            int cnt = 0;
            for(var entry : tmpParaList.entrySet()){
                if(cnt >= paraList.size()) break;
                Type tmp_para = entry.getValue().getType();
                Type para = paraList.get(cnt).getType();
                if(para != null){
                    if(para instanceof NullType && !(tmp_para instanceof ClassSymbol))
                        errorReminder.error(paraList.get(cnt).getLoc(),"null expression apply to invalid type"+tmp_para.toString());
                    else if(!tmp_para.toString().equals(para.toString()))
                        errorReminder.error(paraList.get(cnt).getLoc(), "paraType not match between" + tmp_para.typeString() + " and "+ para.typeString());
                }
                cnt++;
            }
            return functSymbol;
        }
    }

    @Override
    public VarSymbol VarResolver(IdExprNode var, errorReminder errorReminder) {
        String Identifier = var.getIdentifier();
        if(varList.containsKey(Identifier))
            return varList.get(Identifier);
        else {
            errorReminder.error(var.getLoc(),"invalid variable name "+Identifier+"\'");
            return null;
        }
    }

    @Override
    public VarSymbol ArrayResolver(IndexExprNode array, errorReminder errorReminder) {
        String Identifier = array.getIdentifier();
        //System.out.println(Identifier);
        if(varList.containsKey(Identifier)){
            VarSymbol var = varList.get(Identifier);
            Type type = var.getType();
            if(type instanceof ArrayType){
                ArrayType tmp_node = (ArrayType)type;
                int dims = tmp_node.getDims();
                String id = type.typeString();
                if(dims == 1)
                    return new VarSymbol(Identifier, null, TypeResolver(Identifier));
                else {
                    ArrayType arrayType = new ArrayType(getGlobalScope(), id, dims - 1);
                    return new VarSymbol(Identifier, null, arrayType);
                }
            }
            else{
                errorReminder.error(array.getLoc(), Identifier+"is not an array");
                return null;
            }
        }
        else{
            errorReminder.error(array.getLoc(), "invalid array name"+Identifier+"\'");
            return null;
        }
    }

    @Override
    public boolean isInLoop() {
        return false;
    }

    @Override
    public boolean isInIf() {
        return false;
    }

    public void initGlobalScope(Scope globalScope, StringType stringType){
        typeList.put("int", new IntType());typeList.put("bool", new BoolType());
        typeList.put("void", new VoidType());typeList.put("string", stringType);

        LinkedHashMap<String, VarSymbol> para1 = new LinkedHashMap<>();
        para1.put("str", new VarSymbol("str", null, stringType));
        FunctList.put("print", new FunctSymbol(globalScope, "print", new VoidType(), para1, para1));

        LinkedHashMap<String, VarSymbol> para2 = new LinkedHashMap<>();
        para2.put("str", new VarSymbol("str", null, stringType));
        FunctList.put("println", new FunctSymbol(globalScope, "println", new VoidType(), para2, para2));

        LinkedHashMap<String, VarSymbol> para3 = new LinkedHashMap<>();
        para3.put("n", new VarSymbol("n", null, new IntType()));
        FunctList.put("printInt", new FunctSymbol(globalScope, "printInt", new VoidType(), para3, para3));

        LinkedHashMap<String, VarSymbol> para4 = new LinkedHashMap<>();
        para4.put("n", new VarSymbol("n", null, new IntType()));
        FunctList.put("printlnInt", new FunctSymbol(globalScope, "printlnInt", new VoidType(), para4, para4));

        LinkedHashMap<String, VarSymbol> para5 = new LinkedHashMap<>();
        para5.put("i", new VarSymbol("i", null, new IntType()));
        FunctList.put("toString", new FunctSymbol(globalScope, "toString", stringType, para5, para5));

        FunctList.put("getString", new FunctSymbol(globalScope, "getString", stringType,  new LinkedHashMap<>()));

        FunctList.put("getInt", new FunctSymbol(globalScope, "getInt", new IntType(),  new LinkedHashMap<>()));
    }
}
