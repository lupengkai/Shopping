package com.shopping.mytag;

import com.shopping.Product;
import com.shopping.ProductMgr;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.List;

/**
 * Created by tage on 3/6/16.
 */
public class ProductList extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
        List<Product> list = ProductMgr.getInstance().getProducts();
        for (int i = 0; i < list.size(); i++) {

            this.getJspContext().getOut().write(list.get(i).getName() + "<br>");
        }
    }
}
