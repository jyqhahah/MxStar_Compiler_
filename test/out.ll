@.str.0 = private unnamed_addr constant [2 x i8] c" \00"
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00"

@n = global i32 0
@a = global i32* null

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

define void @exchange(i32 %x.0, i32 %y.0) {
entryBBlock.0:
    %x$.0 = alloca i32
    store i32 %x.0, i32* %x$.0
    %y$.0 = alloca i32
    store i32 %y.0, i32* %y$.0
    %t$.0 = alloca i32
    %a.0 = load i32*, i32** @a
    %x.1 = load i32, i32* %x$.0
    %element$.0 = getelementptr i32, i32* %a.0, i32 %x.1
    %element.0 = load i32, i32* %element$.0
    store i32 %element.0, i32* %t$.0
    %a.1 = load i32*, i32** @a
    %x.2 = load i32, i32* %x$.0
    %element$.1 = getelementptr i32, i32* %a.1, i32 %x.2
    %element.1 = load i32, i32* %element$.1
    %a.2 = load i32*, i32** @a
    %y.1 = load i32, i32* %y$.0
    %element$.2 = getelementptr i32, i32* %a.2, i32 %y.1
    %element.2 = load i32, i32* %element$.2
    store i32 %element.2, i32* %element$.1
    %a.3 = load i32*, i32** @a
    %y.2 = load i32, i32* %y$.0
    %element$.3 = getelementptr i32, i32* %a.3, i32 %y.2
    %element.3 = load i32, i32* %element$.3
    %t.0 = load i32, i32* %t$.0
    store i32 %t.0, i32* %element$.3
    br label %returnBBlock.0

returnBBlock.0:
    ret void

}

define i32 @makeHeap() {
entryBBlock.0:
    %returnValue$.0 = alloca i32
    %i$.0 = alloca i32
    %t$.0 = alloca i32
    %j$.0 = alloca i32
    %i.0 = load i32, i32* %i$.0
    %n.0 = load i32, i32* @n
    %sub.0 = sub i32 %n.0, 1
    %sdiv.0 = sdiv i32 %sub.0, 2
    store i32 %sdiv.0, i32* %i$.0
    %t.0 = load i32, i32* %t$.0
    store i32 0, i32* %t$.0
    %j.0 = load i32, i32* %j$.0
    store i32 0, i32* %j$.0
    br label %whileCondBBlock.0

whileCondBBlock.0:
    %i.1 = load i32, i32* %i$.0
    %sge.0 = icmp sge i32 %i.1, 0
    br i1 %sge.0, label %whileBodyBBlock.0, label %afterWhileBBlock.0

whileBodyBBlock.0:
    %j.1 = load i32, i32* %j$.0
    %i.2 = load i32, i32* %i$.0
    %mul.0 = mul i32 %i.2, 2
    store i32 %mul.0, i32* %j$.0
    br label %ifCondBBlock.0

afterWhileBBlock.0:
    store i32 0, i32* %returnValue$.0
    br label %returnBBlock.0

ifCondBBlock.0:
    %i.3 = load i32, i32* %i$.0
    %mul.1 = mul i32 %i.3, 2
    %add.0 = add i32 %mul.1, 1
    %n.1 = load i32, i32* @n
    %slt.0 = icmp slt i32 %add.0, %n.1
    br i1 %slt.0, label %logicalAnd.0, label %afterLogicalAnd.0

thenBodyBBlock.0:
    %j.2 = load i32, i32* %j$.0
    %i.6 = load i32, i32* %i$.0
    %mul.4 = mul i32 %i.6, 2
    %add.2 = add i32 %mul.4, 1
    store i32 %add.2, i32* %j$.0
    br label %afterIfBBlock.0

afterIfBBlock.0:
    br label %ifCondBBlock.1

logicalAnd.0:
    %a.0 = load i32*, i32** @a
    %i.4 = load i32, i32* %i$.0
    %mul.2 = mul i32 %i.4, 2
    %add.1 = add i32 %mul.2, 1
    %element$.0 = getelementptr i32, i32* %a.0, i32 %add.1
    %element.0 = load i32, i32* %element$.0
    %a.1 = load i32*, i32** @a
    %i.5 = load i32, i32* %i$.0
    %mul.3 = mul i32 %i.5, 2
    %element$.1 = getelementptr i32, i32* %a.1, i32 %mul.3
    %element.1 = load i32, i32* %element$.1
    %slt.1 = icmp slt i32 %element.0, %element.1
    br label %afterLogicalAnd.0

afterLogicalAnd.0:
    %phi.0 = phi i1  [ false, %ifCondBBlock.0 ],  [ %slt.1, %logicalAnd.0 ]
    br i1 %phi.0, label %thenBodyBBlock.0, label %afterIfBBlock.0

ifCondBBlock.1:
    %a.2 = load i32*, i32** @a
    %i.7 = load i32, i32* %i$.0
    %element$.2 = getelementptr i32, i32* %a.2, i32 %i.7
    %element.2 = load i32, i32* %element$.2
    %a.3 = load i32*, i32** @a
    %j.3 = load i32, i32* %j$.0
    %element$.3 = getelementptr i32, i32* %a.3, i32 %j.3
    %element.3 = load i32, i32* %element$.3
    %sgt.0 = icmp sgt i32 %element.2, %element.3
    br i1 %sgt.0, label %thenBodyBBlock.1, label %afterIfBBlock.1

thenBodyBBlock.1:
    %i.8 = load i32, i32* %i$.0
    %j.4 = load i32, i32* %j$.0
    call void @exchange(i32 %i.8, i32 %j.4)
    br label %afterIfBBlock.1

afterIfBBlock.1:
    %i.9 = load i32, i32* %i$.0
    %i.10 = load i32, i32* %i$.0
    %sub.1 = sub i32 %i.10, 1
    store i32 %sub.1, i32* %i$.0
    br label %whileCondBBlock.0

returnBBlock.0:
    %returnValue.0 = load i32, i32* %returnValue$.0
    ret i32 %returnValue.0

}

