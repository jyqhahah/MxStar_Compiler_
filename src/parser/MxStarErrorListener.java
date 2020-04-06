package parser;

import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;
import utility.Location;
import utility.errorReminder;

public class MxStarErrorListener extends BaseErrorListener {
    private utility.errorReminder errorReminder;

    public MxStarErrorListener(errorReminder errorReminder){
        this.errorReminder = errorReminder;
    }

    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
        errorReminder.error(new Location(line, charPositionInLine), msg);
    }
}
