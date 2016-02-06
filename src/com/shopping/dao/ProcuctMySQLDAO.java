package com.shopping.dao;

import com.shopping.Product;
import com.shopping.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * Created by tage on 2/3/16.
 */
public class ProcuctMySQLDAO implements ProductDAO {
    public List<Product> getProducts() {
        return null;
    }

    public List<Product> getProducts(int pageNo, int pageSize) {
        return null;
    }

    public List<Product> findProducts(int[] catagoryID,
                                      String name,
                                      String descr,
                                      double lowNormalPrice,
                                      double highNormalPrice,
                                      double lowMemberPrice,
                                      Date startDate,
                                      Date endDate,
                                      int pageNO,
                                      int pageSize
    ) {
        return null;
    }

    public List<Product> findProducts(String name) {
        return null;
    }

    public boolean deleteProductByCategoryId(int categoryId) {
        return false;
    }

    public boolean deleteProductById(int[] idArray) {
        return false;
    }

    public boolean updateProduct(Product product) {
        return false;
    }

    @Override
    public boolean addProduct(Product product) {
        Connection conn = null;
        PreparedStatement pStmt = null;
        try {
            conn = DB.getConn();
            String sql = null;
            sql = "insert into product values (null, ?, ?, ?, ?, ?,?)";
            pStmt = conn.prepareStatement(sql);
            pStmt.setString(1, product.getName());
            pStmt.setString(2, product.getDescr());
            pStmt.setDouble(3, product.getNormalPrice());
            pStmt.setDouble(4, product.getMemberPrice());
            pStmt.setTimestamp(5, product.getPdate());
            pStmt.setInt(6, product.getCategoryId());
            pStmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeStmt(pStmt);
            DB.closeConn(conn);
        }

        return true;
    }
}
