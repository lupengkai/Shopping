package com.shopping;

import com.shopping.dao.ProcuctMySQLDAO;
import com.shopping.dao.ProductDAO;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * Created by tage on 2/3/16.
 */
public class ProductMgr {
    public static ProductMgr pm = null;
    private ProductDAO dao = null;

    static {
        if (pm == null) {
            pm = new ProductMgr();
            pm.setDao(new ProcuctMySQLDAO());
        }
    }

    public static ProductMgr getInstance() {
        return pm;
    }


    public ProductDAO getDao() {
        return dao;
    }

    public void setDao(ProductDAO dao) {
        this.dao = dao;
    }


    public List<Product> getProducts() {
        return dao.getProducts();
    }

    public List<Product> getProducts(int pageNo, int pageSize) {
        return dao.getProducts(pageNo, pageSize);
    }

    public int getProducts(List<Product> products, int pageNo, int pageSize) {
        return dao.getProducts(products, pageNo, pageSize);
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
        return dao.findProducts(list, catagoryID, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNO, pageSize);
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

    public boolean addProduct(Product product) {
        return dao.addProduct(product);
    }

    public Product loadByID(int id) {
        return dao.loadByID(id);
    }

    public boolean update(Product p) {
        return dao.updateProduct(p);
    }
}
