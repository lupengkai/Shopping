<%@ page import="com.shopping.SalesOrder" %>
<%@ page import="com.shopping.OrderMgr" %>
<%@ page import="com.shopping.SalesItem" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopping.ProductMgr" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/3/16
  Time: 11:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    SalesOrder so = OrderMgr.getInstance().loadById(id);

%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
    <script type="text/javascript">
        function showProductInfo(descr) {
            document.getElementById("productinfo").innerHTML = "<font size=3 color=red>" + descr + "</font>";
        }
    </script>
</head>
<body>
<center>
    订单号：<%=so.getId()%><br>
    下单人：<%=so.getUser().getUsername()%><br>

    明细：<br>
    <table border="1">
        <tr>
            <td>
                商品名称
            </td>
            <td>
                商品价格
            </td>
            <td>
                商品数量
            </td>
            <td>
                总价
            </td>
        </tr>
        <%
            List<SalesItem> items = SalesItem.getItems(so);
            double sum = 0.0;
            for (int i = 0; i < items.size(); i++) {
                SalesItem si = items.get(i);

        %>
        <tr>
            <td onmouseover="showProductInfo(<%=si.getProduct().getDescr()%>)">
                <%=si.getProduct().getName()%>
            </td>
            <td>
                <%=si.getUnitPrice()%>
            </td>
            <td>
                <%=si.getCount()%>
            </td>
            <td>
                <%=si.getTotalPrice()%>
                <%
                    sum += si.getTotalPrice();
                %>
            </td>
        </tr>
        <%
            }
        %>


    </table>
    共<%=Math.round(sum * 100) / 100.0%>元 <br>
    订单状态<%=so.getStatus()%>
</center>

<div style="border: 5px double purple; width: 400px;" id="productinfo">
    &nbsp;
</div>
</body>
</html>
