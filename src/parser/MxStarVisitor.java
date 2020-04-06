// Generated from E:/Javaproject/MxStar_Compiler/src/parser\MxStar.g4 by ANTLR 4.8
package parser;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxStarParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxStarVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxStarParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(MxStarParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#def}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDef(MxStarParser.DefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#classdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassdef(MxStarParser.ClassdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#funcdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFuncdef(MxStarParser.FuncdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#vardefList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardefList(MxStarParser.VardefListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#vardef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardef(MxStarParser.VardefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#paraList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParaList(MxStarParser.ParaListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#para}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPara(MxStarParser.ParaContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#consdef}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConsdef(MxStarParser.ConsdefContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#type}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitType(MxStarParser.TypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#arrayType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArrayType(MxStarParser.ArrayTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#varType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarType(MxStarParser.VarTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#primType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrimType(MxStarParser.PrimTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(MxStarParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by the {@code blockStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockStat(MxStarParser.BlockStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code vardefListStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVardefListStat(MxStarParser.VardefListStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ifStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStat(MxStarParser.IfStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code forStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStat(MxStarParser.ForStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code whileStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStat(MxStarParser.WhileStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code returnStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStat(MxStarParser.ReturnStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code breakStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBreakStat(MxStarParser.BreakStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code continueStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinueStat(MxStarParser.ContinueStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code exprStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprStat(MxStarParser.ExprStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code blankStat}
	 * labeled alternative in {@link MxStarParser#stat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlankStat(MxStarParser.BlankStatContext ctx);
	/**
	 * Visit a parse tree produced by the {@code sub_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSub_expr(MxStarParser.Sub_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code member_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMember_expr(MxStarParser.Member_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code binary_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBinary_expr(MxStarParser.Binary_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code index_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIndex_expr(MxStarParser.Index_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code this_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThis_expr(MxStarParser.This_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code id_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitId_expr(MxStarParser.Id_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code postfix_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPostfix_expr(MxStarParser.Postfix_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code creator_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCreator_expr(MxStarParser.Creator_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code prefix_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrefix_expr(MxStarParser.Prefix_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code method_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMethod_expr(MxStarParser.Method_exprContext ctx);
	/**
	 * Visit a parse tree produced by the {@code liter_expr}
	 * labeled alternative in {@link MxStarParser#expr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiter_expr(MxStarParser.Liter_exprContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#exprList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExprList(MxStarParser.ExprListContext ctx);
	/**
	 * Visit a parse tree produced by the {@code wrong_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWrong_creator(MxStarParser.Wrong_creatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code array_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArray_creator(MxStarParser.Array_creatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code class_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClass_creator(MxStarParser.Class_creatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code varType_creator}
	 * labeled alternative in {@link MxStarParser#new_creator}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVarType_creator(MxStarParser.VarType_creatorContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxStarParser#literal}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLiteral(MxStarParser.LiteralContext ctx);
}