<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/23/16
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String admin = (String)session.getAttribute("admin");
    if (admin == null || !admin.equals("true")) {
        response.sendRedirect("login.jsp");
    }
%>