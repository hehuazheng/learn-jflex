package com.hzz.mxsql;

import java.util.*;

%%
%public
%class MxSqlParser
%line
%column


%eof{
System.out.println("end");
%eof}

%{
List<OneStatement> list = new ArrayList<>();
OneStatement os = null;
public void analysis() throws Exception {
while ( !zzAtEOF ) yylex();
}

public List<OneStatement> getList() {
return list;
}
%}

HEX = [a-fA-F0-9]
IDENT = [a-zA-Z_$] [a-zA-Z0-9_$,]*
INT_LITERAL = [-]? [0-9]+
FLOAT_LITERAL = {INT_LITERAL} ( ( \.[0-9]+ ) ? ( [eE][-+]? [0-9]+ )? )
SKIP = [ \t\r\n]
OTHERS = .
%%

<YYINITIAL> "statement" {}

<YYINITIAL> {
"select " {IDENT} {
    System.out.println("aaa");
    os = new OneStatement();
    list.add(os);
    String fields = yytext().substring(7);
    String[] arr = fields.split(",");
    List<String> columns = new ArrayList<>();
    for(String s: arr) {
        columns.add(s);
    }
    os.setColumns(columns);
}

{SKIP} {}
"from " {IDENT} { os.setTableName(yytext().substring(5)); }

}
