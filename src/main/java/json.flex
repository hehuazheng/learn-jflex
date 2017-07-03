/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright (C) 2000 Gerwin Klein <lsf@jflex.de>                          *
 * All rights reserved.                                                    *
 *                                                                         *
 * Thanks to Larry Bell and Bob Jamison for suggestions and comments.      *
 *                                                                         *
 * License: BSD                                                            *
 *                                                                         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

%%
%public
%class JsonTest
%line
%column
%standalone

%{
String age;
String name;

public void analysis() throws Exception {
while ( !zzAtEOF ) yylex();
}

public String getInfo() {
return "name: " + name +", age:" + age;
}
%}

HEX = [a-fA-F0-9]
IDENT = [a-zA-Z_$] [a-zA-Z0-9_$]*
INT_LITERAL = [-]? [0-9]+
FLOAT_LITERAL = {INT_LITERAL} ( ( \.[0-9]+ ) ? ( [eE][-+]? [0-9]+ )? )
SKIP = [ \t\r\n]
OTHERS = .
%%

"name " {IDENT} [a-zA-Z0-9_$]* { name = yytext().substring(5);}
{SKIP} {}
"age " {INT_LITERAL} { age = yytext().substring(4);}
