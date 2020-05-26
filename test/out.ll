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
    %returnValue$.0 = alloca i32
    %a$.0 = alloca i32
    store i32 5, i32* %a$.0
    %b$.0 = alloca i32
    %c$.0 = alloca i32
    %c.0 = load i32, i32* %c$.0
    %a.0 = load i32, i32* %a$.0
    %suffixIncr.0 = add i32 %a.0, 1
    store i32 %suffixIncr.0, i32* %a$.0
    store i32 %a.0, i32* %c$.0
    %b.0 = load i32, i32* %b$.0
    %c.1 = load i32, i32* %c$.0
    store i32 %c.1, i32* %b$.0
    %b.1 = load i32, i32* %b$.0
    %c.2 = load i32, i32* %c$.0
    %add.0 = add i32 %b.1, %c.2
    %a.1 = load i32, i32* %a$.0
    %add.1 = add i32 %add.0, %a.1
    store i32 %add.1, i32* %returnValue$.0
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

