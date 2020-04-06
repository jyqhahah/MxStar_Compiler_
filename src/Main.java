import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import AST.*;
import SemanticChecker.SemanticChecker.SemanticChecker;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import parser.*;
import utility.*;

public class Main {
    public static void main(String[] args)throws IOException{
        errorReminder errorReminder = new errorReminder();
//        InputStream in = System.in;
        InputStream in = new FileInputStream("data.in");
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
        checker.visit(root);

        if(errorReminder.count() > 0)
            System.exit(errorReminder.count());
    }
}
