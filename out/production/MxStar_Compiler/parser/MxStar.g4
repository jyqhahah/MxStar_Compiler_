grammar MxStar;

program
        : def* EOF
        ;

def
        : vardefList
        | funcdef
        | classdef
        ;


classdef
        : 'class' Identifier '{'(vardefList|funcdef|consdef)*'}'';'
        ;

funcdef
        : type Identifier '(' paraList ')' '{'stat*'}'
        ;

vardefList
        : type vardef (',' vardef)*';'
        ;


vardef
        : Identifier ('=' expr)?
        ;

paraList
        :
        |para (','para)*
        ;

para
        :type Identifier ('=' expr)?
        ;


consdef
        : Identifier '('')''{'stat*'}'
        ;

type
        : varType
        | arrayType
        ;

arrayType
        : varType ('['']')+
        ;


varType
        : primType
        | Identifier
        ;


primType
        : 'bool'
        | 'int'
        | 'string'
        | 'void'
        ;

block
        : '{' stat* '}'
        ;

stat
        : block                                                                         #blockStat
        | vardefList                                                                    #vardefListStat
        | 'if' '(' expr ? ')' stat ('else'stat)?                                        #ifStat
        | 'for' '(' init = expr? ';' cond = expr? ';' step = expr? ')' stat             #forStat
        | 'while' '(' expr ? ')' stat                                                   #whileStat
        | 'return' expr ? ';'                                                           #returnStat
        | 'break'  ';'                                                                  #breakStat
        | 'continue' ';'                                                                #continueStat
        | expr ';'                                                                      #exprStat
        |';'                                                                            #blankStat
        ;

expr
        : '(' expr ')'                                  #sub_expr
        | 'this'                                        #this_expr
        | literal                                       #liter_expr
        | Identifier                                    #id_expr
        | 'new' new_creator                             #creator_expr| op = ('+'|'-') expr                           #prefix_expr
        | expr '.' Identifier                           #member_expr
        | expr '[' expr ']'                             #index_expr
        | expr '(' exprList? ')'                        #method_expr
        | expr op = ('++'|'--')                         #postfix_expr
        | op = ('+'|'-') expr                           #prefix_expr
        | op = ('++'|'--') expr                         #prefix_expr
        | op = ('~'|'!') expr                           #prefix_expr
        | expr op = ('*'|'/'|'%') expr                  #binary_expr
        | expr op = ('+'|'-') expr                      #binary_expr
        | expr op = ('<<'|'>>') expr                    #binary_expr
        | expr op = ('<'|'>'|'<='|'>=') expr            #binary_expr
        | expr op = ('=='|'!=') expr                    #binary_expr
        | expr op = '&' expr                           #binary_expr
        | expr op = '^' expr                           #binary_expr
        | expr op = '|' expr                            #binary_expr
        | expr op = '&&' expr                            #binary_expr
        | expr op = '||' expr                            #binary_expr
        | <assoc = right> expr op = '=' expr            #binary_expr
        ;

exprList
        : (expr(','expr)*)
        ;

new_creator
        : varType ( ('[' ']')+ | ((('[' ']')|('[' expr ']'))* '[' ']' '[' expr ']' (('[' ']')|('[' expr ']'))*) )        #wrong_creator
        | varType ('['expr ']') +  ('['']')*                        #array_creator
        | varType '('')'                                            #class_creator
        | varType                                                   #varType_creator
        ;


literal
        : BoolLiteral
        | IntLiteral
        | StringLiteral
        | 'null'
        ;

BoolLiteral
        : 'true'
        | 'false'
        ;

IntLiteral
        : [1-9] [0-9]*
        | '0'
        ;

StringLiteral
        :  '"' (ESC|.)*? '"'
        ;

ESC: '\\"' | '\\n' | '\\\\';

Identifier: [a-zA-Z] [a-zA-Z_0-9]*;
WS: [ \t]+ -> skip;
NewLine: '\r' ? '\n' -> skip;
LineComment:  '//' ~[\r\n]* ->skip;
BlockComment: '/*' .*? '*/' -> skip;

