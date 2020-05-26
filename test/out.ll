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
    %sizePtr.0 = getelementptr i32, i32* %a.0, i32 -1
    %size.0 = load i32, i32* %sizePtr.0
    move %i.4, 0
    move %j.10, 0
    move %t.3, 0
    br label %forCondBBlock.0

forCondBBlock.0:
    %sub.0 = sub i32 %size.0, 1
    %slt.0 = icmp slt i32 %i.4, %sub.0
    br i1 %slt.0, label %forBodyBBlock.0, label %afterForBBlock.0

forBodyBBlock.0:
    move %j.9, 0
    move %t.2, %t.3
    br label %forCondBBlock.1

afterForBBlock.0:
    ret void

forCondBBlock.1:
    %sub.1 = sub i32 %size.0, %i.4
    %sub.2 = sub i32 %sub.1, 1
    %slt.1 = icmp slt i32 %j.9, %sub.2
    br i1 %slt.1, label %forBodyBBlock.1, label %afterForBBlock.1

forBodyBBlock.1:
    %element$.0 = getelementptr i32, i32* %a.0, i32 %j.9
    %element.0 = load i32, i32* %element$.0
    %add.0 = add i32 %j.9, 1
    %element$.1 = getelementptr i32, i32* %a.0, i32 %add.0
    %element.1 = load i32, i32* %element$.1
    %slt.2 = icmp slt i32 %element.0, %element.1
    br i1 %slt.2, label %thenBodyBBlock.0, label %afterIfBBlock.0

forStepBBlock.1:
    %prefixIncr.0 = add i32 %j.9, 1
    move %j.9, %prefixIncr.0
    move %t.2, %t.1
    br label %forCondBBlock.1

afterForBBlock.1:
    %prefixIncr.1 = add i32 %i.4, 1
    move %i.4, %prefixIncr.1
    move %j.10, %j.9
    move %t.3, %t.2
    br label %forCondBBlock.0

thenBodyBBlock.0:
    move %t.1, %t.2
    br label %forStepBBlock.1

afterIfBBlock.0:
    %element$.2 = getelementptr i32, i32* %a.0, i32 %j.9
    %element.2 = load i32, i32* %element$.2
    %element$.3 = getelementptr i32, i32* %a.0, i32 %j.9
    %add.1 = add i32 %j.9, 1
    %element$.4 = getelementptr i32, i32* %a.0, i32 %add.1
    %element.4 = load i32, i32* %element$.4
    store i32 %element.4, i32* %element$.3
    %add.2 = add i32 %j.9, 1
    %element$.5 = getelementptr i32, i32* %a.0, i32 %add.2
    store i32 %element.2, i32* %element$.5
    move %t.1, %element.2
    br label %forStepBBlock.1

}

define i32 @main() {
entryBBlock.0:
    call void @__init__()
    %call.0 = call i32 @__getInt()
    %mul.0 = mul i32 4, %call.0
    %add.0 = add i32 %mul.0, 4
    %malloc8.0 = call i8* @__malloc(i32 %add.0)
    %malloc32.0 = bitcast i8* %malloc8.0 to i32*
    store i32 %call.0, i32* %malloc32.0
    %arrayHead32.0 = getelementptr i32, i32* %malloc32.0, i32 1
    move %i.9, 0
    br label %forCondBBlock.0

forCondBBlock.0:
    %slt.0 = icmp slt i32 %i.9, %call.0
    br i1 %slt.0, label %forBodyBBlock.0, label %afterForBBlock.0

forBodyBBlock.0:
    %element$.0 = getelementptr i32, i32* %arrayHead32.0, i32 %i.9
    %call.1 = call i32 @__getInt()
    store i32 %call.1, i32* %element$.0
    %prefixIncr.0 = add i32 %i.9, 1
    move %i.9, %prefixIncr.0
    br label %forCondBBlock.0

afterForBBlock.0:
    call void @bubble_sort(i32* %arrayHead32.0)
    move %i.8, 0
    br label %forCondBBlock.1

forCondBBlock.1:
    %slt.1 = icmp slt i32 %i.8, %call.0
    br i1 %slt.1, label %forBodyBBlock.1, label %afterForBBlock.1

forBodyBBlock.1:
    %element$.1 = getelementptr i32, i32* %arrayHead32.0, i32 %i.8
    %element.1 = load i32, i32* %element$.1
    %call.2 = call i8* @__toString(i32 %element.1)
    %__stringLiteral.0 = getelementptr [2 x i8], [2 x i8]* @.str.0, i32 0, i32 0
    %add.1 = call i8* @__stringAdd(i8* %call.2, i8* %__stringLiteral.0)
    call void @__print(i8* %add.1)
    %prefixIncr.1 = add i32 %i.8, 1
    move %i.8, %prefixIncr.1
    br label %forCondBBlock.1

afterForBBlock.1:
    %__stringLiteral.1 = getelementptr [1 x i8], [1 x i8]* @.str.1, i32 0, i32 0
    call void @__println(i8* %__stringLiteral.1)
    ret i32 0

}

define void @__init__() {
entryBBlock.0:
    ret void

}

