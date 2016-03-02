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
        out.println("未登录，是否继续购买");
%>
<a href="confirmusenormal.jsp">继续</a> <br>
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

</body>
</html>
