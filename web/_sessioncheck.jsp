<%@ page import="com.shopping.User" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/24/16
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User)session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
