<%@ page import="com.shopping.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 2/1/16
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp"%>
<%
    List<Category> categories = Category.getAllCategories();
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
        <td>Name</td>
        <td>Pid</td>
        <td>Grade</td>
        <td>Add</td>
    </tr>
    <%
        for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
            Category c = it.next();
            String preStr = "";
            for (int grade = c.getGrade();grade > 1; grade --) {
                preStr  = preStr + "***";
            }
    %>
    <tr>

        <td><%=c.getId()%></td>
        <td><%=preStr + c.getName()%></td>
        <td><%=c.getPid()%></td>
        <td><%=c.getGrade()%></td>
        <td><a href="categoryadd.jsp?pid=<%=c.getId()%>" >添加子目录</a> </td>
    </tr>

    <%
        }
    %>
</table>



</body>
</html>