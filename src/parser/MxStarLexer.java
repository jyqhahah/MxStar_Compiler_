// Generated from E:/Javaproject/MxStar_Compiler/src/parser\MxStar.g4 by ANTLR 4.8
package parser;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxStarLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, T__33=34, T__34=35, T__35=36, T__36=37, T__37=38, 
		T__38=39, T__39=40, T__40=41, T__41=42, T__42=43, T__43=44, T__44=45, 
		T__45=46, T__46=47, BoolLiteral=48, IntLiteral=49, StringLiteral=50, ESC=51, 
		Identifier=52, WS=53, NewLine=54, LineComment=55, BlockComment=56;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "T__8", 
			"T__9", "T__10", "T__11", "T__12", "T__13", "T__14", "T__15", "T__16", 
			"T__17", "T__18", "T__19", "T__20", "T__21", "T__22", "T__23", "T__24", 
			"T__25", "T__26", "T__27", "T__28", "T__29", "T__30", "T__31", "T__32", 
			"T__33", "T__34", "T__35", "T__36", "T__37", "T__38", "T__39", "T__40", 
			"T__41", "T__42", "T__43", "T__44", "T__45", "T__46", "BoolLiteral", 
			"IntLiteral", "StringLiteral", "ESC", "Identifier", "WS", "NewLine", 
			"LineComment", "BlockComment"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'class'", "'{'", "'}'", "';'", "'('", "')'", "','", "'='", "'['", 
			"']'", "'bool'", "'int'", "'string'", "'void'", "'if'", "'else'", "'for'", 
			"'while'", "'return'", "'break'", "'continue'", "'this'", "'new'", "'+'", 
			"'-'", "'.'", "'++'", "'--'", "'~'", "'!'", "'*'", "'/'", "'%'", "'<<'", 
			"'>>'", "'<'", "'>'", "'<='", "'>='", "'=='", "'!='", "'&'", "'^'", "'|'", 
			"'&&'", "'||'", "'null'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			null, null, null, null, null, null, null, null, null, null, null, null, 
			"BoolLiteral", "IntLiteral", "StringLiteral", "ESC", "Identifier", "WS", 
			"NewLine", "LineComment", "BlockComment"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public MxStarLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "MxStar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2:\u0163\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\3\2\3\2\3\2\3\2\3\2\3\2"+
		"\3\3\3\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13"+
		"\3\13\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16\3\16"+
		"\3\16\3\17\3\17\3\17\3\17\3\17\3\20\3\20\3\20\3\21\3\21\3\21\3\21\3\21"+
		"\3\22\3\22\3\22\3\22\3\23\3\23\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24"+
		"\3\24\3\24\3\24\3\25\3\25\3\25\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\26"+
		"\3\26\3\26\3\26\3\26\3\27\3\27\3\27\3\27\3\27\3\30\3\30\3\30\3\30\3\31"+
		"\3\31\3\32\3\32\3\33\3\33\3\34\3\34\3\34\3\35\3\35\3\35\3\36\3\36\3\37"+
		"\3\37\3 \3 \3!\3!\3\"\3\"\3#\3#\3#\3$\3$\3$\3%\3%\3&\3&\3\'\3\'\3\'\3"+
		"(\3(\3(\3)\3)\3)\3*\3*\3*\3+\3+\3,\3,\3-\3-\3.\3.\3.\3/\3/\3/\3\60\3\60"+
		"\3\60\3\60\3\60\3\61\3\61\3\61\3\61\3\61\3\61\3\61\3\61\3\61\5\61\u0118"+
		"\n\61\3\62\3\62\7\62\u011c\n\62\f\62\16\62\u011f\13\62\3\62\5\62\u0122"+
		"\n\62\3\63\3\63\3\63\7\63\u0127\n\63\f\63\16\63\u012a\13\63\3\63\3\63"+
		"\3\64\3\64\3\64\3\64\3\64\3\64\5\64\u0134\n\64\3\65\3\65\7\65\u0138\n"+
		"\65\f\65\16\65\u013b\13\65\3\66\6\66\u013e\n\66\r\66\16\66\u013f\3\66"+
		"\3\66\3\67\5\67\u0145\n\67\3\67\3\67\3\67\3\67\38\38\38\38\78\u014f\n"+
		"8\f8\168\u0152\138\38\38\39\39\39\39\79\u015a\n9\f9\169\u015d\139\39\3"+
		"9\39\39\39\4\u0128\u015b\2:\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25"+
		"\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32"+
		"\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a"+
		"\62c\63e\64g\65i\66k\67m8o9q:\3\2\b\3\2\63;\3\2\62;\4\2C\\c|\6\2\62;C"+
		"\\aac|\4\2\13\13\"\"\4\2\f\f\17\17\2\u016e\2\3\3\2\2\2\2\5\3\2\2\2\2\7"+
		"\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2"+
		"\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2"+
		"\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2"+
		"\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2"+
		"\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2"+
		"\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M"+
		"\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2"+
		"\2\2\2[\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2\2"+
		"\2g\3\2\2\2\2i\3\2\2\2\2k\3\2\2\2\2m\3\2\2\2\2o\3\2\2\2\2q\3\2\2\2\3s"+
		"\3\2\2\2\5y\3\2\2\2\7{\3\2\2\2\t}\3\2\2\2\13\177\3\2\2\2\r\u0081\3\2\2"+
		"\2\17\u0083\3\2\2\2\21\u0085\3\2\2\2\23\u0087\3\2\2\2\25\u0089\3\2\2\2"+
		"\27\u008b\3\2\2\2\31\u0090\3\2\2\2\33\u0094\3\2\2\2\35\u009b\3\2\2\2\37"+
		"\u00a0\3\2\2\2!\u00a3\3\2\2\2#\u00a8\3\2\2\2%\u00ac\3\2\2\2\'\u00b2\3"+
		"\2\2\2)\u00b9\3\2\2\2+\u00bf\3\2\2\2-\u00c8\3\2\2\2/\u00cd\3\2\2\2\61"+
		"\u00d1\3\2\2\2\63\u00d3\3\2\2\2\65\u00d5\3\2\2\2\67\u00d7\3\2\2\29\u00da"+
		"\3\2\2\2;\u00dd\3\2\2\2=\u00df\3\2\2\2?\u00e1\3\2\2\2A\u00e3\3\2\2\2C"+
		"\u00e5\3\2\2\2E\u00e7\3\2\2\2G\u00ea\3\2\2\2I\u00ed\3\2\2\2K\u00ef\3\2"+
		"\2\2M\u00f1\3\2\2\2O\u00f4\3\2\2\2Q\u00f7\3\2\2\2S\u00fa\3\2\2\2U\u00fd"+
		"\3\2\2\2W\u00ff\3\2\2\2Y\u0101\3\2\2\2[\u0103\3\2\2\2]\u0106\3\2\2\2_"+
		"\u0109\3\2\2\2a\u0117\3\2\2\2c\u0121\3\2\2\2e\u0123\3\2\2\2g\u0133\3\2"+
		"\2\2i\u0135\3\2\2\2k\u013d\3\2\2\2m\u0144\3\2\2\2o\u014a\3\2\2\2q\u0155"+
		"\3\2\2\2st\7e\2\2tu\7n\2\2uv\7c\2\2vw\7u\2\2wx\7u\2\2x\4\3\2\2\2yz\7}"+
		"\2\2z\6\3\2\2\2{|\7\177\2\2|\b\3\2\2\2}~\7=\2\2~\n\3\2\2\2\177\u0080\7"+
		"*\2\2\u0080\f\3\2\2\2\u0081\u0082\7+\2\2\u0082\16\3\2\2\2\u0083\u0084"+
		"\7.\2\2\u0084\20\3\2\2\2\u0085\u0086\7?\2\2\u0086\22\3\2\2\2\u0087\u0088"+
		"\7]\2\2\u0088\24\3\2\2\2\u0089\u008a\7_\2\2\u008a\26\3\2\2\2\u008b\u008c"+
		"\7d\2\2\u008c\u008d\7q\2\2\u008d\u008e\7q\2\2\u008e\u008f\7n\2\2\u008f"+
		"\30\3\2\2\2\u0090\u0091\7k\2\2\u0091\u0092\7p\2\2\u0092\u0093\7v\2\2\u0093"+
		"\32\3\2\2\2\u0094\u0095\7u\2\2\u0095\u0096\7v\2\2\u0096\u0097\7t\2\2\u0097"+
		"\u0098\7k\2\2\u0098\u0099\7p\2\2\u0099\u009a\7i\2\2\u009a\34\3\2\2\2\u009b"+
		"\u009c\7x\2\2\u009c\u009d\7q\2\2\u009d\u009e\7k\2\2\u009e\u009f\7f\2\2"+
		"\u009f\36\3\2\2\2\u00a0\u00a1\7k\2\2\u00a1\u00a2\7h\2\2\u00a2 \3\2\2\2"+
		"\u00a3\u00a4\7g\2\2\u00a4\u00a5\7n\2\2\u00a5\u00a6\7u\2\2\u00a6\u00a7"+
		"\7g\2\2\u00a7\"\3\2\2\2\u00a8\u00a9\7h\2\2\u00a9\u00aa\7q\2\2\u00aa\u00ab"+
		"\7t\2\2\u00ab$\3\2\2\2\u00ac\u00ad\7y\2\2\u00ad\u00ae\7j\2\2\u00ae\u00af"+
		"\7k\2\2\u00af\u00b0\7n\2\2\u00b0\u00b1\7g\2\2\u00b1&\3\2\2\2\u00b2\u00b3"+
		"\7t\2\2\u00b3\u00b4\7g\2\2\u00b4\u00b5\7v\2\2\u00b5\u00b6\7w\2\2\u00b6"+
		"\u00b7\7t\2\2\u00b7\u00b8\7p\2\2\u00b8(\3\2\2\2\u00b9\u00ba\7d\2\2\u00ba"+
		"\u00bb\7t\2\2\u00bb\u00bc\7g\2\2\u00bc\u00bd\7c\2\2\u00bd\u00be\7m\2\2"+
		"\u00be*\3\2\2\2\u00bf\u00c0\7e\2\2\u00c0\u00c1\7q\2\2\u00c1\u00c2\7p\2"+
		"\2\u00c2\u00c3\7v\2\2\u00c3\u00c4\7k\2\2\u00c4\u00c5\7p\2\2\u00c5\u00c6"+
		"\7w\2\2\u00c6\u00c7\7g\2\2\u00c7,\3\2\2\2\u00c8\u00c9\7v\2\2\u00c9\u00ca"+
		"\7j\2\2\u00ca\u00cb\7k\2\2\u00cb\u00cc\7u\2\2\u00cc.\3\2\2\2\u00cd\u00ce"+
		"\7p\2\2\u00ce\u00cf\7g\2\2\u00cf\u00d0\7y\2\2\u00d0\60\3\2\2\2\u00d1\u00d2"+
		"\7-\2\2\u00d2\62\3\2\2\2\u00d3\u00d4\7/\2\2\u00d4\64\3\2\2\2\u00d5\u00d6"+
		"\7\60\2\2\u00d6\66\3\2\2\2\u00d7\u00d8\7-\2\2\u00d8\u00d9\7-\2\2\u00d9"+
		"8\3\2\2\2\u00da\u00db\7/\2\2\u00db\u00dc\7/\2\2\u00dc:\3\2\2\2\u00dd\u00de"+
		"\7\u0080\2\2\u00de<\3\2\2\2\u00df\u00e0\7#\2\2\u00e0>\3\2\2\2\u00e1\u00e2"+
		"\7,\2\2\u00e2@\3\2\2\2\u00e3\u00e4\7\61\2\2\u00e4B\3\2\2\2\u00e5\u00e6"+
		"\7\'\2\2\u00e6D\3\2\2\2\u00e7\u00e8\7>\2\2\u00e8\u00e9\7>\2\2\u00e9F\3"+
		"\2\2\2\u00ea\u00eb\7@\2\2\u00eb\u00ec\7@\2\2\u00ecH\3\2\2\2\u00ed\u00ee"+
		"\7>\2\2\u00eeJ\3\2\2\2\u00ef\u00f0\7@\2\2\u00f0L\3\2\2\2\u00f1\u00f2\7"+
		">\2\2\u00f2\u00f3\7?\2\2\u00f3N\3\2\2\2\u00f4\u00f5\7@\2\2\u00f5\u00f6"+
		"\7?\2\2\u00f6P\3\2\2\2\u00f7\u00f8\7?\2\2\u00f8\u00f9\7?\2\2\u00f9R\3"+
		"\2\2\2\u00fa\u00fb\7#\2\2\u00fb\u00fc\7?\2\2\u00fcT\3\2\2\2\u00fd\u00fe"+
		"\7(\2\2\u00feV\3\2\2\2\u00ff\u0100\7`\2\2\u0100X\3\2\2\2\u0101\u0102\7"+
		"~\2\2\u0102Z\3\2\2\2\u0103\u0104\7(\2\2\u0104\u0105\7(\2\2\u0105\\\3\2"+
		"\2\2\u0106\u0107\7~\2\2\u0107\u0108\7~\2\2\u0108^\3\2\2\2\u0109\u010a"+
		"\7p\2\2\u010a\u010b\7w\2\2\u010b\u010c\7n\2\2\u010c\u010d\7n\2\2\u010d"+
		"`\3\2\2\2\u010e\u010f\7v\2\2\u010f\u0110\7t\2\2\u0110\u0111\7w\2\2\u0111"+
		"\u0118\7g\2\2\u0112\u0113\7h\2\2\u0113\u0114\7c\2\2\u0114\u0115\7n\2\2"+
		"\u0115\u0116\7u\2\2\u0116\u0118\7g\2\2\u0117\u010e\3\2\2\2\u0117\u0112"+
		"\3\2\2\2\u0118b\3\2\2\2\u0119\u011d\t\2\2\2\u011a\u011c\t\3\2\2\u011b"+
		"\u011a\3\2\2\2\u011c\u011f\3\2\2\2\u011d\u011b\3\2\2\2\u011d\u011e\3\2"+
		"\2\2\u011e\u0122\3\2\2\2\u011f\u011d\3\2\2\2\u0120\u0122\7\62\2\2\u0121"+
		"\u0119\3\2\2\2\u0121\u0120\3\2\2\2\u0122d\3\2\2\2\u0123\u0128\7$\2\2\u0124"+
		"\u0127\5g\64\2\u0125\u0127\13\2\2\2\u0126\u0124\3\2\2\2\u0126\u0125\3"+
		"\2\2\2\u0127\u012a\3\2\2\2\u0128\u0129\3\2\2\2\u0128\u0126\3\2\2\2\u0129"+
		"\u012b\3\2\2\2\u012a\u0128\3\2\2\2\u012b\u012c\7$\2\2\u012cf\3\2\2\2\u012d"+
		"\u012e\7^\2\2\u012e\u0134\7$\2\2\u012f\u0130\7^\2\2\u0130\u0134\7p\2\2"+
		"\u0131\u0132\7^\2\2\u0132\u0134\7^\2\2\u0133\u012d\3\2\2\2\u0133\u012f"+
		"\3\2\2\2\u0133\u0131\3\2\2\2\u0134h\3\2\2\2\u0135\u0139\t\4\2\2\u0136"+
		"\u0138\t\5\2\2\u0137\u0136\3\2\2\2\u0138\u013b\3\2\2\2\u0139\u0137\3\2"+
		"\2\2\u0139\u013a\3\2\2\2\u013aj\3\2\2\2\u013b\u0139\3\2\2\2\u013c\u013e"+
		"\t\6\2\2\u013d\u013c\3\2\2\2\u013e\u013f\3\2\2\2\u013f\u013d\3\2\2\2\u013f"+
		"\u0140\3\2\2\2\u0140\u0141\3\2\2\2\u0141\u0142\b\66\2\2\u0142l\3\2\2\2"+
		"\u0143\u0145\7\17\2\2\u0144\u0143\3\2\2\2\u0144\u0145\3\2\2\2\u0145\u0146"+
		"\3\2\2\2\u0146\u0147\7\f\2\2\u0147\u0148\3\2\2\2\u0148\u0149\b\67\2\2"+
		"\u0149n\3\2\2\2\u014a\u014b\7\61\2\2\u014b\u014c\7\61\2\2\u014c\u0150"+
		"\3\2\2\2\u014d\u014f\n\7\2\2\u014e\u014d\3\2\2\2\u014f\u0152\3\2\2\2\u0150"+
		"\u014e\3\2\2\2\u0150\u0151\3\2\2\2\u0151\u0153\3\2\2\2\u0152\u0150\3\2"+
		"\2\2\u0153\u0154\b8\2\2\u0154p\3\2\2\2\u0155\u0156\7\61\2\2\u0156\u0157"+
		"\7,\2\2\u0157\u015b\3\2\2\2\u0158\u015a\13\2\2\2\u0159\u0158\3\2\2\2\u015a"+
		"\u015d\3\2\2\2\u015b\u015c\3\2\2\2\u015b\u0159\3\2\2\2\u015c\u015e\3\2"+
		"\2\2\u015d\u015b\3\2\2\2\u015e\u015f\7,\2\2\u015f\u0160\7\61\2\2\u0160"+
		"\u0161\3\2\2\2\u0161\u0162\b9\2\2\u0162r\3\2\2\2\16\2\u0117\u011d\u0121"+
		"\u0126\u0128\u0133\u0139\u013f\u0144\u0150\u015b\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}