define i32 @adjustHeap(i32 %n.0) {
entryBBlock.0:
    %n$.0 = alloca i32
    store i32 %n.0, i32* %n$.0
    %returnValue$.0 = alloca i32
    %i$.0 = alloca i32
    store i32 0, i32* %i$.0
    %j$.0 = alloca i32
    store i32 0, i32* %j$.0
    %t$.0 = alloca i32
    store i32 0, i32* %t$.0
    br label %whileCondBBlock.0

whileCondBBlock.0:
    %i.0 = load i32, i32* %i$.0
    %mul.0 = mul i32 %i.0, 2
    %n.1 = load i32, i32* %n$.0
    %slt.0 = icmp slt i32 %mul.0, %n.1
    br i1 %slt.0, label %whileBodyBBlock.0, label %afterWhileBBlock.0

whileBodyBBlock.0:
    %j.0 = load i32, i32* %j$.0
    %i.1 = load i32, i32* %i$.0
    %mul.1 = mul i32 %i.1, 2
    store i32 %mul.1, i32* %j$.0
    br label %ifCondBBlock.0

afterWhileBBlock.0:
    store i32 0, i32* %returnValue$.0
    br label %returnBBlock.0

ifCondBBlock.0:
    %i.2 = load i32, i32* %i$.0
    %mul.2 = mul i32 %i.2, 2
    %add.0 = add i32 %mul.2, 1
    %n.2 = load i32, i32* %n$.0
    %slt.1 = icmp slt i32 %add.0, %n.2
    br i1 %slt.1, label %logicalAnd.0, label %afterLogicalAnd.0

thenBodyBBlock.0:
    %j.1 = load i32, i32* %j$.0
    %i.5 = load i32, i32* %i$.0
    %mul.5 = mul i32 %i.5, 2
    %add.2 = add i32 %mul.5, 1
    store i32 %add.2, i32* %j$.0
    br label %afterIfBBlock.0

afterIfBBlock.0:
    br label %ifCondBBlock.1

logicalAnd.0:
    %a.0 = load i32*, i32** @a
    %i.3 = load i32, i32* %i$.0
    %mul.3 = mul i32 %i.3, 2
    %add.1 = add i32 %mul.3, 1
    %element$.0 = getelementptr i32, i32* %a.0, i32 %add.1
    %element.0 = load i32, i32* %element$.0
    %a.1 = load i32*, i32** @a
    %i.4 = load i32, i32* %i$.0
    %mul.4 = mul i32 %i.4, 2
    %element$.1 = getelementptr i32, i32* %a.1, i32 %mul.4
    %element.1 = load i32, i32* %element$.1
    %slt.2 = icmp slt i32 %element.0, %element.1
    br label %afterLogicalAnd.0

afterLogicalAnd.0:
    %phi.0 = phi i1  [ false, %ifCondBBlock.0 ],  [ %slt.2, %logicalAnd.0 ]
    br i1 %phi.0, label %thenBodyBBlock.0, label %afterIfBBlock.0

ifCondBBlock.1:
    %a.2 = load i32*, i32** @a
    %i.6 = load i32, i32* %i$.0
    %element$.2 = getelementptr i32, i32* %a.2, i32 %i.6
    %element.2 = load i32, i32* %element$.2
    %a.3 = load i32*, i32** @a
    %j.2 = load i32, i32* %j$.0
    %element$.3 = getelementptr i32, i32* %a.3, i32 %j.2
    %element.3 = load i32, i32* %element$.3
    %sgt.0 = icmp sgt i32 %element.2, %element.3
    br i1 %sgt.0, label %thenBodyBBlock.1, label %elseBodyBBlock.0

thenBodyBBlock.1:
    %t$.1 = alloca i32
    %a.4 = load i32*, i32** @a
    %i.7 = load i32, i32* %i$.0
    %element$.4 = getelementptr i32, i32* %a.4, i32 %i.7
    %element.4 = load i32, i32* %element$.4
    store i32 %element.4, i32* %t$.1
    %a.5 = load i32*, i32** @a
    %i.8 = load i32, i32* %i$.0
    %element$.5 = getelementptr i32, i32* %a.5, i32 %i.8
    %element.5 = load i32, i32* %element$.5
    %a.6 = load i32*, i32** @a
    %j.3 = load i32, i32* %j$.0
    %element$.6 = getelementptr i32, i32* %a.6, i32 %j.3
    %element.6 = load i32, i32* %element$.6
    store i32 %element.6, i32* %element$.5
    %a.7 = load i32*, i32** @a
    %j.4 = load i32, i32* %j$.0
    %element$.7 = getelementptr i32, i32* %a.7, i32 %j.4
    %element.7 = load i32, i32* %element$.7
    %t.0 = load i32, i32* %t$.1
    store i32 %t.0, i32* %element$.7
    %i.9 = load i32, i32* %i$.0
    %j.5 = load i32, i32* %j$.0
    store i32 %j.5, i32* %i$.0
    br label %afterIfBBlock.1

elseBodyBBlock.0:
    br label %afterWhileBBlock.0

afterIfBBlock.1:
    br label %whileCondBBlock.0

returnBBlock.0:
    %returnValue.0 = load i32, i32* %returnValue$.0
    ret i32 %returnValue.0

}

