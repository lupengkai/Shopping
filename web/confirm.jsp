<%@ page import="com.shopping.User" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/2/16
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        out.println("δ��¼���Ƿ��������");
%>
<a href="confirmusenormal.jsp">����</a> <br>
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

</body>
</html>
