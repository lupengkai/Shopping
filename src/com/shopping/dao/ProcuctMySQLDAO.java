package com.shopping.dao;

import com.shopping.Product;
import com.shopping.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by tage on 2/3/16.
 */
public class ProcuctMySQLDAO implements ProductDAO {
    public List<Product> getProducts() {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DB.getConn();
            String sql = "select * from product";
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescr(rs.getString("descr"));
                p.setNormalPrice(rs.getDouble("normalprice"));
                p.setMemberPrice(rs.getDouble("memberprice"));
                p.setPdate(rs.getTimestamp("pdate"));
                p.setCategoryId(rs.getInt("categoryid"));

                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }

        return list;
    }

    public List<Product> getProducts(int pageNo, int pageSize) {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        ResultSet rs = null;

        try {
            conn = DB.getConn();
            String sql = "select * from product limit " + (pageNo - 1) * pageSize + " , " + pageSize;
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescr(rs.getString("descr"));
                p.setNormalPrice(rs.getDouble("normalprice"));
                p.setMemberPrice(rs.getDouble("memberprice"));
                p.setPdate(rs.getTimestamp("pdate"));
                p.setCategoryId(rs.getInt("categoryid"));

                list.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeConn(conn);
        }

        return list;
    }

    @Override
    public int getProducts(List<Product> products, int pageNo, int pageSize) {
        Connection conn = null;
        ResultSet rsCount = null;
        ResultSet rs = null;
        int pageCount = 0;

        try {
            conn = DB.getConn();
            rsCount = DB.executeQuery(conn, "select count(*) from product");
            rsCount.next();
            pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
            String sql = "select * from product limit " + (pageNo - 1) * pageSize + " , " + pageSize;
            rs = DB.executeQuery(conn, sql);
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescr(rs.getString("descr"));
                p.setNormalPrice(rs.getDouble("normalprice"));
                p.setMemberPrice(rs.getDouble("memberprice"));
                p.setPdate(rs.getTimestamp("pdate"));
                p.setCategoryId(rs.getInt("categoryid"));

                products.add(p);
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


