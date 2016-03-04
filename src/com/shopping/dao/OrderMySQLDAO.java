package com.shopping.dao;


import com.shopping.*;
import com.shopping.util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by tage on 3/3/16.
 */
public class OrderMySQLDAO {
    public void saveOrder(SalesOrder so) {

        Connection conn = null;
        PreparedStatement pStmt = null;
        ResultSet rsKey = null;
        try {
            conn = DB.getConn();
            conn.setAutoCommit(false);
            String sql = null;
            sql = "insert into salesorder values (null, ?, ?, ?, ?)";
            pStmt = DB.getPstmt(conn, sql, true);
            pStmt.setInt(1, so.getUser().getId());
            pStmt.setString(2, so.getAddr());
            pStmt.setTimestamp(3, so.getoDate());
            pStmt.setInt(4, so.getStatus());
            pStmt.executeUpdate();
            rsKey = pStmt.getGeneratedKeys();
            rsKey.next();
            int key = rsKey.getInt(1);

            String sqlItem = "insert into salesitem values (null, ?, ?, ?, ?)";
            pStmt = conn.prepareStatement(sqlItem);
            Cart c = so.getCart();
            List<CartItem> items = c.getItems();
            for (int i = 0; i < items.size(); i++) {
                CartItem ci = items.get(i);
                pStmt.setInt(1, ci.getProductId());
                pStmt.setDouble(2, ci.getPrice());
                pStmt.setInt(3, ci.getCount());
                pStmt.setInt(4, key);
                pStmt.addBatch();
            }
            pStmt.executeBatch();

            conn.commit();
            conn.setAutoCommit(true);

        } catch (SQLException e) {
            e.printStackTrace();

            try {
                conn.rollback();
                conn.setAutoCommit(true);
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            DB.closeRs(rsKey);
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }

    }


    public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
        Connection conn = null;
        ResultSet rsCount = null;
        ResultSet rs = null;
        int pageCount = 0;

        try {
            conn = DB.getConn();
            rsCount = DB.executeQuery(conn, "select count(*) from salesorder");
            rsCount.next();
            pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
            String sql = "select * from salesorder limit " + (pageNo - 1) * pageSize + " , " + pageSize;
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                SalesOrder so = new SalesOrder();
                so.setId(rs.getInt("id"));
                if (rs.getInt("userid") == -1) {
                    User u = new User();
                    u.setId(-1);
                    u.setUsername("Guest");
                    so.setUser(u);
                } else {
                    so.setUser(User.loadById(rs.getInt("userid")));
                }
                so.setAddr(rs.getString("addr"));
                so.setoDate(rs.getTimestamp("odate"));
                so.setStatus(rs.getInt("status"));

                orders.add(so);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeRs(rsCount);
            DB.closeConn(conn);
        }

        return pageCount;
    }

    public SalesOrder loadById(int id) {
        SalesOrder so = null;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String sql = null;
        try {
            conn = DB.getConn();
            sql = "select * from salesorder where id = " + id;
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                so = new SalesOrder();
                so.setId(rs.getInt("id"));
                if (rs.getInt("userid") == -1) {
                    User u = new User();
                    u.setUsername("Guest");
                    u.setId(-1);
                    so.setUser(u);
                } else {
                    so.setUser(User.loadById(rs.getInt("userid")));
                }
                so.setAddr(rs.getString("addr"));
                so.setoDate(rs.getTimestamp("odate"));
                so.setStatus(rs.getInt("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeStmt(stmt);
            DB.closeConn(conn);
        }
        return so;

    }

    public List<SalesItem> getSalesItems(SalesOrder order) {
        List<SalesItem> items = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DB.getConn();
            String sql = "select * from salesitem where orderid = " + order.getId();
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                SalesItem si = new SalesItem();
                si.setId(rs.getInt("id"));
                si.setProduct(ProductMgr.getInstance().loadByID(rs.getInt("productid")));
                si.setUnitPrice(rs.getDouble("unitprice"));
                si.setCount(rs.getInt("pcount"));
                si.setSalesOrder(OrderMgr.getInstance().loadById(rs.getInt("orderid")));
                items.add(si);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }

        return items;
    }

    public void updateStatus(SalesOrder salesOrder) {
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DB.getConn();
            stmt = conn.createStatement();
            String sql = "update salesorder set status = " + salesOrder.getStatus() + " where id = " + salesOrder.getId();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(stmt);
            DB.closeConn(conn);
        }

    }
}
