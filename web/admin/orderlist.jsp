<%@ page import="java.util.*" %>
<%@ page import="com.shopping.SalesOrder" %>
<%@ page import="com.shopping.OrderMgr" %>

<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp" %>
<%!
    private static final int PAGE_SIZE = 3;
%>
<%
    String strPageNo = request.getParameter("pageNo");
    int pageNo = 1;
    if (strPageNo != null && Integer.parseInt(strPageNo) > 1) {
        pageNo = Integer.parseInt(strPageNo);
    }


%>


<%
    List<SalesOrder> orders = new ArrayList<>();
    int pageCount = OrderMgr.getInstance().getOrders(orders, pageNo, PAGE_SIZE);

    if (pageNo > pageCount) {
        pageNo = pageCount;
        OrderMgr.getInstance().getOrders(orders, pageNo, PAGE_SIZE);
    }
    //List products = ProductMgr.getInstance().getProducts(pageNo,PAGE_SIZE);
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<table align="center" border="1">
    <tr>
        <td>ID</td>
        <td>UserID</td>
        <td>Address</td>
        <td>Order Date</td>
        <td>Status</td>
        <td>操作</td>
    </tr>
    <%
        for (Iterator<SalesOrder> it = orders.iterator(); it.hasNext(); ) {
            SalesOrder so = it.next();
    %>
    <tr>

        <td><%=so.getId()%>
        </td>
        <td><%=so.getUser().getId()%>
        </td>
        <td><%=so.getAddr()%>
        </td>
        <td><%=so.getoDate()%>
        </td>
        <td><%=so.getStatus()%>
        </td>
        </td>
        <td>
            <a href="orderdetailshow.jsp?id=<%=so.getId()%>">订单明细</a>
            &nbsp;&nbsp;
            <a href="ordermodify.jsp?id=<%=so.getId()%>">订单修改</a>

        </td>
    </tr>

    <%
        }
    %>
</table>

<center>
    <a href="orderlist.jspt.jsp?pageNo=1">首页</a>
    &nbsp;
    <a href="orderlist.jsp.jsp?pageNo=<%=pageNo-1%>"> 上一页</a>
    &nbsp;
    第<%=pageNo%>页&nbsp;共<%=pageCount%>页
    &nbsp;
    <a href="orderlist.jsp?pageNo=<%=pageNo+1%>">下一页</a>
    &nbsp;
    <a href="orderlist.jsp?pageNo=<%=pageCount%>">尾页</a>

</center>

</body>
</html>
