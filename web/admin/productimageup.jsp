<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/4/16
  Time: 6:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>File upload</title>
</head>
<body>
<form name="myform" action="/FileUpload" method="post"
      enctype="multipart/form-data">
    <input type="hidden" name="id" value="<%=id%>">
    File:<br>
    <input type="file" name="myfile"><br>
    <input type="submit" name="submit" value="Commit">
</form>
</body>
</html>