package com.shopping.dao;

import com.shopping.Product;
import com.shopping.util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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


    public int findProducts(List<Product> list, int[] catagoryID,
                            String keyWord,
                            double lowNormalPrice,
                            double highNormalPrice,
                            double lowMemberPrice,
                            double highMemberPrice,
                            Date startDate,
                            Date endDate,
                            int pageNO,
                            int pageSize
    ) {
        Connection conn = null;
        ResultSet rs = null;
        ResultSet rsCount = null;
        int pageCount = 0;
        try {
            conn = DB.getConn();
            String countSql = "";
            String sql = "select * from product where 1=1 ";
            String strID = "";
            if (catagoryID != null && catagoryID.length > 0) {
                strID += "(";
                for (int i = 0; i < catagoryID.length; i++) {
                    if (i < catagoryID.length - 1) {
                        strID += catagoryID[i] + ",";
                    } else
                        strID += catagoryID[i];
                }
                strID += ") ";
                sql += " and categoryid in " + strID;
            }

            if (keyWord != null && !keyWord.equals("")) {
                sql += " and (name like '%" + keyWord + "%' or descr like '%" + keyWord + "%') ";
            }

            if (lowNormalPrice >= 0) {
                sql += "and normalprice > " + lowNormalPrice;
            }

            if (highNormalPrice > 0) {
                sql += "and normalprice < " + highNormalPrice;
            }

            if (lowMemberPrice >= 0) {
                sql += "and memberprice > " + lowMemberPrice;
            }

            if (highMemberPrice > 0) {
                sql += "and memberprice < " + highMemberPrice;
            }

            if (startDate != null) {
                sql += "and pdate >= '" + new SimpleDateFormat("yyyy-MM-dd").format(startDate) + "'";
            }

            if (endDate != null) {
                sql += "and pdate <= '" + new SimpleDateFormat("yyyy-MM-dd").format(startDate) + "'";
            }
            countSql = sql.replaceFirst("select \\*", "select count(*) ");
            System.out.println(countSql);
            rsCount = DB.executeQuery(conn, countSql);
            rsCount.next();
            pageCount = (rsCount.getInt(1) + pageSize - 1) / pageSize;
            sql += "limit " + (pageNO - 1) * pageSize + " , " + pageSize;
            System.out.println(sql);
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
            DB.closeRs(rsCount);
            DB.closeConn(conn);
        }

        return pageCount;
    }

    @Override
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


