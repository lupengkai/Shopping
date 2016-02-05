package com.shopping.dao;

import com.shopping.Product;

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
        return false;
    }
}