define i32 @heapSort() {
entryBBlock.0:
    %returnValue$.0 = alloca i32
    %t$.0 = alloca i32
    %k$.0 = alloca i32
    %t.0 = load i32, i32* %t$.0
    store i32 0, i32* %t$.0
    %k.0 = load i32, i32* %k$.0
    store i32 0, i32* %k$.0
    br label %forCondBBlock.0

forCondBBlock.0:
    %k.1 = load i32, i32* %k$.0
    %n.0 = load i32, i32* @n
    %slt.0 = icmp slt i32 %k.1, %n.0
    br i1 %slt.0, label %forBodyBBlock.0, label %afterForBBlock.0

forBodyBBlock.0:
    %t.1 = load i32, i32* %t$.0
    %a.0 = load i32*, i32** @a
    %element$.0 = getelementptr i32, i32* %a.0, i32 0
    %element.0 = load i32, i32* %element$.0
    store i32 %element.0, i32* %t$.0
    %a.1 = load i32*, i32** @a
    %element$.1 = getelementptr i32, i32* %a.1, i32 0
    %element.1 = load i32, i32* %element$.1
    %a.2 = load i32*, i32** @a
    %n.1 = load i32, i32* @n
    %k.2 = load i32, i32* %k$.0
    %sub.0 = sub i32 %n.1, %k.2
    %sub.1 = sub i32 %sub.0, 1
    %element$.2 = getelementptr i32, i32* %a.2, i32 %sub.1
    %element.2 = load i32, i32* %element$.2
    store i32 %element.2, i32* %element$.1
    %a.3 = load i32*, i32** @a
    %n.2 = load i32, i32* @n
    %k.3 = load i32, i32* %k$.0
    %sub.2 = sub i32 %n.2, %k.3
    %sub.3 = sub i32 %sub.2, 1
    %element$.3 = getelementptr i32, i32* %a.3, i32 %sub.3
    %element.3 = load i32, i32* %element$.3
    %t.2 = load i32, i32* %t$.0
    store i32 %t.2, i32* %element$.3
    %n.3 = load i32, i32* @n
    %k.4 = load i32, i32* %k$.0
    %sub.4 = sub i32 %n.3, %k.4
    %sub.5 = sub i32 %sub.4, 1
    %call.0 = call i32 @adjustHeap(i32 %sub.5)
    br label %forStepBBlock.0

forStepBBlock.0:
    %k.5 = load i32, i32* %k$.0
    %k.6 = load i32, i32* %k$.0
    %add.0 = add i32 %k.6, 1
    store i32 %add.0, i32* %k$.0
    br label %forCondBBlock.0

afterForBBlock.0:
    store i32 0, i32* %returnValue$.0
    br label %returnBBlock.0

returnBBlock.0:
    %returnValue.0 = load i32, i32* %returnValue$.0
    ret i32 %returnValue.0

}

