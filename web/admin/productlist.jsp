<%@ page import="java.util.*" %>
<%@ page import="com.shopping.Product" %>
<%@ page import="com.shopping.ProductMgr" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 2/10/16
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
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
    List<Product> products = new ArrayList<>();
    int pageCount = ProductMgr.getInstance().getProducts(products, pageNo, PAGE_SIZE);

    if (pageNo > pageCount) {
        pageNo = pageCount;
        products = ProductMgr.getInstance().getProducts(pageNo, PAGE_SIZE);
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
        <td></td>
        <td>ID</td>
        <td>Name</td>
        <td>Normal Price</td>
        <td>Member Price</td>
        <td>Pdate</td>
        <td>Category ID</td>
        <td>����</td>
    </tr>
    <%
        for (Iterator<Product> it = products.iterator(); it.hasNext(); ) {
            Product p = it.next();
    %>
    <tr>
        <td>
            <img height="20" width="20" src="images/<%=p.getId()%>.jpg">
        </td>
        <td><%=p.getId()%>
        </td>
        <td><%=p.getName()%>
        </td>
        <td><%=p.getNormalPrice()%>
        </td>
        <td><%=p.getMemberPrice()%>
        </td>
        <td><%=p.getPdate()%>
        </td>
        <td><%=p.getCategoryId()%>
        </td>
        <td>
            <a href="productdelete.jsp?id=<%=p.getId()%>">ɾ</a>
            &nbsp;&nbsp;
            <a href="productmodify.jsp?id=<%=p.getId()%>">��</a>
            &nbsp;&nbsp;
            <a href="productimageup.jsp?id=<%=p.getId()%>">ͼƬ�ϴ�</a>

        </td>
    </tr>

    <%
        }
    %>
</table>

<center>
    <a href="productlist.jsp?pageNo=1">��ҳ</a>
    &nbsp;
    <a href="productlist.jsp?pageNo=<%=pageNo-1%>"> ��һҳ</a>
    &nbsp;
    ��<%=pageNo%>ҳ&nbsp;��<%=pageCount%>ҳ
    &nbsp;
    <a href="productlist.jsp?pageNo=<%=pageNo+1%>">��һҳ</a>
    &nbsp;
    <a href="productlist.jsp?pageNo=<%=pageCount%>">βҳ</a>

</center>

</body>
</html>
