package optimize;

import llvm_IR.IRModule;

public abstract class PASS {
    protected IRModule irModule;
    public PASS(IRModule irModule){
        this.irModule = irModule;
    }
}
