<%@ page import="com.shopping.CartItem" %>
<%@ page import="com.shopping.Product" %>
<%@ page import="com.shopping.ProductMgr" %>
<%@ page import="com.shopping.Cart" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/2/16
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    request.setCharacterEncoding("gbk");
    String strId = request.getParameter("id");
    int id = 1;
    if (strId != null) {
        id = Integer.parseInt(strId);
    }

    CartItem ci = new CartItem();
    Product p = ProductMgr.getInstance().loadByID(id);
    ci.setProductId(id);
    ci.setCount(1);
    ci.setPrice(p.getNormalPrice());

  /*  Cart cart = (Cart)session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart",cart);
    }*/
%>
<jsp:useBean id="cart" class="com.shopping.Cart" scope="session"></jsp:useBean>

<%
    cart.add(ci);
    response.sendRedirect("cart.jsp");
%>
