package com.shopping.dao;


import com.shopping.Cart;
import com.shopping.CartItem;
import com.shopping.SalesOrder;
import com.shopping.util.DB;

import java.sql.*;
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


}
