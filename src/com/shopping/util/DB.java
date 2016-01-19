package com.shopping.util;

import java.sql.*;

/**
 * Created by tage on 1/17/16.
 */
public class DB {
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private DB() {
    }

    ;

    public static Connection getConnection() {
        Connection coon = null;
        try {
            coon = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping?user=root&password=0715");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coon;

    }

    public static void closeConnection(Connection coon) {
        if (coon != null) {
            try {
                coon.close();
                coon = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static Statement getStmt(Connection coon) {
        Statement stmt = null;
        try {
            stmt = coon.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stmt;
    }

    public static void closeStmt(Statement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
                stmt = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
    public static PreparedStatement prepStmt(Connection coon,String sql) {
        PreparedStatement pStmt = null;
        try {
            pStmt = coon.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pStmt;
    }

    public static void closePStmt(PreparedStatement pStmt) {
        if (pStmt != null) {
            try {
                pStmt.close();
                pStmt = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }

    public static ResultSet executeQuery(Statement stmt, String sql) {
        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  rs;
    }

    public static void closeResultSet(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
                rs = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public static void main(String args[]) {
        Statement stmt = DB.getStmt(DB.getConnection());
        String sql = "select * from user";
        ResultSet rs = DB.executeQuery(stmt, sql);

        try {
            rs.next();
            System.out.println(rs.getString(1));
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

}
