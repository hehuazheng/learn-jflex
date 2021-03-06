package com.hzz.mxsql;

import java.util.List;

public class OneStatement {
    private String tableName;
    private List<String> columns;

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<String> getColumns() {
        return columns;
    }

    public void setColumns(List<String> columns) {
        this.columns = columns;
    }

    @Override
    public String toString() {
        return tableName + columns;
    }
}
