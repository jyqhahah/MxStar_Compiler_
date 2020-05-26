@.str.0 = private unnamed_addr constant [2 x i8] c" \00"
@.str.1 = private unnamed_addr constant [1 x i8] c"\00"

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

define void @bubble_sort(i32* %a.0) {
entryBBlock.0:
    %a$.0 = alloca i32*
    store i32* %a.0, i32** %a$.0
    %i$.0 = alloca i32
    %j$.0 = alloca i32
    %n$.0 = alloca i32
    %a.1 = load i32*, i32** %a$.0
    %sizePtr.0 = getelementptr i32, i32* %a.1, i32 -1
    %size.0 = load i32, i32* %sizePtr.0
    store i32 %size.0, i32* %n$.0
    %i.0 = load i32, i32* %i$.0
    store i32 0, i32* %i$.0
    br label %forCondBBlock.0

forCondBBlock.0:
    %i.1 = load i32, i32* %i$.0
    %n.0 = load i32, i32* %n$.0
    %sub.0 = sub i32 %n.0, 1
    %slt.0 = icmp slt i32 %i.1, %sub.0
    br i1 %slt.0, label %forBodyBBlock.0, label %afterForBBlock.0

forBodyBBlock.0:
    %j.0 = load i32, i32* %j$.0
    store i32 0, i32* %j$.0
    br label %forCondBBlock.1

forStepBBlock.0:
    %i.3 = load i32, i32* %i$.0
    %prefixIncr.1 = add i32 %i.3, 1
    store i32 %prefixIncr.1, i32* %i$.0
    br label %forCondBBlock.0

afterForBBlock.0:
    br label %returnBBlock.0

forCondBBlock.1:
    %j.1 = load i32, i32* %j$.0
    %n.1 = load i32, i32* %n$.0
    %i.2 = load i32, i32* %i$.0
    %sub.1 = sub i32 %n.1, %i.2
    %sub.2 = sub i32 %sub.1, 1
    %slt.1 = icmp slt i32 %j.1, %sub.2
    br i1 %slt.1, label %forBodyBBlock.1, label %afterForBBlock.1

forBodyBBlock.1:
    br label %ifCondBBlock.0

forStepBBlock.1:
    %j.8 = load i32, i32* %j$.0
    %prefixIncr.0 = add i32 %j.8, 1
    store i32 %prefixIncr.0, i32* %j$.0
    br label %forCondBBlock.1

afterForBBlock.1:
    br label %forStepBBlock.0

ifCondBBlock.0:
    %a.2 = load i32*, i32** %a$.0
    %j.2 = load i32, i32* %j$.0
    %element$.0 = getelementptr i32, i32* %a.2, i32 %j.2
    %element.0 = load i32, i32* %element$.0
    %a.3 = load i32*, i32** %a$.0
    %j.3 = load i32, i32* %j$.0
    %add.0 = add i32 %j.3, 1
    %element$.1 = getelementptr i32, i32* %a.3, i32 %add.0
    %element.1 = load i32, i32* %element$.1
    %slt.2 = icmp slt i32 %element.0, %element.1
    br i1 %slt.2, label %thenBodyBBlock.0, label %afterIfBBlock.0

thenBodyBBlock.0:
    br label %forCondBBlock.1

afterIfBBlock.0:
    %t$.0 = alloca i32
    %a.4 = load i32*, i32** %a$.0
    %j.4 = load i32, i32* %j$.0
    %element$.2 = getelementptr i32, i32* %a.4, i32 %j.4
    %element.2 = load i32, i32* %element$.2
    store i32 %element.2, i32* %t$.0
    %a.5 = load i32*, i32** %a$.0
    %j.5 = load i32, i32* %j$.0
    %element$.3 = getelementptr i32, i32* %a.5, i32 %j.5
    %element.3 = load i32, i32* %element$.3
    %a.6 = load i32*, i32** %a$.0
    %j.6 = load i32, i32* %j$.0
    %add.1 = add i32 %j.6, 1
    %element$.4 = getelementptr i32, i32* %a.6, i32 %add.1
    %element.4 = load i32, i32* %element$.4
    store i32 %element.4, i32* %element$.3
    %a.7 = load i32*, i32** %a$.0
    %j.7 = load i32, i32* %j$.0
    %add.2 = add i32 %j.7, 1
    %element$.5 = getelementptr i32, i32* %a.7, i32 %add.2
    %element.5 = load i32, i32* %element$.5
    %t.0 = load i32, i32* %t$.0
    store i32 %t.0, i32* %element$.5
    br label %forStepBBlock.1

returnBBlock.0:
    ret void

}

