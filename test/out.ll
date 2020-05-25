@.str.0 = private unnamed_addr constant [4 x i8] c"YES\00"
@.str.1 = private unnamed_addr constant [3 x i8] c"NO\00"

@w = global i32 0

declare i8* @__toString(i32 %i)
declare i8* @__malloc(i32 %n)
declare i8* @__getString()
declare i32 @__getInt()
declare void @__print(i8* %str)
declare void @__println(i8* %str)
declare void @__printInt(i32 %n)
declare void @__printlnInt(i32 %n)
declare i32 @__stringParseInt(i8* %str)
declare i32 @__stringLength(i8* %str)
declare i32 @__stringOrd(i8* %str, i32 %pos)
declare i8* @__stringSubstring(i8* %str, i32 %l, i32 %r)
declare i8* @__stringAdd(i8* %str1, i8* %str2)
declare i1 @__stringEqual(i8* %str1, i8* %str2)
declare i1 @__stringNotEqual(i8* %str1, i8* %str2)
declare i1 @__stringGreater(i8* %str1, i8* %str2)
declare i1 @__stringGreaterEqual(i8* %str1, i8* %str2)
declare i1 @__stringLess(i8* %str1, i8* %str2)
declare i1 @__stringLessEqual(i8* %str1, i8* %str2)

define i32 @main() {
entryBBlock.0:
    call void @__init__()
    %call.0 = call i32 @__getInt()
    store i32 %call.0, i32* @w
    %w.1 = load i32, i32* @w
    %srem.0 = srem i32 %w.1, 2
    %eq.0 = icmp eq i32 %srem.0, 0
    br i1 %eq.0, label %logicalAnd.0, label %criticalEdge.0

thenBodyBBlock.0:
    %__stringLiteral.0 = getelementptr [4 x i8], [4 x i8]* @.str.0, i32 0, i32 0
    call void @__print(i8* %__stringLiteral.0)
    br label %afterIfBBlock.0

elseBodyBBlock.0:
    %__stringLiteral.1 = getelementptr [3 x i8], [3 x i8]* @.str.1, i32 0, i32 0
    call void @__print(i8* %__stringLiteral.1)
    br label %afterIfBBlock.0

afterIfBBlock.0:
    ret i32 0

logicalAnd.0:
    %w.2 = load i32, i32* @w
    %sgt.0 = icmp sgt i32 %w.2, 2
    move %phi.0, %sgt.0
    br label %afterLogicalAnd.0

afterLogicalAnd.0:
    br i1 %phi.0, label %thenBodyBBlock.0, label %elseBodyBBlock.0

criticalEdge.0:
    move %phi.0, false
    br label %afterLogicalAnd.0

}

define void @__init__() {
entryBBlock.0:
    ret void

}

