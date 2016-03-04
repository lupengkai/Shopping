package com.shopping;

import java.util.List;

/**
 * Created by tage on 3/4/16.
 */
public class SalesItem {
    int id;
    Product product;
    double unitPrice;
    int count;
    SalesOrder salesOrder;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public double getTotalPrice() {
        return unitPrice * count;
    }

    public SalesOrder getSalesOrder() {
        return salesOrder;
    }

    public void setSalesOrder(SalesOrder salesOrder) {
        this.salesOrder = salesOrder;
    }

    public static List<SalesItem> getItems(SalesOrder order) {
        return OrderMgr.getInstance().getSalesItems(order);
    }

}
