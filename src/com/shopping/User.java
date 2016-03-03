package com.shopping;

import com.shopping.util.DB;
import com.sun.xml.internal.bind.v2.TODO;

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
        String sql = "insert into ruser values ( null, ?, ?, ?, ?, ?)";

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


    public static User loadById(int id) {
        User u = null;
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DB.getConn();
            String sql = "SELECT * from ruser where id = " + id;
            rs = DB.executeQuery(conn, sql);
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setAddr(rs.getString("addr"));
                u.setRdate(rs.getTimestamp("rdate"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }


        return u;
    }
    public static List<User> getUsers() {
        List<User> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DB.getConn();
            String sql = "select * from ruser";
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setAddr(rs.getString("addr"));
                u.setRdate(rs.getTimestamp("rdate"));
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

    public static void deleteUser(int id) {
        Connection conn = null;
        Statement stmt = null;

        try {
            conn = DB.getConn();
            stmt = DB.getStmt(conn);
            stmt.executeUpdate("DELETE FROM ruser WHERE id = " + id);


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(stmt);
            DB.closeConn(conn);
        }
    }

    public static User validate(String username, String password) throws UserNotFoundException, PasswordNotCorrectException {
        Connection conn = null;
        ResultSet rs = null;
        User u = null;

        try {
            conn = DB.getConn();
            String sql = "select * from ruser where username = '" + username + "'";
            rs = DB.executeQuery(conn, sql);
            if (!rs.next()) {
                throw new UserNotFoundException();
            } else if (!rs.getString("password").equals(password)) {
                throw new PasswordNotCorrectException();
            } else {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setPhone(rs.getString("phone"));
                u.setAddr(rs.getString("addr"));
                u.setRdate(rs.getTimestamp("rdate"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }
        return u;

    }

    public void update() {
        Connection conn = null;
        PreparedStatement pStmt = null;
        conn = DB.getConn();
        String sql = "update ruser set username = ?, phone = ?, addr = ? where id = " + this.getId();

        pStmt = DB.prepStmt(conn, sql);

        try {
            pStmt.setString(1, username);
            pStmt.setString(2, phone);
            pStmt.setString(3, addr);
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }


    }

}
