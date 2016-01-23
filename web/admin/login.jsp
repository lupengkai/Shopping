<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/23/16
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    String action = request.getParameter("action");
    if (action != null && action.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null || !username.equals("admin")) {
            out.println("用户名错误");
        } else if (password == null || !password.equals("admin")) {
            out.println("密码错误");
        } else {
            session.setAttribute("admin", "true");
            response.sendRedirect("index.jsp");
        }

    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<form action="login.jsp" method="post" name="form">
    <input type="hidden" name="action" value="login">
    <table width="750" align="center" border="2">
        <tr>
            <td colspan="2" align="center">管理员登陆</td>
        </tr>
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username" size="30" maxlength="10"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" size="15" maxlength="12"></td>
        </tr>
        <tr>

        </tr>
        <tr>
            <td></td>
            <td>
                <input type="reset" value="重置">
                <input type="submit" value="提交">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
