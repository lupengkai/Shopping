<%@ page import="com.shopping.User" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/22/16
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    out.print(id);
    User.deleteUser(id);
    //TODO ɾ���û�ˢ��userlist
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
ɾ���ɹ�

</body>
</html>
