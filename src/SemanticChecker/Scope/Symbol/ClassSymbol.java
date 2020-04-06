package SemanticChecker.Scope.Symbol;

import AST.*;
import SemanticChecker.Scope.Scope;
import SemanticChecker.Scope.Type.ArrayType;
import SemanticChecker.Scope.Type.IntType;
import SemanticChecker.Scope.Type.Type;
import utility.errorReminder;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

public class ClassSymbol extends SymbolTable implements Type {
    protected LinkedHashMap<String, FunctSymbol> FunctList;
    private FunctSymbol constructor;

    public ClassSymbol(Scope scope, String Identifier){
        super(scope, Identifier);
        this.FunctList = new LinkedHashMap<>();
    }

    @Override
    public String toString() {
        return Identifier;
    }

    @Override
    public String typeString() {
        return Identifier;
    }

    @Override
    public boolean isFunct() {
        return false;
    }

    @Override
    public FunctSymbol getFunctScope(String Identifier) {
        return FunctList.get(Identifier);
    }

    @Override
    public FunctSymbol inFunctSymbol() {
        return null;
    }

    @Override
    public ClassSymbol inClassSymbol() {
        return this;
    }

    public VarSymbol getArray(String Identifier){
        return varList.get(Identifier);
    }

    public FunctSymbol constructorDeclare(){
        constructor = new FunctSymbol(this, toString(), this, new LinkedHashMap<>());
        constructor.setConstructor(true);
        FunctList.put(Identifier, constructor);
        return constructor;
    }

    public FunctSymbol getConstructor() {
        return constructor;
    }

    @Override
    public FunctSymbol functDeclare(FuncdefNode funct, errorReminder errorReminder) {
        //System.out.println("fun");
        Type type = null;
        String Identifier = funct.getIdentifier();
        TypeNode typeNode = funct.getType();
        if (typeNode == null){
            errorReminder.error(funct.getLoc(), "have no return value");
            return null;
        }
        String id = typeNode.typeName();
        type = TypeResolver(id);
        if(type == null){
            errorReminder.error(funct.getLoc(), "invalid type of \'"+id +"\'");
            return null;
        }
        if(FunctList.containsKey(Identifier)){
            errorReminder.error(funct.getLoc(), "redeclare of function"+id+"\'");
            return null;
        }
        if(typeNode instanceof ArrayTypeNode){
            ArrayTypeNode tmp = (ArrayTypeNode)typeNode;
            int dims = tmp.getDims();
            type = new ArrayType(getGlobalScope(), id, dims);
        }
        FunctSymbol functSymbol = new FunctSymbol(this, Identifier, type, new LinkedHashMap<>());
        FunctList.put(Identifier, functSymbol);
        return functSymbol;
    }

    @Override
    public void ParaListDeclare(ArrayList<VardefNode> paraList, errorReminder errorReminder) {
        return;
    }

    @Override
    public FunctSymbol FunctResolver(MethodExprNode node, errorReminder errorReminder) {
        String Identifier = node.getIdentifier();
        if(FunctList.containsKey(Identifier)){
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
                if(para != null&&!tmp_para.toString().equals(para.toString()))
                    errorReminder.error(paraList.get(cnt).getLoc(), "paraType not match");
                cnt++;
            }
            return functSymbol;
        }
        else
            return scope.FunctResolver(node, errorReminder);
    }

    public FunctSymbol getFunctSymbol(MethodExprNode node, errorReminder errorReminder){
        String Identifier = node.getIdentifier();
        if(FunctList.containsKey(Identifier)){
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
                if(para != null&&!tmp_para.toString().equals(para.toString()))
                    errorReminder.error(paraList.get(cnt).getLoc(), "paraType not match");
                cnt++;
            }
            return functSymbol;
        }
        else{
            errorReminder.error(node.getLoc(), "class has no element named " + node.getIdentifier());
            return null;
        }
    }

    public VarSymbol getVarSymbol(IdExprNode node, errorReminder errorReminder){
        String Identifier = node.getIdentifier();
        if(varList.containsKey(Identifier))
            return varList.get(Identifier);
        else{
            errorReminder.error(node.getLoc(), "class"+toString()+"has no var named"+node.getIdentifier());
            return null;
        }
    }

    public VarSymbol getIndexSymbol(IndexExprNode node, errorReminder errorReminder){
        String Identifier = node.getIdentifier();
        if(varList.containsKey(Identifier)){
            ExprNode index = node.getIndex();
            if(index == null)  errorReminder.error(node.getLoc(), "the array is empty");
            else if(!(index.getType() instanceof IntType)) errorReminder.error(index.getLoc(),"the type not matched between" + index.toString() + "and 'int");
            VarSymbol varSymbol = varList.get(Identifier);
            Type varType = varSymbol.getType();
            if(varType instanceof ArrayType){
                ArrayType tmp_var = (ArrayType)varType;
                int dims = tmp_var.getDims();
                String id = varType.typeString();
                if(dims == 1) return new VarSymbol(Identifier,this ,TypeResolver(id));
                else return new VarSymbol(Identifier, this, new ArrayType(getGlobalScope(), id ,dims-1));
            }
            else {
                errorReminder.error(node.getLoc(), "varType not match ArrayType");
                return null;
            }
        }
        else{
            errorReminder.error(node.getLoc(), "class"+toString()+"has no array named"+node.getIdentifier());
            return null;
        }
    }


}
