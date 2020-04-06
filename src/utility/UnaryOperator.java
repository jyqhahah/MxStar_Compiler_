package utility;

public enum UnaryOperator {
    POS(new String ("+")),
    NEG(new String ("-")),
    SUFFIXADD(new String ("++")),
    SUFFIXSUB(new String ("--")),
    BITWISENEG(new String ("~")),
    LOGICALNOT(new  String ("!")),
    PREFIXADD(new String ("++")),
    PREFIXSUB(new String ("--")),
    INVALID(new String (""))
    ;

    private String Un_Op;

    private UnaryOperator(String Un_Op){
        this.Un_Op = Un_Op;
    }

    public String toString(String Un_Op){
        return Un_Op;
    }
}
