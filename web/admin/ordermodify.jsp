<%@ page import="com.shopping.OrderMgr" %>
<%@ page import="com.shopping.SalesOrder" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/4/16
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    SalesOrder so = OrderMgr.getInstance().loadById(id);

    String action = request.getParameter("action");
    if (action != null && !action.equals("")) {
        int status = Integer.parseInt(request.getParameter("status"));
        so.setStatus(status);
        so.updateStatus();
    }

%>

<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
订单号：<%=so.getId()%>
<form name="form" action="ordermodify.jsp" method="post">
    <input type="hidden" name="action" valu e="modify">
    <input type="hidden" name="id" value="<%=id%>">
    <select name="status">
        <option value="0">未处理</option>
        <option value="1">已处理</option>
        <option value="2">废单</option>
    </select>


    <%--  <script type="text/javascript">
          for (var option in document.forms("form").status.options) {
              if(option.value == <%=so.getStatus()%>) {
                  document.forms("form").status.selectedIndex = option.index;
              }

          }
      </script>--%>

    <input type="submit" value="提交">
</form>
</body>
</html>
