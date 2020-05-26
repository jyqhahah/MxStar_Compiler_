package llvm_IR;

import llvm_IR.operand.register;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class IRSymbol {
    private LinkedHashMap<String, ArrayList<Object>> hashMap;
    public IRSymbol(){
        hashMap = new LinkedHashMap<>();
    }

    public void add(String Identifier, Object object){
        if(!hashMap.containsKey(Identifier)) hashMap.put(Identifier, new ArrayList<>());
        ArrayList<Object> IdArray = hashMap.get(Identifier);
        if(object instanceof IRBBlock)
            ((IRBBlock)object).setIdentifier(Identifier+"."+IdArray.size());
        else if(object instanceof register)
            ((register)object).setIdentifier(Identifier+"."+IdArray.size());
        else
            return;
            //System.err.println("IRSymbol error");
        IdArray.add(object);
    }
}
