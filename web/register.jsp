<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/17/16
  Time: 11:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK"  import="com.shopping.*" %>
<%@ page import="com.shopping.util.DB" %>
<%@ page import="java.sql.Timestamp" %>
<%
    request.setCharacterEncoding("GBK");
    String action = request.getParameter("action");
    if (action != null && action.equals("register")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setPhone(phone);
        u.setAddr(addr);
        u.setRdate(new Timestamp(System.currentTimeMillis()));
        u.save();
        out.print("test");
%>
<center>Register OK!</center>

<%
        return;
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title>用户注册</title>
    <script language="JavaScript" src="script/regcheckdata.js"></script>
</head>
<body>

<form name="form" action="register.jsp" method="post" onSubmit="return checkdata()">
    <input type="hidden" name="action" value="register">
    <table width="750" border="2">
        <caption>用户注册</caption>
        <tr>
            <td>用户名</td>
            <td>
                <input type="txt" name="username" size="30" maxlength="10" onblur="" id=" ">
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td>
                <input type="password" name="password" size="15" maxlength="12">
            </td>
        </tr>
        <tr>
            <td>密码确认</td>
            <td>
                <input type="password" name="password2" size="15" maxlength="12">
            </td>
        </tr>

        <tr>
            <td>电话</td>
            <td>
                <input type="text" name="phone" size="15" maxlength="12">
            </td>
        </tr>
        <tr>
            <td>地址</td>
            <td>
                <textarea rows="12" cols="80" name="addr" wrap="hard"></textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="提交">
                <input type="reset" value="重置">
                <input type="button" value="ok">
            </td>
        </tr>

    </table>

</form>
</body>
</html>
