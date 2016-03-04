<%@ page import="java.util.List" %>
<%@ page import="com.shopping.*" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/2/16
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        out.print("购物车里没有商品");
        return;
    }
%>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        out.println("未登录，是否继续购买");
%>

<%--<a href="confirmusenormal.jsp">继续</a> <br>--%>
<a href="login.jsp">登录</a>
<%
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<table border="1">
    <tr>
        <td>
            商品名称
        </td>
        <td>
            商品价格<%=(u == null ? "(市场价)" : "(会员价)")%>
        </td>
        <td>
            商品数量
        </td>
        <td>

        </td>
    </tr>
    <%
        List<CartItem> cartItems = cart.getItems();
        for (int i = 0; i < cartItems.size(); i++) {
            CartItem ci = cartItems.get(i);
            Product p = ProductMgr.getInstance().loadByID(ci.getProductId());

    %>
    <tr>
        <td>
            <%=ProductMgr.getInstance().loadByID(ci.getProductId()).getName()%>
        </td>
        <td>
            <%= u == null ? p.getNormalPrice() : p.getMemberPrice()%>
        </td>
        <td>
            <%=ci.getCount()%>
        </td>
        <td></td>
    </tr>
    <%
        }
    %>


</table>
共<%=Math.round(cart.getTotalPrice() * 100) / 100.0%>元 <br>

<%
    if (u != null) {
%>
欢迎您，<%=u.getUsername()%>请确认您的送货信息<br>
<%
    }
%>
<form action="order.jsp" method="post">
    送货信息：<br>
    <textarea name="addr"> <%= u == null ? "" : u.getAddr()%></textarea>
    <input type="submit" value="下单">

</form>

</body>
</html>
