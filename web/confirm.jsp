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
        out.print("���ﳵ��û����Ʒ");
        return;
    }
%>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        out.println("δ��¼���Ƿ��������");
%>

<%--<a href="confirmusenormal.jsp">����</a> <br>--%>
<a href="login.jsp">��¼</a>
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
            ��Ʒ����
        </td>
        <td>
            ��Ʒ�۸�<%=(u == null ? "(�г���)" : "(��Ա��)")%>
        </td>
        <td>
            ��Ʒ����
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
��<%=Math.round(cart.getTotalPrice() * 100) / 100.0%>Ԫ <br>

<%
    if (u != null) {
%>
��ӭ����<%=u.getUsername()%>��ȷ�������ͻ���Ϣ<br>
<%
    }
%>
<form action="order.jsp" method="post">
    �ͻ���Ϣ��<br>
    <textarea name="addr"> <%= u == null ? "" : u.getAddr()%></textarea>
    <input type="submit" value="�µ�">

</form>

</body>
</html>
