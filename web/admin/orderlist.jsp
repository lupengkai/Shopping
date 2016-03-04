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
        <td>����</td>
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
            <a href="orderdetailshow.jsp?id=<%=so.getId()%>">������ϸ</a>
            &nbsp;&nbsp;
            <a href="ordermodify.jsp?id=<%=so.getId()%>">�����޸�</a>

        </td>
    </tr>

    <%
        }
    %>
</table>

<center>
    <a href="orderlist.jspt.jsp?pageNo=1">��ҳ</a>
    &nbsp;
    <a href="orderlist.jsp.jsp?pageNo=<%=pageNo-1%>"> ��һҳ</a>
    &nbsp;
    ��<%=pageNo%>ҳ&nbsp;��<%=pageCount%>ҳ
    &nbsp;
    <a href="orderlist.jsp?pageNo=<%=pageNo+1%>">��һҳ</a>
    &nbsp;
    <a href="orderlist.jsp?pageNo=<%=pageCount%>">βҳ</a>

</center>

</body>
</html>
