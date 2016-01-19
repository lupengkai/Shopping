package com.shopping;

import com.shopping.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by tage on 1/17/16.
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String phone;
    private String addr;
    private Date rdate;


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

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public void save() {
        Connection conn = DB.getConnection();
        String sql = "insert into user value ( null, ?, ?, ?, ?, ?); ";

        PreparedStatement pStmt = DB.prepStmt(conn, sql);

        try {
            pStmt.setString(1, username);
            pStmt.setString(2, password);
            pStmt.setString(3, phone);
            pStmt.setString(4, addr);
            pStmt.setTimestamp(5, new Timestamp(rdate.getTime()));
            pStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
