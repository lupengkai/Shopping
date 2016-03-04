package com.shopping;

import java.sql.Timestamp;

/**
 * Created by tage on 3/3/16.
 */
public class SalesOrder {
    int id;
    User user;
    String addr;
    Timestamp oDate;
    Cart cart;
    int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Timestamp getoDate() {
        return oDate;
    }

    public void setoDate(Timestamp oDate) {
        this.oDate = oDate;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }


    public void save() {
        OrderMgr.getInstance().saveOrder(this);
    }

    public void updateStatus() {
        OrderMgr.getInstance().updateStatus(this);
    }
}
