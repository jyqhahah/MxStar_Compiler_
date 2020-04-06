// Generated from E:/Javaproject/MxStar_Compiler/src/parser\MxStar.g4 by ANTLR 4.8
package parser;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxStarParser}.
 */
public interface MxStarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxStarParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxStarParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxStarParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#def}.
	 * @param ctx the parse tree
	 */
	void enterDef(MxStarParser.DefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#def}.
	 * @param ctx the parse tree
	 */
	void exitDef(MxStarParser.DefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#classdef}.
	 * @param ctx the parse tree
	 */
	void enterClassdef(MxStarParser.ClassdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#classdef}.
	 * @param ctx the parse tree
	 */
	void exitClassdef(MxStarParser.ClassdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void enterFuncdef(MxStarParser.FuncdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#funcdef}.
	 * @param ctx the parse tree
	 */
	void exitFuncdef(MxStarParser.FuncdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#vardefList}.
	 * @param ctx the parse tree
	 */
	void enterVardefList(MxStarParser.VardefListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#vardefList}.
	 * @param ctx the parse tree
	 */
	void exitVardefList(MxStarParser.VardefListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#vardef}.
	 * @param ctx the parse tree
	 */
	void enterVardef(MxStarParser.VardefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#vardef}.
	 * @param ctx the parse tree
	 */
	void exitVardef(MxStarParser.VardefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#paraList}.
	 * @param ctx the parse tree
	 */
	void enterParaList(MxStarParser.ParaListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#paraList}.
	 * @param ctx the parse tree
	 */
	void exitParaList(MxStarParser.ParaListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#para}.
	 * @param ctx the parse tree
	 */
	void enterPara(MxStarParser.ParaContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#para}.
	 * @param ctx the parse tree
	 */
	void exitPara(MxStarParser.ParaContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#consdef}.
	 * @param ctx the parse tree
	 */
	void enterConsdef(MxStarParser.ConsdefContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#consdef}.
	 * @param ctx the parse tree
	 */
	void exitConsdef(MxStarParser.ConsdefContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#type}.
	 * @param ctx the parse tree
	 */
	void enterType(MxStarParser.TypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#type}.
	 * @param ctx the parse tree
	 */
	void exitType(MxStarParser.TypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#arrayType}.
	 * @param ctx the parse tree
	 */
	void enterArrayType(MxStarParser.ArrayTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#arrayType}.
	 * @param ctx the parse tree
	 */
	void exitArrayType(MxStarParser.ArrayTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#varType}.
	 * @param ctx the parse tree
	 */
	void enterVarType(MxStarParser.VarTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#varType}.
	 * @param ctx the parse tree
	 */
	void exitVarType(MxStarParser.VarTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#primType}.
	 * @param ctx the parse tree
	 */
	void enterPrimType(MxStarParser.PrimTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#primType}.
	 * @param ctx the parse tree
	 */
	void exitPrimType(MxStarParser.PrimTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxStarParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxStarParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blockStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterBlockStat(MxStarParser.BlockStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blockStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitBlockStat(MxStarParser.BlockStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code vardefListStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterVardefListStat(MxStarParser.VardefListStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code vardefListStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitVardefListStat(MxStarParser.VardefListStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterIfStat(MxStarParser.IfStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitIfStat(MxStarParser.IfStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterForStat(MxStarParser.ForStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitForStat(MxStarParser.ForStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterWhileStat(MxStarParser.WhileStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitWhileStat(MxStarParser.WhileStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code returnStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterReturnStat(MxStarParser.ReturnStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code returnStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitReturnStat(MxStarParser.ReturnStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code breakStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterBreakStat(MxStarParser.BreakStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code breakStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitBreakStat(MxStarParser.BreakStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continueStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterContinueStat(MxStarParser.ContinueStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continueStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitContinueStat(MxStarParser.ContinueStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code exprStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterExprStat(MxStarParser.ExprStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code exprStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitExprStat(MxStarParser.ExprStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blankStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void enterBlankStat(MxStarParser.BlankStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blankStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 */
	void exitBlankStat(MxStarParser.BlankStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code sub_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterSub_expr(MxStarParser.Sub_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code sub_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitSub_expr(MxStarParser.Sub_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code member_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMember_expr(MxStarParser.Member_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code member_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMember_expr(MxStarParser.Member_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code binary_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterBinary_expr(MxStarParser.Binary_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code binary_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitBinary_expr(MxStarParser.Binary_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code index_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterIndex_expr(MxStarParser.Index_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code index_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitIndex_expr(MxStarParser.Index_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code this_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterThis_expr(MxStarParser.This_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code this_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitThis_expr(MxStarParser.This_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code id_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterId_expr(MxStarParser.Id_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code id_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitId_expr(MxStarParser.Id_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code postfix_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterPostfix_expr(MxStarParser.Postfix_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code postfix_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitPostfix_expr(MxStarParser.Postfix_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code creator_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterCreator_expr(MxStarParser.Creator_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code creator_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitCreator_expr(MxStarParser.Creator_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code prefix_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterPrefix_expr(MxStarParser.Prefix_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code prefix_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitPrefix_expr(MxStarParser.Prefix_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code method_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterMethod_expr(MxStarParser.Method_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code method_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitMethod_expr(MxStarParser.Method_exprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code liter_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterLiter_expr(MxStarParser.Liter_exprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code liter_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitLiter_expr(MxStarParser.Liter_exprContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#exprList}.
	 * @param ctx the parse tree
	 */
	void enterExprList(MxStarParser.ExprListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#exprList}.
	 * @param ctx the parse tree
	 */
	void exitExprList(MxStarParser.ExprListContext ctx);
	/**
	 * Enter a parse tree produced by the {@code wrong_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void enterWrong_creator(MxStarParser.Wrong_creatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code wrong_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void exitWrong_creator(MxStarParser.Wrong_creatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code array_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void enterArray_creator(MxStarParser.Array_creatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code array_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void exitArray_creator(MxStarParser.Array_creatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code class_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void enterClass_creator(MxStarParser.Class_creatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code class_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void exitClass_creator(MxStarParser.Class_creatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code varType_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void enterVarType_creator(MxStarParser.VarType_creatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code varType_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 */
	void exitVarType_creator(MxStarParser.VarType_creatorContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxStarParser#literal}.
	 * @param ctx the parse tree
	 */
	void enterLiteral(MxStarParser.LiteralContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxStarParser#literal}.
	 * @param ctx the parse tree
	 */
	void exitLiteral(MxStarParser.LiteralContext ctx);
}