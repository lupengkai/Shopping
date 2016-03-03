<%@ page import="com.shopping.User" %>
<%@ page import="com.shopping.SalesOrder" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/3/16
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>


<jsp:useBean id="cart" class="com.shopping.Cart" scope="session"></jsp:useBean>

<%
    if (cart == null) {
        out.print("购物车里没有商品");
        return;
    }

    User u = (User) session.getAttribute("user");
    if (u == null) {
        u = new User();
        u.setId(-1);
    }

    String addr = request.getParameter("addr");
    SalesOrder so = new SalesOrder();
    so.setCart(cart);
    so.setAddr(addr);
    so.setUser(u);
    so.setoDate(new Timestamp(System.currentTimeMillis()));
    so.setStatus(0);

    so.save();

    session.removeAttribute("cart");
%>

<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>

谢谢购物，欢迎再来！


</body>
</html>
