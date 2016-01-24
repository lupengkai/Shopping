<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/24/16
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK"  import="com.shopping.*" %>
<%@ page import="com.shopping.util.DB" %>

<%
    User u = (User)session.getAttribute("user");
    if (u == null) {
        out.println("You havn't logined in!");
        return;
    }
    request.setCharacterEncoding("GBK");

    String action = request.getParameter("action");
    if (action != null && action.equals("register")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String addr = request.getParameter("addr");
        u.setUsername(username);
        u.setPhone(phone);
        u.setAddr(addr);
        u.update();
        out.print("test");
        %>
<center>Modify OK!</center>
<%
        return;
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title>用户信息修改</title>
    <script language="JavaScript" src="script/regcheckdata.js"></script>
</head>
<body>

<form name="form" action="usermodify.jsp" method="post" onSubmit="return checkdata()">
    <input type="hidden" name="action" value="register">
    <table width="750" border="2">
        <caption>用户信息修改</caption>
        <tr>
            <td>用户名</td>
            <td>
                <input type="txt" name="username" size="30" maxlength="10" value="<%=u.getUsername()%>">
            </td>
        </tr>
    <%--    <tr>
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
        </tr>--%>

        <tr>
            <td>电话</td>
            <td>
                <input type="text" name="phone" size="15" maxlength="12" value="<%=u.getPhone()%>">
            </td>
        </tr>
        <tr>
            <td>地址</td>
            <td>
                <textarea rows="12" cols="80" name="addr" wrap="hard" ><%=u.getAddr()%></textarea>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="submit" value="提交">
                <input type="reset" value="重置">
            </td>
        </tr>

    </table>

</form>
</body>
</html>
