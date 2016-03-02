<%@ page import="java.util.List" %>
<%@ page import="com.shopping.CartItem" %>
<%@ page import="com.shopping.ProductMgr" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/2/16
  Time: 4:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<center>您已经买了</center>
<form action="cartupdate.jsp" method="post">
    <table border="1">
        <tr>
            <td>
                商品名称
            </td>
            <td>
                商品价格
            </td>
            <td>
                商品数量
            </td>
            <td>

            </td>
        </tr>
        <jsp:useBean id="cart" class="com.shopping.Cart" scope="session"></jsp:useBean>
        <%
            List<CartItem> cartItems = cart.getItems();
            for (int i = 0; i < cartItems.size(); i++) {
                CartItem ci = cartItems.get(i);

        %>
        <tr>
            <td>
                <%=ProductMgr.getInstance().loadByID(ci.getProductId()).getName()%>
            </td>
            <td>
                <%=ci.getPrice()%>
            </td>
            <td>
                <input type="text" name="p<%=ci.getProductId()%>" value="<%=ci.getCount()%>">
            </td>
            <td></td>
        </tr>
        <%
            }
        %>


    </table>
    <center>
        共<%=Math.round(cart.getTotalPrice() * 100) / 100.0%>元 <br>
        <input type="submit" value="修改数量">
        <input type="button" value="确认订单" onclick="document.location.href='confirm.jsp'">
    </center>
</form>
</body>
</html>
