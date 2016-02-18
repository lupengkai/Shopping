package com.shopping;

import com.shopping.util.DB;

import java.sql.*;
import java.util.List;

/**
 * Created by tage on 1/25/16.
 */
public class CategoryDAO {
    public static void save(Category c) {
        Connection conn = null;
        PreparedStatement pStmt = null;
        try {
            conn = DB.getConn();
            String sql = null;
            if (c.getId() == -1) {
                sql = "insert into category values (null, ?, ?, ?, ?, ?)";
            } else sql = "INSERT INTO category VALUES ( " + c.getId() + ", ?, ?, ?, ?, ?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, c.getPid());
            pStmt.setString(2, c.getName());
            pStmt.setString(3, c.getDescr());
            pStmt.setInt(4, c.isLeaf() ? 0 : 1);
            pStmt.setInt(5, c.getGrade());
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }
    }

    public static void getCategories(List<Category> list, int pid) {
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = DB.getConn();
            String sql = "SELECT * from category WHERE pid = " + pid;
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setPid(rs.getInt("pid"));
                c.setDescr(rs.getString("descr"));
                c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
                c.setGrade(rs.getInt("grade"));
                list.add(c);
                if (!c.isLeaf()) {
                    getCategories(list, c.getId());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }

    }


    public static int getGrade(int id) {
        Connection conn = null;
        ResultSet rs = null;
        int grade = -1;
        try {
            conn = DB.getConn();
            String sql = "SELECT * from category WHERE id = " + id;
            rs = DB.executeQuery(conn, sql);
            rs.next();
            grade = rs.getInt("grade");

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }
        return grade;

    }


    public static void addChild(Category c) {
        Connection conn = null;
        PreparedStatement pStmt = null;
        Statement stmt = null;
        try {
            conn = DB.getConn();
            conn.setAutoCommit(false);
            String sql = null;
            if (c.getId() == -1) {
                sql = "insert into category values (null, ?, ?, ?, ?, ?)";
            } else sql = "INSERT INTO category VALUES ( " + c.getId() + ", ?, ?, ?, ?, ?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setInt(1, c.getPid());
            pStmt.setString(2, c.getName());
            pStmt.setString(3, c.getDescr());
            pStmt.setInt(4, 0);
            pStmt.setInt(5, c.getGrade());
            pStmt.executeUpdate();
            stmt = DB.getStmt(conn);
            stmt.executeUpdate("UPDATE category SET isleaf = 1 WHERE id = " + c.getPid());
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            DB.closeStmt(stmt);
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }
    }

    public static Category loadById(int id) {
        Connection conn = null;
        ResultSet rs = null;
        Category c = null;
        try {
            conn = DB.getConn();
            String sql = "SELECT * from category WHERE id = " + id;
            rs = DB.executeQuery(conn, sql);
            if (rs.next()) {
                c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setPid(rs.getInt("pid"));
                c.setDescr(rs.getString("descr"));
                c.setLeaf(rs.getInt("isleaf") == 0 ? true : false);
                c.setGrade(rs.getInt("grade"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }
        return c;

    }

}
