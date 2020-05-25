package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;
import llvm_IR.instruction.BranchInst;
import llvm_IR.instruction.IRInstruction;
import llvm_IR.instruction.MoveInst;
import llvm_IR.instruction.PhiInst;
import llvm_IR.operand.IROperand;
import llvm_IR.operand.register;

import java.util.ArrayList;
import java.util.LinkedHashMap;

public class SSADestructor extends PASS {
    public SSADestructor(IRModule irModule){
        super(irModule);
    }

    public void run(){
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            criticalEdgeSplit(entry.getValue());
            sequentialParallelCopies(entry.getValue());
        }
    }

    public void criticalEdgeSplit(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(var bblock : bblockList){
            ArrayList<PhiInst> phiList = bblock.getAllPhi();
            for(var phiInst : phiList){
                ArrayList<IROperand> operands = phiInst.getOperands();
                ArrayList<IRBBlock> predBBlocks = phiInst.getBblocks();
                register reg = phiInst.getRes();
                for(int i=0;i<predBBlocks.size();++i){
                    IROperand operand = operands.get(i);
                    IRBBlock predBBlock = predBBlocks.get(i);
                    if(predBBlock.getSuccBBlock().size() == 1)
                        predBBlock.addMove(new MoveInst(reg, operand));
                    else{
                        IRBBlock criticalBBlock = new IRBBlock("criticalEdge");
                        function.addBBlocks(criticalBBlock);
                        criticalBBlock.addMove(new MoveInst(reg, operand));
                        criticalBBlock.addInst(new BranchInst(bblock, criticalBBlock));
                        predBBlock.removeSuccBBlock(bblock);
                        predBBlock.addSuccBBlock(criticalBBlock);
                        bblock.removePrevBBlock(predBBlock);
                        bblock.addPredBBlock(criticalBBlock);
                        IRInstruction Inst = bblock.getHead();
                        while(Inst instanceof PhiInst){
                            ((PhiInst)Inst).replacePhiUsedInst(predBBlock, criticalBBlock);
                            Inst = Inst.getNext();
                        }
                        ((BranchInst)predBBlock.getRear()).replaceBBlock(bblock, criticalBBlock);
                    }
                }
                phiInst.removeAll();
            }
        }
    }

    public void sequentialParallelCopies(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(var bblock : bblockList){
            while(bblock.hasMoveInst()){
                MoveInst moveInst = bblock.MoveOutCircle();
                if(moveInst != null)
                    bblock.mergeMove(moveInst);
                else{
                    moveInst = bblock.getFirstMove();
                    IROperand src = moveInst.getSrc();
                    register srcReg = new register(src.getType(), "srcTmp");
                    function.addRegs(srcReg);
                    bblock.mergeMove(new MoveInst(srcReg, src));
                    moveInst.setSrc(srcReg);
                }
            }
        }
    }
}