define i32 @main() {
entryBBlock.0:
    call void @__init__()
    %returnValue$.0 = alloca i32
    %i$.0 = alloca i32
    %n.0 = load i32, i32* @n
    %call.0 = call i8* @__getString()
    %call.1 = call i32 @__stringParseInt(i8* %call.0)
    store i32 %call.1, i32* @n
    %a.0 = load i32*, i32** @a
    %n.1 = load i32, i32* @n
    %mul.0 = mul i32 32, %n.1
    %add.0 = add i32 %mul.0, 4
    %malloc8.0 = call i8* @__malloc(i32 %add.0)
    %malloc32.0 = bitcast i8* %malloc8.0 to i32*
    store i32 %n.1, i32* %malloc32.0
    %arrayHead32.0 = getelementptr i32, i32* %malloc32.0, i32 1
    store i32* %arrayHead32.0, i32** @a
    %i.0 = load i32, i32* %i$.0
    store i32 0, i32* %i$.0
    br label %forCondBBlock.0

forCondBBlock.0:
    %i.1 = load i32, i32* %i$.0
    %a.1 = load i32*, i32** @a
    %sizePtr.0 = getelementptr i32, i32* %a.1, i32 -1
    %size.0 = load i32, i32* %sizePtr.0
    %slt.0 = icmp slt i32 %i.1, %size.0
    br i1 %slt.0, label %forBodyBBlock.0, label %afterForBBlock.0

forBodyBBlock.0:
    %a.2 = load i32*, i32** @a
    %i.2 = load i32, i32* %i$.0
    %element$.0 = getelementptr i32, i32* %a.2, i32 %i.2
    %element.0 = load i32, i32* %element$.0
    %i.3 = load i32, i32* %i$.0
    store i32 %i.3, i32* %element$.0
    br label %forStepBBlock.0

forStepBBlock.0:
    %i.4 = load i32, i32* %i$.0
    %i.5 = load i32, i32* %i$.0
    %add.1 = add i32 %i.5, 1
    store i32 %add.1, i32* %i$.0
    br label %forCondBBlock.0

afterForBBlock.0:
    %call.2 = call i32 @makeHeap()
    %call.3 = call i32 @heapSort()
    %i.6 = load i32, i32* %i$.0
    store i32 0, i32* %i$.0
    br label %forCondBBlock.1

forCondBBlock.1:
    %i.7 = load i32, i32* %i$.0
    %a.3 = load i32*, i32** @a
    %sizePtr.1 = getelementptr i32, i32* %a.3, i32 -1
    %size.1 = load i32, i32* %sizePtr.1
    %slt.1 = icmp slt i32 %i.7, %size.1
    br i1 %slt.1, label %forBodyBBlock.1, label %afterForBBlock.1

forBodyBBlock.1:
    %a.4 = load i32*, i32** @a
    %i.8 = load i32, i32* %i$.0
    %element$.1 = getelementptr i32, i32* %a.4, i32 %i.8
    %element.1 = load i32, i32* %element$.1
    %call.4 = call i8* @__toString(i32 %element.1)
    %stringLiteral.0 = getelementptr [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
    %add.2 = call i8* @__stringAdd(i8* %call.4, i8* %stringLiteral.0)
    call void @__print(i8* %add.2)
    br label %forStepBBlock.1

forStepBBlock.1:
    %i.9 = load i32, i32* %i$.0
    %i.10 = load i32, i32* %i$.0
    %add.3 = add i32 %i.10, 1
    store i32 %add.3, i32* %i$.0
    br label %forCondBBlock.1

afterForBBlock.1:
    %stringLiteral.1 = getelementptr [2 x i8], [2 x i8]* @.str.1, i32 0, i32 0
    call void @__print(i8* %stringLiteral.1)
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

