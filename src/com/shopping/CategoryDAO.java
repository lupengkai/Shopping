package com.shopping;

import com.shopping.util.DB;

import java.sql.*;

/**
 * Created by tage on 1/25/16.
 */
public class CategoryDAO {
    public static void save(Category c) {
        Connection conn = null;
        PreparedStatement pStmt = null;
        try {
            conn = DB.getConn();
            String sql = "insert into category values (?, ?, ?, ?, ?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, c.getId());
            pStmt.setString(2, c.getName());
            pStmt.setString(3,c.getDescr());
            pStmt.setInt(4,c.isLeaf()? 0:1);
            pStmt.setInt(5, c.getGrade());
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }
    }
}
