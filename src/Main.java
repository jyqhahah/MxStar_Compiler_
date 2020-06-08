import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import AST.*;
import SemanticChecker.Scope.GlobalScope;
import SemanticChecker.Scope.Type.StringType;
import SemanticChecker.SemanticChecker.SemanticChecker;
import llvm_IR.IRBBlock;
import llvm_IR.IRBuilder;
import llvm_IR.IRModule;
import llvm_IR.IRPrinter;
import optimize.*;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import parser.*;
import riscv.RegAlloca;
import riscv.RvBuilder;
import riscv.RvModule;
import riscv.RvPrinter;
import riscv.operand.RvPhyReg;
import utility.*;


public class Main {
    public static void main(String[] args)throws IOException{
        errorReminder errorReminder = new errorReminder();
        InputStream in = System.in;
        //InputStream in = new FileInputStream("data.in");
        CharStream charStream = CharStreams.fromStream(in);


        MxStarLexer lexer = new MxStarLexer(charStream);
        lexer.removeErrorListeners();
        lexer.addErrorListener(new MxStarErrorListener(errorReminder));

        CommonTokenStream tokens = new CommonTokenStream(lexer);
        MxStarParser parser = new MxStarParser(tokens);
        parser.removeErrorListeners();
        parser.addErrorListener(new MxStarErrorListener(errorReminder));

        ASTBuilder ast = new ASTBuilder(errorReminder);
        ProgramNode root = (ProgramNode)ast.visit(parser.program());

        SemanticChecker checker  = new SemanticChecker(errorReminder);
        //GlobalScope test = checker.getGlobalScope();
        //System.out.println(test.getFunctList().size());
        checker.visit(root);

//        if(errorReminder.count() > 0)
//            System.exit(errorReminder.count());
        int count = errorReminder.count();
        if(args[0].equals("0")) {
            System.exit(count);
        }
        System.out.println("ir start");
        GlobalScope scope = checker.getGlobalScope();
        StringType stringType = checker.getStringType();
        IRBuilder irBuilder = new IRBuilder(scope, stringType);
        irBuilder.visit(root);
        IRModule irModule = irBuilder.getModule();

        FunctionInliner inl = new FunctionInliner(irModule);
        globalvarEliminator gve = new globalvarEliminator(irModule);
        CFGSimplifier cfg = new CFGSimplifier(irModule);
        Dominator dom = new Dominator(irModule);
        SSAConstructor ssaConstructor = new SSAConstructor(irModule);
        DCE dce = new DCE(irModule);
        SCCP sccp = new SCCP(irModule);
        CSElimination cse = new CSElimination(irModule);
        peephole pph = new peephole(irModule, cse);
        inl.run();
        gve.run();
        cfg.run();
        dom.run();
        ssaConstructor.run();
        boolean isChanged = true;
        while(isChanged){
            isChanged = false;
            isChanged = isChanged | inl.run();
            dom.run();
            isChanged = isChanged | cse.run();
            isChanged = isChanged | pph.run();
            isChanged = isChanged | dce.run();
            isChanged = isChanged | sccp.run();
            isChanged = isChanged | cfg.run();
        }
        SSADestructor ssaDestructor = new SSADestructor(irModule);
        ssaDestructor.run();
//        IRPrinter irPrinter = new IRPrinter();
//        irPrinter.visit(irModule);
        //System.out.println(1);
        RvBuilder rvBuilder = new RvBuilder(irModule);
        RvModule rvModule = rvBuilder.run();
        //System.out.println(2);
        RegAlloca alloca = new RegAlloca(rvModule);
        alloca.run();
        //System.out.println(3);
        RvPrinter rvPrinter = new RvPrinter();
        rvPrinter.visit(rvModule);
    }
}
