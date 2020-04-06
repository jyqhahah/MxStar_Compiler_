// Generated from E:/Javaproject/MxStar_Compiler/src/parser\MxStar.g4 by ANTLR 4.8
package parser;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxStarParser extends Parser {
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
	public static final int
		RULE_program = 0, RULE_def = 1, RULE_classdef = 2, RULE_funcdef = 3, RULE_vardefList = 4, 
		RULE_vardef = 5, RULE_paraList = 6, RULE_para = 7, RULE_consdef = 8, RULE_type = 9, 
		RULE_arrayType = 10, RULE_varType = 11, RULE_primType = 12, RULE_block = 13, 
		RULE_stat = 14, RULE_expr = 15, RULE_exprList = 16, RULE_new_creator = 17, 
		RULE_literal = 18;
	private static String[] makeRuleNames() {
		return new String[] {
			"program", "def", "classdef", "funcdef", "vardefList", "vardef", "paraList", 
			"para", "consdef", "type", "arrayType", "varType", "primType", "block", 
			"stat", "expr", "exprList", "new_creator", "literal"
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

	@Override
	public String getGrammarFileName() { return "MxStar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MxStarParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(MxStarParser.EOF, 0); }
		public List<DefContext> def() {
			return getRuleContexts(DefContext.class);
		}
		public DefContext def(int i) {
			return getRuleContext(DefContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitProgram(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(41);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << Identifier))) != 0)) {
				{
				{
				setState(38);
				def();
				}
				}
				setState(43);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(44);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DefContext extends ParserRuleContext {
		public VardefListContext vardefList() {
			return getRuleContext(VardefListContext.class,0);
		}
		public FuncdefContext funcdef() {
			return getRuleContext(FuncdefContext.class,0);
		}
		public ClassdefContext classdef() {
			return getRuleContext(ClassdefContext.class,0);
		}
		public DefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_def; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterDef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitDef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitDef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefContext def() throws RecognitionException {
		DefContext _localctx = new DefContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_def);
		try {
			setState(49);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(46);
				vardefList();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(47);
				funcdef();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(48);
				classdef();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassdefContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public List<VardefListContext> vardefList() {
			return getRuleContexts(VardefListContext.class);
		}
		public VardefListContext vardefList(int i) {
			return getRuleContext(VardefListContext.class,i);
		}
		public List<FuncdefContext> funcdef() {
			return getRuleContexts(FuncdefContext.class);
		}
		public FuncdefContext funcdef(int i) {
			return getRuleContext(FuncdefContext.class,i);
		}
		public List<ConsdefContext> consdef() {
			return getRuleContexts(ConsdefContext.class);
		}
		public ConsdefContext consdef(int i) {
			return getRuleContext(ConsdefContext.class,i);
		}
		public ClassdefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classdef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterClassdef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitClassdef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitClassdef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassdefContext classdef() throws RecognitionException {
		ClassdefContext _localctx = new ClassdefContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_classdef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(51);
			match(T__0);
			setState(52);
			match(Identifier);
			setState(53);
			match(T__1);
			setState(59);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << Identifier))) != 0)) {
				{
				setState(57);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
				case 1:
					{
					setState(54);
					vardefList();
					}
					break;
				case 2:
					{
					setState(55);
					funcdef();
					}
					break;
				case 3:
					{
					setState(56);
					consdef();
					}
					break;
				}
				}
				setState(61);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(62);
			match(T__2);
			setState(63);
			match(T__3);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FuncdefContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public ParaListContext paraList() {
			return getRuleContext(ParaListContext.class,0);
		}
		public List<StatContext> stat() {
			return getRuleContexts(StatContext.class);
		}
		public StatContext stat(int i) {
			return getRuleContext(StatContext.class,i);
		}
		public FuncdefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_funcdef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterFuncdef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitFuncdef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitFuncdef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FuncdefContext funcdef() throws RecognitionException {
		FuncdefContext _localctx = new FuncdefContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_funcdef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(65);
			type();
			setState(66);
			match(Identifier);
			setState(67);
			match(T__4);
			setState(68);
			paraList();
			setState(69);
			match(T__5);
			setState(70);
			match(T__1);
			setState(74);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << T__4) | (1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__16) | (1L << T__17) | (1L << T__18) | (1L << T__19) | (1L << T__20) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
				{
				{
				setState(71);
				stat();
				}
				}
				setState(76);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(77);
			match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VardefListContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public List<VardefContext> vardef() {
			return getRuleContexts(VardefContext.class);
		}
		public VardefContext vardef(int i) {
			return getRuleContext(VardefContext.class,i);
		}
		public VardefListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_vardefList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVardefList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVardefList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVardefList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VardefListContext vardefList() throws RecognitionException {
		VardefListContext _localctx = new VardefListContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_vardefList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(79);
			type();
			setState(80);
			vardef();
			setState(85);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(81);
				match(T__6);
				setState(82);
				vardef();
				}
				}
				setState(87);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(88);
			match(T__3);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VardefContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public VardefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_vardef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVardef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVardef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVardef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VardefContext vardef() throws RecognitionException {
		VardefContext _localctx = new VardefContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_vardef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(90);
			match(Identifier);
			setState(93);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(91);
				match(T__7);
				setState(92);
				expr(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParaListContext extends ParserRuleContext {
		public List<ParaContext> para() {
			return getRuleContexts(ParaContext.class);
		}
		public ParaContext para(int i) {
			return getRuleContext(ParaContext.class,i);
		}
		public ParaListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_paraList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterParaList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitParaList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitParaList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParaListContext paraList() throws RecognitionException {
		ParaListContext _localctx = new ParaListContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_paraList);
		int _la;
		try {
			setState(104);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__5:
				enterOuterAlt(_localctx, 1);
				{
				}
				break;
			case T__10:
			case T__11:
			case T__12:
			case T__13:
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(96);
				para();
				setState(101);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__6) {
					{
					{
					setState(97);
					match(T__6);
					setState(98);
					para();
					}
					}
					setState(103);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParaContext extends ParserRuleContext {
		public TypeContext type() {
			return getRuleContext(TypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ParaContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_para; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterPara(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitPara(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitPara(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParaContext para() throws RecognitionException {
		ParaContext _localctx = new ParaContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_para);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(106);
			type();
			setState(107);
			match(Identifier);
			setState(110);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__7) {
				{
				setState(108);
				match(T__7);
				setState(109);
				expr(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConsdefContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public List<StatContext> stat() {
			return getRuleContexts(StatContext.class);
		}
		public StatContext stat(int i) {
			return getRuleContext(StatContext.class,i);
		}
		public ConsdefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_consdef; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterConsdef(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitConsdef(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitConsdef(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ConsdefContext consdef() throws RecognitionException {
		ConsdefContext _localctx = new ConsdefContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_consdef);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(112);
			match(Identifier);
			setState(113);
			match(T__4);
			setState(114);
			match(T__5);
			setState(115);
			match(T__1);
			setState(119);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << T__4) | (1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__16) | (1L << T__17) | (1L << T__18) | (1L << T__19) | (1L << T__20) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
				{
				{
				setState(116);
				stat();
				}
				}
				setState(121);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(122);
			match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TypeContext extends ParserRuleContext {
		public VarTypeContext varType() {
			return getRuleContext(VarTypeContext.class,0);
		}
		public ArrayTypeContext arrayType() {
			return getRuleContext(ArrayTypeContext.class,0);
		}
		public TypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_type; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final TypeContext type() throws RecognitionException {
		TypeContext _localctx = new TypeContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_type);
		try {
			setState(126);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,11,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(124);
				varType();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(125);
				arrayType();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArrayTypeContext extends ParserRuleContext {
		public VarTypeContext varType() {
			return getRuleContext(VarTypeContext.class,0);
		}
		public ArrayTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_arrayType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterArrayType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitArrayType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitArrayType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ArrayTypeContext arrayType() throws RecognitionException {
		ArrayTypeContext _localctx = new ArrayTypeContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_arrayType);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(128);
			varType();
			setState(131); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(129);
				match(T__8);
				setState(130);
				match(T__9);
				}
				}
				setState(133); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==T__8 );
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VarTypeContext extends ParserRuleContext {
		public PrimTypeContext primType() {
			return getRuleContext(PrimTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public VarTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_varType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVarType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVarType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVarType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VarTypeContext varType() throws RecognitionException {
		VarTypeContext _localctx = new VarTypeContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_varType);
		try {
			setState(137);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case T__10:
			case T__11:
			case T__12:
			case T__13:
				enterOuterAlt(_localctx, 1);
				{
				setState(135);
				primType();
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(136);
				match(Identifier);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class PrimTypeContext extends ParserRuleContext {
		public PrimTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_primType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterPrimType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitPrimType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitPrimType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final PrimTypeContext primType() throws RecognitionException {
		PrimTypeContext _localctx = new PrimTypeContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_primType);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(139);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public List<StatContext> stat() {
			return getRuleContexts(StatContext.class);
		}
		public StatContext stat(int i) {
			return getRuleContext(StatContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBlock(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBlock(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBlock(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(141);
			match(T__1);
			setState(145);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__1) | (1L << T__3) | (1L << T__4) | (1L << T__10) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__16) | (1L << T__17) | (1L << T__18) | (1L << T__19) | (1L << T__20) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
				{
				{
				setState(142);
				stat();
				}
				}
				setState(147);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(148);
			match(T__2);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatContext extends ParserRuleContext {
		public StatContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_stat; }
	 
		public StatContext() { }
		public void copyFrom(StatContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class IfStatContext extends StatContext {
		public List<StatContext> stat() {
			return getRuleContexts(StatContext.class);
		}
		public StatContext stat(int i) {
			return getRuleContext(StatContext.class,i);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public IfStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterIfStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitIfStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitIfStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BlockStatContext extends StatContext {
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public BlockStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBlockStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBlockStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBlockStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ExprStatContext extends StatContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ExprStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterExprStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitExprStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitExprStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BlankStatContext extends StatContext {
		public BlankStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBlankStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBlankStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBlankStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ReturnStatContext extends StatContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ReturnStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterReturnStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitReturnStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitReturnStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ContinueStatContext extends StatContext {
		public ContinueStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterContinueStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitContinueStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitContinueStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class BreakStatContext extends StatContext {
		public BreakStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBreakStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBreakStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBreakStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class VardefListStatContext extends StatContext {
		public VardefListContext vardefList() {
			return getRuleContext(VardefListContext.class,0);
		}
		public VardefListStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVardefListStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVardefListStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVardefListStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class ForStatContext extends StatContext {
		public ExprContext init;
		public ExprContext cond;
		public ExprContext step;
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ForStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterForStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitForStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitForStat(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class WhileStatContext extends StatContext {
		public StatContext stat() {
			return getRuleContext(StatContext.class,0);
		}
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public WhileStatContext(StatContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterWhileStat(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitWhileStat(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitWhileStat(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatContext stat() throws RecognitionException {
		StatContext _localctx = new StatContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_stat);
		int _la;
		try {
			setState(198);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,22,_ctx) ) {
			case 1:
				_localctx = new BlockStatContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(150);
				block();
				}
				break;
			case 2:
				_localctx = new VardefListStatContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(151);
				vardefList();
				}
				break;
			case 3:
				_localctx = new IfStatContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(152);
				match(T__14);
				setState(153);
				match(T__4);
				setState(155);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
					{
					setState(154);
					expr(0);
					}
				}

				setState(157);
				match(T__5);
				setState(158);
				stat();
				setState(161);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
				case 1:
					{
					setState(159);
					match(T__15);
					setState(160);
					stat();
					}
					break;
				}
				}
				break;
			case 4:
				_localctx = new ForStatContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(163);
				match(T__16);
				setState(164);
				match(T__4);
				setState(166);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
					{
					setState(165);
					((ForStatContext)_localctx).init = expr(0);
					}
				}

				setState(168);
				match(T__3);
				setState(170);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
					{
					setState(169);
					((ForStatContext)_localctx).cond = expr(0);
					}
				}

				setState(172);
				match(T__3);
				setState(174);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
					{
					setState(173);
					((ForStatContext)_localctx).step = expr(0);
					}
				}

				setState(176);
				match(T__5);
				setState(177);
				stat();
				}
				break;
			case 5:
				_localctx = new WhileStatContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(178);
				match(T__17);
				setState(179);
				match(T__4);
				setState(181);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
					{
					setState(180);
					expr(0);
					}
				}

				setState(183);
				match(T__5);
				setState(184);
				stat();
				}
				break;
			case 6:
				_localctx = new ReturnStatContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(185);
				match(T__18);
				setState(187);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
					{
					setState(186);
					expr(0);
					}
				}

				setState(189);
				match(T__3);
				}
				break;
			case 7:
				_localctx = new BreakStatContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(190);
				match(T__19);
				setState(191);
				match(T__3);
				}
				break;
			case 8:
				_localctx = new ContinueStatContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(192);
				match(T__20);
				setState(193);
				match(T__3);
				}
				break;
			case 9:
				_localctx = new ExprStatContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(194);
				expr(0);
				setState(195);
				match(T__3);
				}
				break;
			case 10:
				_localctx = new BlankStatContext(_localctx);
				enterOuterAlt(_localctx, 10);
				{
				setState(197);
				match(T__3);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprContext extends ParserRuleContext {
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
	 
		public ExprContext() { }
		public void copyFrom(ExprContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class Sub_exprContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Sub_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterSub_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitSub_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitSub_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Member_exprContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public Member_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterMember_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitMember_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitMember_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Binary_exprContext extends ExprContext {
		public Token op;
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Binary_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterBinary_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitBinary_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitBinary_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Index_exprContext extends ExprContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Index_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterIndex_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitIndex_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitIndex_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class This_exprContext extends ExprContext {
		public This_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterThis_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitThis_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitThis_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Id_exprContext extends ExprContext {
		public TerminalNode Identifier() { return getToken(MxStarParser.Identifier, 0); }
		public Id_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterId_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitId_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitId_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Postfix_exprContext extends ExprContext {
		public Token op;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Postfix_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterPostfix_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitPostfix_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitPostfix_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Creator_exprContext extends ExprContext {
		public New_creatorContext new_creator() {
			return getRuleContext(New_creatorContext.class,0);
		}
		public Creator_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterCreator_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitCreator_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitCreator_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Prefix_exprContext extends ExprContext {
		public Token op;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Prefix_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterPrefix_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitPrefix_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitPrefix_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Method_exprContext extends ExprContext {
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public ExprListContext exprList() {
			return getRuleContext(ExprListContext.class,0);
		}
		public Method_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterMethod_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitMethod_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitMethod_expr(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Liter_exprContext extends ExprContext {
		public LiteralContext literal() {
			return getRuleContext(LiteralContext.class,0);
		}
		public Liter_exprContext(ExprContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterLiter_expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitLiter_expr(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitLiter_expr(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 30;
		enterRecursionRule(_localctx, 30, RULE_expr, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(218);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,23,_ctx) ) {
			case 1:
				{
				_localctx = new Sub_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(201);
				match(T__4);
				setState(202);
				expr(0);
				setState(203);
				match(T__5);
				}
				break;
			case 2:
				{
				_localctx = new This_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(205);
				match(T__21);
				}
				break;
			case 3:
				{
				_localctx = new Liter_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(206);
				literal();
				}
				break;
			case 4:
				{
				_localctx = new Id_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(207);
				match(Identifier);
				}
				break;
			case 5:
				{
				_localctx = new Creator_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(208);
				match(T__22);
				setState(209);
				new_creator();
				}
				break;
			case 6:
				{
				_localctx = new Prefix_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(210);
				((Prefix_exprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__23 || _la==T__24) ) {
					((Prefix_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(211);
				expr(19);
				}
				break;
			case 7:
				{
				_localctx = new Prefix_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(212);
				((Prefix_exprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__23 || _la==T__24) ) {
					((Prefix_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(213);
				expr(14);
				}
				break;
			case 8:
				{
				_localctx = new Prefix_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(214);
				((Prefix_exprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__26 || _la==T__27) ) {
					((Prefix_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(215);
				expr(13);
				}
				break;
			case 9:
				{
				_localctx = new Prefix_exprContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(216);
				((Prefix_exprContext)_localctx).op = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==T__28 || _la==T__29) ) {
					((Prefix_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(217);
				expr(12);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(271);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(269);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,25,_ctx) ) {
					case 1:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(220);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(221);
						((Binary_exprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__30) | (1L << T__31) | (1L << T__32))) != 0)) ) {
							((Binary_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(222);
						expr(12);
						}
						break;
					case 2:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(223);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(224);
						((Binary_exprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__23 || _la==T__24) ) {
							((Binary_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(225);
						expr(11);
						}
						break;
					case 3:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(226);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(227);
						((Binary_exprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__33 || _la==T__34) ) {
							((Binary_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(228);
						expr(10);
						}
						break;
					case 4:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(229);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(230);
						((Binary_exprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__35) | (1L << T__36) | (1L << T__37) | (1L << T__38))) != 0)) ) {
							((Binary_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(231);
						expr(9);
						}
						break;
					case 5:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(232);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(233);
						((Binary_exprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__39 || _la==T__40) ) {
							((Binary_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(234);
						expr(8);
						}
						break;
					case 6:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(235);
						if (!(precpred(_ctx, 6))) throw new FailedPredicateException(this, "precpred(_ctx, 6)");
						setState(236);
						((Binary_exprContext)_localctx).op = match(T__41);
						setState(237);
						expr(7);
						}
						break;
					case 7:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(238);
						if (!(precpred(_ctx, 5))) throw new FailedPredicateException(this, "precpred(_ctx, 5)");
						setState(239);
						((Binary_exprContext)_localctx).op = match(T__42);
						setState(240);
						expr(6);
						}
						break;
					case 8:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(241);
						if (!(precpred(_ctx, 4))) throw new FailedPredicateException(this, "precpred(_ctx, 4)");
						setState(242);
						((Binary_exprContext)_localctx).op = match(T__43);
						setState(243);
						expr(5);
						}
						break;
					case 9:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(244);
						if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
						setState(245);
						((Binary_exprContext)_localctx).op = match(T__44);
						setState(246);
						expr(4);
						}
						break;
					case 10:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(247);
						if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
						setState(248);
						((Binary_exprContext)_localctx).op = match(T__45);
						setState(249);
						expr(3);
						}
						break;
					case 11:
						{
						_localctx = new Binary_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(250);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(251);
						((Binary_exprContext)_localctx).op = match(T__7);
						setState(252);
						expr(1);
						}
						break;
					case 12:
						{
						_localctx = new Member_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(253);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(254);
						match(T__25);
						setState(255);
						match(Identifier);
						}
						break;
					case 13:
						{
						_localctx = new Index_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(256);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(257);
						match(T__8);
						setState(258);
						expr(0);
						setState(259);
						match(T__9);
						}
						break;
					case 14:
						{
						_localctx = new Method_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(261);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(262);
						match(T__4);
						setState(264);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__4) | (1L << T__21) | (1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__26) | (1L << T__27) | (1L << T__28) | (1L << T__29) | (1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral) | (1L << Identifier))) != 0)) {
							{
							setState(263);
							exprList();
							}
						}

						setState(266);
						match(T__5);
						}
						break;
					case 15:
						{
						_localctx = new Postfix_exprContext(new ExprContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expr);
						setState(267);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(268);
						((Postfix_exprContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==T__26 || _la==T__27) ) {
							((Postfix_exprContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					}
					} 
				}
				setState(273);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class ExprListContext extends ParserRuleContext {
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public ExprListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_exprList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterExprList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitExprList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitExprList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExprListContext exprList() throws RecognitionException {
		ExprListContext _localctx = new ExprListContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_exprList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			{
			setState(274);
			expr(0);
			setState(279);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__6) {
				{
				{
				setState(275);
				match(T__6);
				setState(276);
				expr(0);
				}
				}
				setState(281);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class New_creatorContext extends ParserRuleContext {
		public New_creatorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_new_creator; }
	 
		public New_creatorContext() { }
		public void copyFrom(New_creatorContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class Array_creatorContext extends New_creatorContext {
		public VarTypeContext varType() {
			return getRuleContext(VarTypeContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Array_creatorContext(New_creatorContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterArray_creator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitArray_creator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitArray_creator(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Wrong_creatorContext extends New_creatorContext {
		public VarTypeContext varType() {
			return getRuleContext(VarTypeContext.class,0);
		}
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public Wrong_creatorContext(New_creatorContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterWrong_creator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitWrong_creator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitWrong_creator(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class VarType_creatorContext extends New_creatorContext {
		public VarTypeContext varType() {
			return getRuleContext(VarTypeContext.class,0);
		}
		public VarType_creatorContext(New_creatorContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterVarType_creator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitVarType_creator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitVarType_creator(this);
			else return visitor.visitChildren(this);
		}
	}
	public static class Class_creatorContext extends New_creatorContext {
		public VarTypeContext varType() {
			return getRuleContext(VarTypeContext.class,0);
		}
		public Class_creatorContext(New_creatorContext ctx) { copyFrom(ctx); }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterClass_creator(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitClass_creator(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitClass_creator(this);
			else return visitor.visitChildren(this);
		}
	}

	public final New_creatorContext new_creator() throws RecognitionException {
		New_creatorContext _localctx = new New_creatorContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_new_creator);
		try {
			int _alt;
			setState(339);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,36,_ctx) ) {
			case 1:
				_localctx = new Wrong_creatorContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(282);
				varType();
				setState(316);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,33,_ctx) ) {
				case 1:
					{
					setState(285); 
					_errHandler.sync(this);
					_alt = 1;
					do {
						switch (_alt) {
						case 1:
							{
							{
							setState(283);
							match(T__8);
							setState(284);
							match(T__9);
							}
							}
							break;
						default:
							throw new NoViableAltException(this);
						}
						setState(287); 
						_errHandler.sync(this);
						_alt = getInterpreter().adaptivePredict(_input,28,_ctx);
					} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
					}
					break;
				case 2:
					{
					{
					setState(297);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,30,_ctx);
					while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
						if ( _alt==1 ) {
							{
							setState(295);
							_errHandler.sync(this);
							switch ( getInterpreter().adaptivePredict(_input,29,_ctx) ) {
							case 1:
								{
								{
								setState(289);
								match(T__8);
								setState(290);
								match(T__9);
								}
								}
								break;
							case 2:
								{
								{
								setState(291);
								match(T__8);
								setState(292);
								expr(0);
								setState(293);
								match(T__9);
								}
								}
								break;
							}
							} 
						}
						setState(299);
						_errHandler.sync(this);
						_alt = getInterpreter().adaptivePredict(_input,30,_ctx);
					}
					setState(300);
					match(T__8);
					setState(301);
					match(T__9);
					setState(302);
					match(T__8);
					setState(303);
					expr(0);
					setState(304);
					match(T__9);
					setState(313);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
					while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
						if ( _alt==1 ) {
							{
							setState(311);
							_errHandler.sync(this);
							switch ( getInterpreter().adaptivePredict(_input,31,_ctx) ) {
							case 1:
								{
								{
								setState(305);
								match(T__8);
								setState(306);
								match(T__9);
								}
								}
								break;
							case 2:
								{
								{
								setState(307);
								match(T__8);
								setState(308);
								expr(0);
								setState(309);
								match(T__9);
								}
								}
								break;
							}
							} 
						}
						setState(315);
						_errHandler.sync(this);
						_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
					}
					}
					}
					break;
				}
				}
				break;
			case 2:
				_localctx = new Array_creatorContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(318);
				varType();
				setState(323); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(319);
						match(T__8);
						setState(320);
						expr(0);
						setState(321);
						match(T__9);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(325); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,34,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(331);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,35,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(327);
						match(T__8);
						setState(328);
						match(T__9);
						}
						} 
					}
					setState(333);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,35,_ctx);
				}
				}
				break;
			case 3:
				_localctx = new Class_creatorContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(334);
				varType();
				setState(335);
				match(T__4);
				setState(336);
				match(T__5);
				}
				break;
			case 4:
				_localctx = new VarType_creatorContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(338);
				varType();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class LiteralContext extends ParserRuleContext {
		public TerminalNode BoolLiteral() { return getToken(MxStarParser.BoolLiteral, 0); }
		public TerminalNode IntLiteral() { return getToken(MxStarParser.IntLiteral, 0); }
		public TerminalNode StringLiteral() { return getToken(MxStarParser.StringLiteral, 0); }
		public LiteralContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_literal; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).enterLiteral(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxStarListener ) ((MxStarListener)listener).exitLiteral(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxStarVisitor ) return ((MxStarVisitor<? extends T>)visitor).visitLiteral(this);
			else return visitor.visitChildren(this);
		}
	}

	public final LiteralContext literal() throws RecognitionException {
		LiteralContext _localctx = new LiteralContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_literal);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(341);
			_la = _input.LA(1);
			if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__46) | (1L << BoolLiteral) | (1L << IntLiteral) | (1L << StringLiteral))) != 0)) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 15:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 11);
		case 1:
			return precpred(_ctx, 10);
		case 2:
			return precpred(_ctx, 9);
		case 3:
			return precpred(_ctx, 8);
		case 4:
			return precpred(_ctx, 7);
		case 5:
			return precpred(_ctx, 6);
		case 6:
			return precpred(_ctx, 5);
		case 7:
			return precpred(_ctx, 4);
		case 8:
			return precpred(_ctx, 3);
		case 9:
			return precpred(_ctx, 2);
		case 10:
			return precpred(_ctx, 1);
		case 11:
			return precpred(_ctx, 18);
		case 12:
			return precpred(_ctx, 17);
		case 13:
			return precpred(_ctx, 16);
		case 14:
			return precpred(_ctx, 15);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3:\u015a\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\3\2\7\2*\n\2\f\2\16\2-\13\2\3\2\3\2\3\3\3\3\3\3\5"+
		"\3\64\n\3\3\4\3\4\3\4\3\4\3\4\3\4\7\4<\n\4\f\4\16\4?\13\4\3\4\3\4\3\4"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\7\5K\n\5\f\5\16\5N\13\5\3\5\3\5\3\6\3\6\3"+
		"\6\3\6\7\6V\n\6\f\6\16\6Y\13\6\3\6\3\6\3\7\3\7\3\7\5\7`\n\7\3\b\3\b\3"+
		"\b\3\b\7\bf\n\b\f\b\16\bi\13\b\5\bk\n\b\3\t\3\t\3\t\3\t\5\tq\n\t\3\n\3"+
		"\n\3\n\3\n\3\n\7\nx\n\n\f\n\16\n{\13\n\3\n\3\n\3\13\3\13\5\13\u0081\n"+
		"\13\3\f\3\f\3\f\6\f\u0086\n\f\r\f\16\f\u0087\3\r\3\r\5\r\u008c\n\r\3\16"+
		"\3\16\3\17\3\17\7\17\u0092\n\17\f\17\16\17\u0095\13\17\3\17\3\17\3\20"+
		"\3\20\3\20\3\20\3\20\5\20\u009e\n\20\3\20\3\20\3\20\3\20\5\20\u00a4\n"+
		"\20\3\20\3\20\3\20\5\20\u00a9\n\20\3\20\3\20\5\20\u00ad\n\20\3\20\3\20"+
		"\5\20\u00b1\n\20\3\20\3\20\3\20\3\20\3\20\5\20\u00b8\n\20\3\20\3\20\3"+
		"\20\3\20\5\20\u00be\n\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\5\20\u00c9\n\20\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21"+
		"\3\21\3\21\3\21\3\21\3\21\3\21\3\21\5\21\u00dd\n\21\3\21\3\21\3\21\3\21"+
		"\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21"+
		"\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21"+
		"\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\5\21\u010b"+
		"\n\21\3\21\3\21\3\21\7\21\u0110\n\21\f\21\16\21\u0113\13\21\3\22\3\22"+
		"\3\22\7\22\u0118\n\22\f\22\16\22\u011b\13\22\3\23\3\23\3\23\6\23\u0120"+
		"\n\23\r\23\16\23\u0121\3\23\3\23\3\23\3\23\3\23\3\23\7\23\u012a\n\23\f"+
		"\23\16\23\u012d\13\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23"+
		"\3\23\7\23\u013a\n\23\f\23\16\23\u013d\13\23\5\23\u013f\n\23\3\23\3\23"+
		"\3\23\3\23\3\23\6\23\u0146\n\23\r\23\16\23\u0147\3\23\3\23\7\23\u014c"+
		"\n\23\f\23\16\23\u014f\13\23\3\23\3\23\3\23\3\23\3\23\5\23\u0156\n\23"+
		"\3\24\3\24\3\24\2\3 \25\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"$&\2"+
		"\13\3\2\r\20\3\2\32\33\3\2\35\36\3\2\37 \3\2!#\3\2$%\3\2&)\3\2*+\3\2\61"+
		"\64\2\u018b\2+\3\2\2\2\4\63\3\2\2\2\6\65\3\2\2\2\bC\3\2\2\2\nQ\3\2\2\2"+
		"\f\\\3\2\2\2\16j\3\2\2\2\20l\3\2\2\2\22r\3\2\2\2\24\u0080\3\2\2\2\26\u0082"+
		"\3\2\2\2\30\u008b\3\2\2\2\32\u008d\3\2\2\2\34\u008f\3\2\2\2\36\u00c8\3"+
		"\2\2\2 \u00dc\3\2\2\2\"\u0114\3\2\2\2$\u0155\3\2\2\2&\u0157\3\2\2\2(*"+
		"\5\4\3\2)(\3\2\2\2*-\3\2\2\2+)\3\2\2\2+,\3\2\2\2,.\3\2\2\2-+\3\2\2\2."+
		"/\7\2\2\3/\3\3\2\2\2\60\64\5\n\6\2\61\64\5\b\5\2\62\64\5\6\4\2\63\60\3"+
		"\2\2\2\63\61\3\2\2\2\63\62\3\2\2\2\64\5\3\2\2\2\65\66\7\3\2\2\66\67\7"+
		"\66\2\2\67=\7\4\2\28<\5\n\6\29<\5\b\5\2:<\5\22\n\2;8\3\2\2\2;9\3\2\2\2"+
		";:\3\2\2\2<?\3\2\2\2=;\3\2\2\2=>\3\2\2\2>@\3\2\2\2?=\3\2\2\2@A\7\5\2\2"+
		"AB\7\6\2\2B\7\3\2\2\2CD\5\24\13\2DE\7\66\2\2EF\7\7\2\2FG\5\16\b\2GH\7"+
		"\b\2\2HL\7\4\2\2IK\5\36\20\2JI\3\2\2\2KN\3\2\2\2LJ\3\2\2\2LM\3\2\2\2M"+
		"O\3\2\2\2NL\3\2\2\2OP\7\5\2\2P\t\3\2\2\2QR\5\24\13\2RW\5\f\7\2ST\7\t\2"+
		"\2TV\5\f\7\2US\3\2\2\2VY\3\2\2\2WU\3\2\2\2WX\3\2\2\2XZ\3\2\2\2YW\3\2\2"+
		"\2Z[\7\6\2\2[\13\3\2\2\2\\_\7\66\2\2]^\7\n\2\2^`\5 \21\2_]\3\2\2\2_`\3"+
		"\2\2\2`\r\3\2\2\2ak\3\2\2\2bg\5\20\t\2cd\7\t\2\2df\5\20\t\2ec\3\2\2\2"+
		"fi\3\2\2\2ge\3\2\2\2gh\3\2\2\2hk\3\2\2\2ig\3\2\2\2ja\3\2\2\2jb\3\2\2\2"+
		"k\17\3\2\2\2lm\5\24\13\2mp\7\66\2\2no\7\n\2\2oq\5 \21\2pn\3\2\2\2pq\3"+
		"\2\2\2q\21\3\2\2\2rs\7\66\2\2st\7\7\2\2tu\7\b\2\2uy\7\4\2\2vx\5\36\20"+
		"\2wv\3\2\2\2x{\3\2\2\2yw\3\2\2\2yz\3\2\2\2z|\3\2\2\2{y\3\2\2\2|}\7\5\2"+
		"\2}\23\3\2\2\2~\u0081\5\30\r\2\177\u0081\5\26\f\2\u0080~\3\2\2\2\u0080"+
		"\177\3\2\2\2\u0081\25\3\2\2\2\u0082\u0085\5\30\r\2\u0083\u0084\7\13\2"+
		"\2\u0084\u0086\7\f\2\2\u0085\u0083\3\2\2\2\u0086\u0087\3\2\2\2\u0087\u0085"+
		"\3\2\2\2\u0087\u0088\3\2\2\2\u0088\27\3\2\2\2\u0089\u008c\5\32\16\2\u008a"+
		"\u008c\7\66\2\2\u008b\u0089\3\2\2\2\u008b\u008a\3\2\2\2\u008c\31\3\2\2"+
		"\2\u008d\u008e\t\2\2\2\u008e\33\3\2\2\2\u008f\u0093\7\4\2\2\u0090\u0092"+
		"\5\36\20\2\u0091\u0090\3\2\2\2\u0092\u0095\3\2\2\2\u0093\u0091\3\2\2\2"+
		"\u0093\u0094\3\2\2\2\u0094\u0096\3\2\2\2\u0095\u0093\3\2\2\2\u0096\u0097"+
		"\7\5\2\2\u0097\35\3\2\2\2\u0098\u00c9\5\34\17\2\u0099\u00c9\5\n\6\2\u009a"+
		"\u009b\7\21\2\2\u009b\u009d\7\7\2\2\u009c\u009e\5 \21\2\u009d\u009c\3"+
		"\2\2\2\u009d\u009e\3\2\2\2\u009e\u009f\3\2\2\2\u009f\u00a0\7\b\2\2\u00a0"+
		"\u00a3\5\36\20\2\u00a1\u00a2\7\22\2\2\u00a2\u00a4\5\36\20\2\u00a3\u00a1"+
		"\3\2\2\2\u00a3\u00a4\3\2\2\2\u00a4\u00c9\3\2\2\2\u00a5\u00a6\7\23\2\2"+
		"\u00a6\u00a8\7\7\2\2\u00a7\u00a9\5 \21\2\u00a8\u00a7\3\2\2\2\u00a8\u00a9"+
		"\3\2\2\2\u00a9\u00aa\3\2\2\2\u00aa\u00ac\7\6\2\2\u00ab\u00ad\5 \21\2\u00ac"+
		"\u00ab\3\2\2\2\u00ac\u00ad\3\2\2\2\u00ad\u00ae\3\2\2\2\u00ae\u00b0\7\6"+
		"\2\2\u00af\u00b1\5 \21\2\u00b0\u00af\3\2\2\2\u00b0\u00b1\3\2\2\2\u00b1"+
		"\u00b2\3\2\2\2\u00b2\u00b3\7\b\2\2\u00b3\u00c9\5\36\20\2\u00b4\u00b5\7"+
		"\24\2\2\u00b5\u00b7\7\7\2\2\u00b6\u00b8\5 \21\2\u00b7\u00b6\3\2\2\2\u00b7"+
		"\u00b8\3\2\2\2\u00b8\u00b9\3\2\2\2\u00b9\u00ba\7\b\2\2\u00ba\u00c9\5\36"+
		"\20\2\u00bb\u00bd\7\25\2\2\u00bc\u00be\5 \21\2\u00bd\u00bc\3\2\2\2\u00bd"+
		"\u00be\3\2\2\2\u00be\u00bf\3\2\2\2\u00bf\u00c9\7\6\2\2\u00c0\u00c1\7\26"+
		"\2\2\u00c1\u00c9\7\6\2\2\u00c2\u00c3\7\27\2\2\u00c3\u00c9\7\6\2\2\u00c4"+
		"\u00c5\5 \21\2\u00c5\u00c6\7\6\2\2\u00c6\u00c9\3\2\2\2\u00c7\u00c9\7\6"+
		"\2\2\u00c8\u0098\3\2\2\2\u00c8\u0099\3\2\2\2\u00c8\u009a\3\2\2\2\u00c8"+
		"\u00a5\3\2\2\2\u00c8\u00b4\3\2\2\2\u00c8\u00bb\3\2\2\2\u00c8\u00c0\3\2"+
		"\2\2\u00c8\u00c2\3\2\2\2\u00c8\u00c4\3\2\2\2\u00c8\u00c7\3\2\2\2\u00c9"+
		"\37\3\2\2\2\u00ca\u00cb\b\21\1\2\u00cb\u00cc\7\7\2\2\u00cc\u00cd\5 \21"+
		"\2\u00cd\u00ce\7\b\2\2\u00ce\u00dd\3\2\2\2\u00cf\u00dd\7\30\2\2\u00d0"+
		"\u00dd\5&\24\2\u00d1\u00dd\7\66\2\2\u00d2\u00d3\7\31\2\2\u00d3\u00dd\5"+
		"$\23\2\u00d4\u00d5\t\3\2\2\u00d5\u00dd\5 \21\25\u00d6\u00d7\t\3\2\2\u00d7"+
		"\u00dd\5 \21\20\u00d8\u00d9\t\4\2\2\u00d9\u00dd\5 \21\17\u00da\u00db\t"+
		"\5\2\2\u00db\u00dd\5 \21\16\u00dc\u00ca\3\2\2\2\u00dc\u00cf\3\2\2\2\u00dc"+
		"\u00d0\3\2\2\2\u00dc\u00d1\3\2\2\2\u00dc\u00d2\3\2\2\2\u00dc\u00d4\3\2"+
		"\2\2\u00dc\u00d6\3\2\2\2\u00dc\u00d8\3\2\2\2\u00dc\u00da\3\2\2\2\u00dd"+
		"\u0111\3\2\2\2\u00de\u00df\f\r\2\2\u00df\u00e0\t\6\2\2\u00e0\u0110\5 "+
		"\21\16\u00e1\u00e2\f\f\2\2\u00e2\u00e3\t\3\2\2\u00e3\u0110\5 \21\r\u00e4"+
		"\u00e5\f\13\2\2\u00e5\u00e6\t\7\2\2\u00e6\u0110\5 \21\f\u00e7\u00e8\f"+
		"\n\2\2\u00e8\u00e9\t\b\2\2\u00e9\u0110\5 \21\13\u00ea\u00eb\f\t\2\2\u00eb"+
		"\u00ec\t\t\2\2\u00ec\u0110\5 \21\n\u00ed\u00ee\f\b\2\2\u00ee\u00ef\7,"+
		"\2\2\u00ef\u0110\5 \21\t\u00f0\u00f1\f\7\2\2\u00f1\u00f2\7-\2\2\u00f2"+
		"\u0110\5 \21\b\u00f3\u00f4\f\6\2\2\u00f4\u00f5\7.\2\2\u00f5\u0110\5 \21"+
		"\7\u00f6\u00f7\f\5\2\2\u00f7\u00f8\7/\2\2\u00f8\u0110\5 \21\6\u00f9\u00fa"+
		"\f\4\2\2\u00fa\u00fb\7\60\2\2\u00fb\u0110\5 \21\5\u00fc\u00fd\f\3\2\2"+
		"\u00fd\u00fe\7\n\2\2\u00fe\u0110\5 \21\3\u00ff\u0100\f\24\2\2\u0100\u0101"+
		"\7\34\2\2\u0101\u0110\7\66\2\2\u0102\u0103\f\23\2\2\u0103\u0104\7\13\2"+
		"\2\u0104\u0105\5 \21\2\u0105\u0106\7\f\2\2\u0106\u0110\3\2\2\2\u0107\u0108"+
		"\f\22\2\2\u0108\u010a\7\7\2\2\u0109\u010b\5\"\22\2\u010a\u0109\3\2\2\2"+
		"\u010a\u010b\3\2\2\2\u010b\u010c\3\2\2\2\u010c\u0110\7\b\2\2\u010d\u010e"+
		"\f\21\2\2\u010e\u0110\t\4\2\2\u010f\u00de\3\2\2\2\u010f\u00e1\3\2\2\2"+
		"\u010f\u00e4\3\2\2\2\u010f\u00e7\3\2\2\2\u010f\u00ea\3\2\2\2\u010f\u00ed"+
		"\3\2\2\2\u010f\u00f0\3\2\2\2\u010f\u00f3\3\2\2\2\u010f\u00f6\3\2\2\2\u010f"+
		"\u00f9\3\2\2\2\u010f\u00fc\3\2\2\2\u010f\u00ff\3\2\2\2\u010f\u0102\3\2"+
		"\2\2\u010f\u0107\3\2\2\2\u010f\u010d\3\2\2\2\u0110\u0113\3\2\2\2\u0111"+
		"\u010f\3\2\2\2\u0111\u0112\3\2\2\2\u0112!\3\2\2\2\u0113\u0111\3\2\2\2"+
		"\u0114\u0119\5 \21\2\u0115\u0116\7\t\2\2\u0116\u0118\5 \21\2\u0117\u0115"+
		"\3\2\2\2\u0118\u011b\3\2\2\2\u0119\u0117\3\2\2\2\u0119\u011a\3\2\2\2\u011a"+
		"#\3\2\2\2\u011b\u0119\3\2\2\2\u011c\u013e\5\30\r\2\u011d\u011e\7\13\2"+
		"\2\u011e\u0120\7\f\2\2\u011f\u011d\3\2\2\2\u0120\u0121\3\2\2\2\u0121\u011f"+
		"\3\2\2\2\u0121\u0122\3\2\2\2\u0122\u013f\3\2\2\2\u0123\u0124\7\13\2\2"+
		"\u0124\u012a\7\f\2\2\u0125\u0126\7\13\2\2\u0126\u0127\5 \21\2\u0127\u0128"+
		"\7\f\2\2\u0128\u012a\3\2\2\2\u0129\u0123\3\2\2\2\u0129\u0125\3\2\2\2\u012a"+
		"\u012d\3\2\2\2\u012b\u0129\3\2\2\2\u012b\u012c\3\2\2\2\u012c\u012e\3\2"+
		"\2\2\u012d\u012b\3\2\2\2\u012e\u012f\7\13\2\2\u012f\u0130\7\f\2\2\u0130"+
		"\u0131\7\13\2\2\u0131\u0132\5 \21\2\u0132\u013b\7\f\2\2\u0133\u0134\7"+
		"\13\2\2\u0134\u013a\7\f\2\2\u0135\u0136\7\13\2\2\u0136\u0137\5 \21\2\u0137"+
		"\u0138\7\f\2\2\u0138\u013a\3\2\2\2\u0139\u0133\3\2\2\2\u0139\u0135\3\2"+
		"\2\2\u013a\u013d\3\2\2\2\u013b\u0139\3\2\2\2\u013b\u013c\3\2\2\2\u013c"+
		"\u013f\3\2\2\2\u013d\u013b\3\2\2\2\u013e\u011f\3\2\2\2\u013e\u012b\3\2"+
		"\2\2\u013f\u0156\3\2\2\2\u0140\u0145\5\30\r\2\u0141\u0142\7\13\2\2\u0142"+
		"\u0143\5 \21\2\u0143\u0144\7\f\2\2\u0144\u0146\3\2\2\2\u0145\u0141\3\2"+
		"\2\2\u0146\u0147\3\2\2\2\u0147\u0145\3\2\2\2\u0147\u0148\3\2\2\2\u0148"+
		"\u014d\3\2\2\2\u0149\u014a\7\13\2\2\u014a\u014c\7\f\2\2\u014b\u0149\3"+
		"\2\2\2\u014c\u014f\3\2\2\2\u014d\u014b\3\2\2\2\u014d\u014e\3\2\2\2\u014e"+
		"\u0156\3\2\2\2\u014f\u014d\3\2\2\2\u0150\u0151\5\30\r\2\u0151\u0152\7"+
		"\7\2\2\u0152\u0153\7\b\2\2\u0153\u0156\3\2\2\2\u0154\u0156\5\30\r\2\u0155"+
		"\u011c\3\2\2\2\u0155\u0140\3\2\2\2\u0155\u0150\3\2\2\2\u0155\u0154\3\2"+
		"\2\2\u0156%\3\2\2\2\u0157\u0158\t\n\2\2\u0158\'\3\2\2\2\'+\63;=LW_gjp"+
		"y\u0080\u0087\u008b\u0093\u009d\u00a3\u00a8\u00ac\u00b0\u00b7\u00bd\u00c8"+
		"\u00dc\u010a\u010f\u0111\u0119\u0121\u0129\u012b\u0139\u013b\u013e\u0147"+
		"\u014d\u0155";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}