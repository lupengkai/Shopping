<%@ page import="java.util.DoubleSummaryStatistics" %>
<%@ page import="com.shopping.Product" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.shopping.ProductMgr" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 2/5/16
  Time: 4:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp" %>
<%
    request.setCharacterEncoding("GBK");
    String action = request.getParameter("action");
    if (action != null && action.equals("add")) {
        String name = request.getParameter("name");
        String descr = request.getParameter("descr");
        Double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
        Double memberprice = Double.parseDouble(request.getParameter("memberprice"));
        int categoryId = Integer.parseInt(request.getParameter("categoryid"));
        Product p = new Product();
        p.setName(name);
        p.setDescr(descr);
        p.setNormalPrice(normalPrice);
        p.setMemberPrice(memberprice);
        p.setPdate(new Timestamp(System.currentTimeMillis()));
        p.setCategoryId(categoryId);
        ProductMgr.getInstance().addProduct(p);
        out.println("Congraduations! Add category OK!");
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<center>��Ӳ�Ʒ</center>
<form name="form" action="productadd.jsp" method="post">
    <input type="hidden" name="action" value="add">
    <table border="1">
        <tr>
            <td>��Ʒ���ƣ�</td>
            <td><input name="name" type="text"></td>
        </tr>
        <tr>
            <td>��Ʒ������</td>
            <td><textarea name="descr" rows="8" cols="40"></textarea></td>
        </tr>
        <tr>
            <td>�����۸�</td>
            <td><input name="normalprice" type="text"></td>
        </tr>
        <tr>
            <td>��Ա�۸�</td>
            <td><input name="memberprice" type="text"></td>
        </tr>
        <tr>
            <td>���ID��</td>
            <td><input name="categoryid" type="text"></td>
        </tr>
    </table>
    <input type="submit" value="�ύ">
</form>
</body>
</html>
<%--
ע���������--%>
