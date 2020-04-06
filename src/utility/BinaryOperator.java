package utility;

public enum BinaryOperator {
    MUL(new String ("*")),
    DIV(new String ("/")),
    ADD(new String ("+")),
    SUB(new String ("-")),
    MOD(new String ("%")),
    BITWISEOR(new String ("|")),
    BITWISEXOR(new String ("^")),
    BITWISEAND(new String ("&")),
    LOGICALOR(new String ("||")),
    LOGICALAND(new String ("&&")),
    EQ(new String("==")),
    NEQ(new String ("!=")),
    LEQ(new String ("<=")),
    GEQ(new String (">=")),
    GREATER(new String (">")),
    LESS(new String ("<")),
    LEFTSHIFT(new String ("<<")),
    RIGHTSHIFT(new String (">>")),
    ASSIGN(new String ("=")),
    INVALID(new String(""))
    ;


    private String Bi_Op;

    BinaryOperator(String Bi_Op) {
        this.Bi_Op = Bi_Op;
    }

    public String toString() {
        return Bi_Op;
    }
}
