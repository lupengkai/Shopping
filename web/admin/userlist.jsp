<%@ page import="java.util.List" %>
<%@ page import="com.shopping.User" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/21/16
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp"%>
<%
    List users = User.getUsers();
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<table align="center" border="1">
    <tr>
        <td>ID</td>
        <td>Username</td>
        <td>Phone</td>
        <td>Addr</td>
        <td>Rdate</td>
        <td>操作</td>
    </tr>
    <%
        for (Iterator<User> it = users.iterator(); it.hasNext(); ) {
            User u = it.next();
     %>
    <tr>

        <td><%=u.getId()%></td>
        <td><%=u.getUsername()%></td>
        <td><%=u.getPhone()%></td>
        <td><%=u.getAddr()%></td>
        <td><%=u.getRdate()%></td>
        <td><a href="userdelete.jsp?id=<%=u.getId()%>" target="detail">删</a> </td>
    </tr>

    <%
        }
    %>
</table>



</body>
</html>
