<%@ page import="com.shopping.Product" %>
<%@ page import="com.shopping.ProductMgr" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/1/16
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>

<%
    request.setCharacterEncoding("GBK");
    String strId = request.getParameter("id");
    int id = Integer.parseInt(strId);

    Product p = ProductMgr.getInstance().loadByID(id);
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<center>产品细节</center>
<table align="center" border="1">
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Normal Price</td>
        <td>Member Price</td>
        <td>Pdate</td>
        <td>Category ID</td>
        <td>操作</td>
    </tr>
    <tr>

        <td><%=p.getId()%>
        </td>
        <td><%=p.getName()%>
        </td>
        <td><%=p.getNormalPrice()%>
        </td>
        <td><%=p.getMemberPrice()%>
        </td>
        <td><%=p.getPdate()%>
        </td>
        <td><%=p.getCategoryId()%>
        </td>
        <td>
            <a href="buy.jsp?id=<%=p.getId()%>">我买了</a>

        </td>
    </tr>

</table>


</body>
</html>
