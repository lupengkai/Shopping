<%@ page import="com.shopping.Category" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/30/16
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    request.setCharacterEncoding("GBK");
    String action =request.getParameter("action");
    if (action != null && action.equals("add")) {
        String name = request.getParameter("name");
        String descr = request.getParameter("descr");
        Category.addTopCategory(name, descr);
        out.println("Congraduations! Add category OK!");
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<center>添加根类别</center>
<form name="form" action="categoryadd.jsp" method="post">
    <input type="hidden" name="action" value="add">
    <table border="1">
        <tr>
            <td>类别名称：</td>
            <td><input name="name" type="text"></td>
        </tr>
        <tr>
            <td>类别描述：</td>
            <td><textarea name="descr" rows="8" cols="40"></textarea></td>
        </tr>
    </table>
    <input type="submit" value="提交">
</form>
</body>
</html>
