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
        <td></td>
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
        <td></td>
    </tr>

    <%
        }
    %>
</table>



</body>
</html>