define i32 @main() {
entryBBlock.0:
    call void @__init__()
    %returnValue$.0 = alloca i32
    %n$.0 = alloca i32
    %call.0 = call i32 @__getInt()
    store i32 %call.0, i32* %n$.0
    %a$.0 = alloca i32*
    %n.0 = load i32, i32* %n$.0
    %mul.0 = mul i32 4, %n.0
    %add.0 = add i32 %mul.0, 4
    %malloc8.0 = call i8* @__malloc(i32 %add.0)
    %malloc32.0 = bitcast i8* %malloc8.0 to i32*
    store i32 %n.0, i32* %malloc32.0
    %arrayHead32.0 = getelementptr i32, i32* %malloc32.0, i32 1
    store i32* %arrayHead32.0, i32** %a$.0
    %i$.0 = alloca i32
    %i.0 = load i32, i32* %i$.0
    store i32 0, i32* %i$.0
    br label %forCondBBlock.0

forCondBBlock.0:
    %i.1 = load i32, i32* %i$.0
    %n.1 = load i32, i32* %n$.0
    %slt.0 = icmp slt i32 %i.1, %n.1
    br i1 %slt.0, label %forBodyBBlock.0, label %afterForBBlock.0

forBodyBBlock.0:
    %a.0 = load i32*, i32** %a$.0
    %i.2 = load i32, i32* %i$.0
    %element$.0 = getelementptr i32, i32* %a.0, i32 %i.2
    %element.0 = load i32, i32* %element$.0
    %call.1 = call i32 @__getInt()
    store i32 %call.1, i32* %element$.0
    br label %forStepBBlock.0

forStepBBlock.0:
    %i.3 = load i32, i32* %i$.0
    %prefixIncr.0 = add i32 %i.3, 1
    store i32 %prefixIncr.0, i32* %i$.0
    br label %forCondBBlock.0

afterForBBlock.0:
    %a.1 = load i32*, i32** %a$.0
    call void @bubble_sort(i32* %a.1)
    %i.4 = load i32, i32* %i$.0
    store i32 0, i32* %i$.0
    br label %forCondBBlock.1

forCondBBlock.1:
    %i.5 = load i32, i32* %i$.0
    %n.2 = load i32, i32* %n$.0
    %slt.1 = icmp slt i32 %i.5, %n.2
    br i1 %slt.1, label %forBodyBBlock.1, label %afterForBBlock.1

forBodyBBlock.1:
    %a.2 = load i32*, i32** %a$.0
    %i.6 = load i32, i32* %i$.0
    %element$.1 = getelementptr i32, i32* %a.2, i32 %i.6
    %element.1 = load i32, i32* %element$.1
    %call.2 = call i8* @__toString(i32 %element.1)
    %__stringLiteral.0 = getelementptr [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
    %add.1 = call i8* @__stringAdd(i8* %call.2, i8* %__stringLiteral.0)
    call void @__print(i8* %add.1)
    br label %forStepBBlock.1

forStepBBlock.1:
    %i.7 = load i32, i32* %i$.0
    %prefixIncr.1 = add i32 %i.7, 1
    store i32 %prefixIncr.1, i32* %i$.0
    br label %forCondBBlock.1

afterForBBlock.1:
    %__stringLiteral.1 = getelementptr [1 x i8], [1 x i8]* @.str.1, i32 0, i32 0
    call void @__println(i8* %__stringLiteral.1)
    store i32 0, i32* %returnValue$.0
    br label %returnBBlock.0

returnBBlock.0:
    %returnValue.0 = load i32, i32* %returnValue$.0
    ret i32 %returnValue.0

}

define void @__init__() {
entryBBlock.0:
    br label %returnBBlock.0

returnBBlock.0:
    ret void

}

