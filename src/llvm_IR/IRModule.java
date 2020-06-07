package llvm_IR;

import SemanticChecker.Scope.GlobalScope;
import SemanticChecker.Scope.Symbol.ClassSymbol;
import SemanticChecker.Scope.Symbol.FunctSymbol;
import SemanticChecker.Scope.Type.StringType;
import llvm_IR.type.*;
import llvm_IR.operand.*;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class IRModule  {
    private IRFunction main;
    private LinkedHashMap<String, IRFunction> FunctList, BuiltInFunctList;
    private LinkedHashMap<String, IRClassType> ClassList;
    private LinkedHashMap<String, variable> VarList;
    private LinkedHashMap<String, string> StringList;

    public IRModule(GlobalScope globalScope, StringType stringType){
        main = null;
        FunctList = new LinkedHashMap<>();
        BuiltInFunctList = new LinkedHashMap<>();
        ClassList = new LinkedHashMap<>();
        VarList = new LinkedHashMap<>();
        StringList = new LinkedHashMap<>();
        initModule(globalScope, stringType);
    }

    public IRFunction getMain() {
        return main;
    }

    public void setMain(IRFunction main) {
        this.main = main;
    }

    public LinkedHashMap<String, string> getStringList() {
        return StringList;
    }

    public LinkedHashMap<String, IRFunction> getFunctList() {
        return FunctList;
    }

    public IRFunction getFunct(String Identifier){
        return FunctList.get(Identifier);
    }

    public LinkedHashMap<String, IRClassType> getClassList() {
        return ClassList;
    }

    public IRClassType getClass(String Identifier){
        return ClassList.get(Identifier);
    }

    public LinkedHashMap<String, variable> getVarList() {
        return VarList;
    }

    public variable getVar(String Identifier){
        if(!VarList.containsKey(Identifier)){
            System.err.println("error in ModuleVarList");
        }
        return VarList.get(Identifier);
    }

    public LinkedHashMap<String, IRFunction> getBuiltInFunctList() {
        return BuiltInFunctList;
    }

    public IRFunction getBuiltInFunct(String Identifier){
        return BuiltInFunctList.get(Identifier);
    }

    public void addVar(variable var){
        String Identifier = var.getIdentifier();
        VarList.put(Identifier, var);
    }

    public void addFunct(String Identifier, IRFunction funct){
        FunctList.put(Identifier, funct);
    }

    public void addClass(String Identifier, IRClassType Class){
        ClassList.put(Identifier,Class);
    }

    public string addString(String str){
        str = str.replace("\\\\", "\\");
        str = str.replace("\\n", "\n");
        str = str.replace("\\\"", "\"");
        str = str + "\0";
        if(StringList.containsKey(str)) return StringList.get(str);
        string retString = new string(new IRPointerType(new IRArrayType(str.length(),new IRIntType(8))), ".str."+String.valueOf(StringList.size()), new constString(str));
        StringList.put(str, retString);
        return retString;
    }

    public void accept(IRVisitor visitor){
        visitor.visit(this);
    }

    public void initModule(GlobalScope globalScope, StringType stringType){
        LinkedHashMap<String, FunctSymbol> scopeFunctList = globalScope.getFunctList();
        LinkedHashMap<String, FunctSymbol> stringFunctList = stringType.getFunctList();

        //System.out.println(scopeFunctList.size());

        ArrayList<register> para0 = new ArrayList<>();para0.add(new register(new IRIntType(32), "i"));
        IRFunction funct0 = new IRFunction(new IRPointerType(new IRIntType(8)), "__toString", para0);
        BuiltInFunctList.put("__toString", funct0);
        scopeFunctList.get("toString").setFunction(funct0);

        ArrayList<register> para1 = new ArrayList<>();para1.add(new register(new IRIntType(32), "n"));
        IRFunction funct1 = new IRFunction(new IRPointerType(new IRIntType(8)), "__malloc", para1);
        BuiltInFunctList.put("__malloc", funct1);

        ArrayList<register> para2 = new ArrayList<>();
        IRFunction funct2 = new IRFunction(new IRPointerType(new IRIntType(8)), "__getString", para2);
        BuiltInFunctList.put("__getString", funct2);
        scopeFunctList.get("getString").setFunction(funct2);

        ArrayList<register> para3 = new ArrayList<>();
        IRFunction funct3 = new IRFunction(new IRIntType(32), "__getInt", para3);
        BuiltInFunctList.put("__getInt", funct3);
        scopeFunctList.get("getInt").setFunction(funct3);

        ArrayList<register> para4 = new ArrayList<>();para4.add(new register(new IRPointerType(new IRIntType(8)), "str"));
        IRFunction funct4 = new IRFunction(new IRVoidType(), "__print", para4);
        BuiltInFunctList.put("__print", funct4);
        scopeFunctList.get("print").setFunction(funct4);

        IRFunction funct5 = new IRFunction(new IRVoidType(), "__println", para4);
        BuiltInFunctList.put("__println", funct5);
        scopeFunctList.get("println").setFunction(funct5);

        IRFunction funct6 = new IRFunction(new IRVoidType(), "__printInt", para1);
        BuiltInFunctList.put("__printInt", funct6);
        scopeFunctList.get("printInt").setFunction(funct6);

        IRFunction funct7 = new IRFunction(new IRVoidType(), "__printlnInt", para1);
        BuiltInFunctList.put("__printlnInt", funct7);
        scopeFunctList.get("printlnInt").setFunction(funct7);

        ArrayList<register> para8 = new ArrayList<>();
        para8.add(new register(new IRPointerType(new IRIntType(8)), "str"));
        IRFunction funct8 = new IRFunction(new IRIntType(32), "__stringParseInt", para8);
        BuiltInFunctList.put("__stringParseInt", funct8);
        stringFunctList.get("parseInt").setFunction(funct8);

        IRFunction funct9 = new IRFunction(new IRIntType(32), "__stringLength", para8);
        BuiltInFunctList.put("__stringLength", funct9);
        stringFunctList.get("length").setFunction(funct9);

        ArrayList<register> para9 = new ArrayList<>();
        para9.add(new register(new IRPointerType(new IRIntType(8)), "str"));
        para9.add(new register(new IRIntType(32), "pos"));
        IRFunction funct10 = new IRFunction(new IRIntType(32), "__stringOrd", para9);
        BuiltInFunctList.put("__stringOrd", funct10);
        stringFunctList.get("ord").setFunction(funct10);

        ArrayList<register> para11 = new ArrayList<>();
        para11.add(new register(new IRPointerType(new IRIntType(8)), "str"));
        para11.add(new register(new IRIntType(32), "l"));
        para11.add(new register(new IRIntType(32), "r"));
        IRFunction funct11 = new IRFunction(new IRPointerType(new IRIntType(8)), "__stringSubstring", para11);
        BuiltInFunctList.put("__stringSubstring", funct11);
        stringFunctList.get("substring").setFunction(funct11);

        ArrayList<register> para12 = new ArrayList<>();
        para12.add(new register(new IRPointerType(new IRIntType(8)), "str1"));
        para12.add(new register(new IRPointerType(new IRIntType(8)), "str2"));
        IRFunction funct12 = new IRFunction(new IRPointerType(new IRIntType(8)), "__stringAdd", para12);
        BuiltInFunctList.put("__stringAdd", funct12);

        IRFunction funct13 = new IRFunction(new IRIntType(1), "__stringEqual", para12);
        BuiltInFunctList.put("__stringEqual", funct13);

        IRFunction funct14 = new IRFunction(new IRIntType(1), "__stringNotEqual", para12);
        BuiltInFunctList.put("__stringNotEqual", funct14);

        IRFunction funct15 = new IRFunction(new IRIntType(1), "__stringGreater", para12);
        BuiltInFunctList.put("__stringGreater", funct15);

        IRFunction funct16 = new IRFunction(new IRIntType(1), "__stringGreaterEqual", para12);
        BuiltInFunctList.put("__stringGreaterEqual", funct16);

        IRFunction funct17 = new IRFunction(new IRIntType(1), "__stringLess", para12);
        BuiltInFunctList.put("__stringLess", funct17);

        IRFunction funct18 = new IRFunction(new IRIntType(1), "__stringLessEqual", para12);
        BuiltInFunctList.put("__stringLessEqual", funct18);
    }
}
