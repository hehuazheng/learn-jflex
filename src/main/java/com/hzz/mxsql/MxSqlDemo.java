package com.hzz.mxsql;

import java.io.StringReader;

public class MxSqlDemo {
    public static void main(String[] args) throws Exception {
        StringReader sr = new StringReader("statement select name,age from t_person\nstatement select name2,age2 from t_person");
        MxSqlParser jt = new MxSqlParser(sr);
        jt.analysis();
        System.out.println(jt.getList());
    }
}
