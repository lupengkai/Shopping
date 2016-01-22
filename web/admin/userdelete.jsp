<%@ page import="com.shopping.User" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/22/16
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    out.print(id);
    User.deleteUser(id);
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
删除成功
</body>
</html>
