package optimize;

import llvm_IR.IRBBlock;
import llvm_IR.IRFunction;
import llvm_IR.IRModule;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;

import utility.Pair;

public class Dominator extends PASS{
    private HashMap<IRBBlock, Pair<IRBBlock, IRBBlock>> unionFindSet;

    public Dominator(IRModule irModule){
        super(irModule);
    }

    public void run(){
        LinkedHashMap<String, IRFunction> functList = irModule.getFunctList();
        for(var entry : functList.entrySet()){
            Tarjan(entry.getValue());
            dfCalculator(entry.getValue());
        }
        for(var entry : functList.entrySet()){
            RTarjan(entry.getValue());
            dfRCalculator(entry.getValue());
        }
    }

    public void link(IRBBlock irbBlock, IRBBlock father){
        unionFindSet.get(irbBlock).first = father;
    }

    public Pair<IRBBlock, IRBBlock> find(IRBBlock bblock){
        Pair<IRBBlock, IRBBlock> father = unionFindSet.get(bblock);
        if(bblock == father.first)
            return father;
        Pair<IRBBlock, IRBBlock> grandfa = find(father.first);
        father.first = grandfa.first;
        if(grandfa.second.getDom_s().getDfn() < father.second.getDom_s().getDfn())
            father.second = grandfa.second;
        return father;
    }

    public void Tarjan(IRFunction function){
        ArrayList<IRBBlock> dfsList = function.dfsBBlock();
        unionFindSet = new HashMap<>();
        for(var bblock : dfsList){
            unionFindSet.put(bblock, new Pair<>(bblock, bblock));
            bblock.setDom_s(bblock);
        }
        for(int i = dfsList.size()-1; i>0;--i){
            IRBBlock bblock = dfsList.get(i);
            ArrayList<IRBBlock> prevBBlock = bblock.getPrevBBlock();
            for (var prev : prevBBlock){
                Pair<IRBBlock, IRBBlock> ancestor = find(prev);
                if(ancestor.second.getDom_s().getDfn() < bblock.getDom_s().getDfn())
                    bblock.setDom_s(ancestor.second.getDom_s());
            }
            bblock.getDom_s().addDom_s(bblock);
            IRBBlock father = bblock.getFather();
            link(bblock, father);

            HashSet<IRBBlock> fBucket = father.getBucket();
            for(var bucket : fBucket){
                Pair<IRBBlock, IRBBlock> ancestor = find(bucket);
                if(ancestor.second.getDom_s().getDfn() < bucket.getDom_s().getDfn())
                    bucket.setDom_i(ancestor.second);
                else
                    bucket.setDom_i(father);
            }
            fBucket.clear();
        }
        for(int i=1; i<dfsList.size(); ++i){
            IRBBlock bblock = dfsList.get(i);
            IRBBlock dom_i = bblock.getDom_i();
            if(dom_i != bblock.getDom_s()){
                dom_i = bblock.getDom_i().getDom_i();
                bblock.setDom_i(dom_i);
            }
            dom_i.addDominate(bblock);
            for(; dom_i != null; dom_i = dom_i.getDom_i()){
                bblock.addStrictDom(dom_i);
            }
        }

    }

    public void dfCalculator(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(var bblock : bblockList){
            ArrayList<IRBBlock> prevBBlock = bblock.getPrevBBlock();
            HashSet<IRBBlock> strictDom = bblock.getStrictDom();
            for(var prev : prevBBlock){
                IRBBlock tmp = prev;
                while(tmp != null && !strictDom.contains(tmp)){
                    tmp.addDF(bblock);
                    tmp = tmp.getDom_i();
                }
            }
        }
    }

    public void RTarjan(IRFunction function){
        ArrayList<IRBBlock> rdfsList = function.rdfsBlock();
        unionFindSet = new HashMap<>();
        for(var bblock : rdfsList){
            unionFindSet.put(bblock, new Pair<>(bblock, bblock));
            bblock.setDom_rs(bblock);
        }
        for(int i = rdfsList.size()-1; i>0;--i){
            IRBBlock bblock = rdfsList.get(i);
            ArrayList<IRBBlock> succBBlock = bblock.getSuccBBlock();
            for (var succ : succBBlock){
                Pair<IRBBlock, IRBBlock> ancestor = find(succ);
                if(ancestor.second.getDom_rs().getRdfn() < bblock.getDom_rs().getRdfn())
                    bblock.setDom_rs(ancestor.second.getDom_rs());
            }
            bblock.getDom_rs().addDom_rs(bblock);
            IRBBlock rfather = bblock.getRfather();
            link(bblock, rfather);
            HashSet<IRBBlock> fBucket = rfather.getRbucket();
            for(var rbucket : fBucket){
                Pair<IRBBlock, IRBBlock> ancestor = find(rbucket);
                if(ancestor.second.getDom_rs().getRdfn() < rbucket.getDom_rs().getRdfn())
                    rbucket.setDom_ri(ancestor.second);
                else
                    rbucket.setDom_ri(rfather);
            }
            fBucket.clear();
        }
        for(int i=1; i<rdfsList.size(); ++i){
            IRBBlock bblock = rdfsList.get(i);
            IRBBlock dom_ri = bblock.getDom_ri();
            if(dom_ri != bblock.getDom_rs()){
                dom_ri = bblock.getDom_ri().getDom_ri();
                bblock.setDom_ri(dom_ri);
            }
            dom_ri.addRdominate(bblock);
            for(; dom_ri != null; dom_ri = dom_ri.getDom_ri()){
                bblock.addStrictRDom(dom_ri);
            }
        }

    }

    public void dfRCalculator(IRFunction function){
        ArrayList<IRBBlock> bblockList = function.getBBlockArray();
        for(var bblock : bblockList){
            ArrayList<IRBBlock> succBBlock = bblock.getSuccBBlock();
            HashSet<IRBBlock> strictRDom = bblock.getStrictRDom();
            for(var succ : succBBlock){
                IRBBlock tmp = succ;
                while(tmp != null && !strictRDom.contains(tmp)){
                    tmp.addRDF(bblock);
                    tmp = tmp.getDom_ri();
                }
            }
        }
    }
}
