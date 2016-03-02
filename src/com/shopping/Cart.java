package com.shopping;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by tage on 3/2/16.
 */
public class Cart {
    private List<CartItem> items = new ArrayList<>();

    public List<CartItem> getItems() {
        return items;
    }

    public void add(CartItem cartItem) {
        for (int i = 0; i < items.size(); i++) {
            CartItem ci = items.get(i);
            if (ci.getProductId() == cartItem.getProductId()) {
                ci.setCount(ci.getCount() + 1);
                return;
            }
        }
        items.add(cartItem);
    }

    public double getTotalPrice() {
        double totalPrice = 0.0;
        for (int i = 0; i < items.size(); i++) {
            CartItem ci = items.get(i);
            totalPrice += ci.getTotalPrice();
        }
        return totalPrice;
    }

}
