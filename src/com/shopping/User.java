package com.shopping;

import com.shopping.util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by tage on 1/17/16.
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String addr;
    private Timestamp rdate;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public void save() {
        Connection conn = null;
        PreparedStatement pStmt = null;
        conn = DB.getConn();
        String sql = "insert into ruser values ( null, ?, ?, ?, ?, ?); ";

        pStmt = DB.prepStmt(conn, sql);

        try {
            pStmt.setString(1, username);
            pStmt.setString(2, password);
            pStmt.setString(3, phone);
            pStmt.setString(4, addr);
            pStmt.setTimestamp(5, rdate);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }


    }

    public static List<User> getUsers() {
        List<User> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DB.getConn();
            String sql = "select * from ruser";
            rs = DB.executeQuery(conn,sql);
            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setAddr(rs.getString("addr"));
                u.setRdate(new Timestamp(System.currentTimeMillis()));
                list.add(u);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }

        return list;
    }
}
