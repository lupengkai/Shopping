package com.shopping;

import com.shopping.dao.OrderMySQLDAO;

import java.util.List;

/**
 * Created by tage on 3/3/16.
 */
public class OrderMgr {
    private static OrderMgr om = null;

    private OrderMySQLDAO dao = null;

    public OrderMySQLDAO getDao() {
        return dao;
    }

    public void setDao(OrderMySQLDAO dao) {
        this.dao = dao;
    }

    static {
        if (om == null) {
            om = new OrderMgr();
            om.setDao(new OrderMySQLDAO());
        }
    }

    public static OrderMgr getInstance() {
        return om;
    }

    public void saveOrder(SalesOrder salesOrder) {
        dao.saveOrder(salesOrder);
    }

    public int getOrders(List<SalesOrder> orders, int pageNo, int pageSize) {
        return dao.getOrders(orders, pageNo, pageSize);
    }

    public SalesOrder loadById(int id) {
        return dao.loadById(id);
    }

    public List<SalesItem> getSalesItems(SalesOrder order) {
        return dao.getSalesItems(order);
    }

    public void updateStatus(SalesOrder salesOrder) {
        dao.updateStatus(salesOrder);
    }
}
