<%@ page import="com.shopping.User" %>
<%@ page import="com.shopping.UserNotFoundException" %>
<%@ page import="com.shopping.PasswordNotCorrectException" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/24/16
  Time: 3:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    String action = request.getParameter("action");
    if (action != null && action.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User u = null;
        try {
            u = User.validate(username, password);
        } catch (UserNotFoundException e) {
            out.println("User not Found!");
            return;

        } catch (PasswordNotCorrectException e) {
            out.println("Password not Correct!");
            return;
        }
        session.setAttribute("user", u);
        response.sendRedirect("selfservice.jsp");

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
            <td colspan="2" align="center">�û���½</td>
        </tr>
        <tr>
            <td>�û���</td>
            <td><input type="text" name="username" size="30" maxlength="10"></td>
        </tr>
        <tr>
            <td>����</td>
            <td><input type="password" name="password" size="15" maxlength="12"></td>
        </tr>
        <tr>

        </tr>
        <tr>
            <td></td>
            <td>
                <input type="reset" value="����">
                <input type="submit" value="�ύ">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
