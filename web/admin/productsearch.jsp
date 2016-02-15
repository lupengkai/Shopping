<%@ page import="java.util.Iterator" %>
<%@ page import="com.shopping.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.shopping.Product" %>
<%@ page import="com.shopping.ProductMgr" %>
<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 2/12/16
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp" %>
<%
    List<Category> categories = Category.getAllCategories();

    String action = request.getParameter("action");
    if (action != null && action.equals("complexsearch")) {
        String keyWord = request.getParameter("keyword");
        Double lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
        Double highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
        Double lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
        Double highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice"));

        int categoryID = Integer.parseInt(request.getParameter("categoryid"));

        Timestamp startDate;
        String strStartDate = request.getParameter("startdate");

        if (strStartDate == null || strStartDate.trim().equals("")) {
            startDate = null;
        } else {
            startDate = Timestamp.valueOf(request.getParameter("startdate"));
        }

        Timestamp endDate;
        String strEndDate = request.getParameter("enddate");
        if (strEndDate == null || strEndDate.trim().equals("")) {
            endDate = null;
        } else {
            endDate = Timestamp.valueOf(request.getParameter("enddate"));
        }


        int[] idArray;
        if (categoryID == 0) {
            idArray = null;
        } else {
            idArray = new int[1];
            idArray[0] = categoryID;
        }

        List<Product> products = ProductMgr.getInstance().findProducts(idArray, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, 1, 3);
        out.println(products.size());

%>
<center>ËÑË÷½á¹û</center>
<table border="1">
    <tr>
        <td>id:</td>
        <td>name:</td>
        <td>descr:</td>
        <td>normalprice:</td>
        <td>memberprice:</td>
        <td>pdate:</td>
        <td>categoryid:</td>
    </tr>
    <%
        for (Iterator<Product> it = products.iterator(); it.hasNext(); ) {
            Product p = it.next();
    %>
    <tr>
        <td><%=p.getId()%>
        </td>
        <td><%=p.getName()%>
        </td>
        <td><%=p.getDescr()%>
        </td>
        <td><%=p.getNormalPrice()%>
        </td>
        <td><%=p.getMemberPrice()%>
        </td>
        <td><%=p.getPdate()%>
        </td>
        <td><%=p.getCategoryId()%>
        </td>
    </tr>
    <%
        }
    %>

</table>

<%
        return;
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
    <script language="JavaScript">
        <!--
        function checkdata() {
            with (document.forms["complex"]) {
                if (lownormalprice.value == null || lownormalprice.value == "") {
                    lownormalprice.value = -1;
                }
                if (highnormalprice.value == null || highnormalprice.value == "") {
                    highnormalprice.value = -1;
                }
                if (lowmemberprice.value == null || lowmemberprice.value == "") {
                    lowmemberprice.value = -1;
                }
                if (highmemberprice.value == null || highmemberprice.value == "") {
                    highmemberprice.value = -1;
                }
            }
        }
        -->
    </script>
</head>
<body>
<center>¼òµ¥ËÑË÷</center>
<form action="productsearch.jsp" method="post">
    <input type="hidden" name="action" value="simplesearch">
    Àà±ð:<select name="categoryid">
    <%
        for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
            Category c = it.next();
            String preStr = "";
            for (int i = 1; i < c.getGrade(); i++) {
                preStr = preStr + "--";
            }
    %>
    <option value="<%=c.getId()%>"><%=preStr + c.getName()%>
    </option>
    <%
        }
    %>
</select>
    ¹Ø¼ü×Ö:<input type="text" name="name">
    <input type="submit" value="ËÑ">
</form>
<center>¸´ÔÓËÑË÷</center>
<form action="productsearch.jsp" method="post" onsubmit="checkdata()" name="complex">
    <input type="hidden" name="action" value="complexsearch">
    <table>
        <tr>
            <td>category:</td>
            <td>
                <select name="categoryid">
                    <%
                        for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
                            Category c = it.next();
                            String preStr = "";
                            for (int i = 1; i < c.getGrade(); i++) {
                                preStr = preStr + "--";
                            }
                    %>
                    <option value="<%=c.getId()%>"><%=preStr + c.getName()%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>keyword:</td>
            <td><input type="text" name="keyword"></td>
        </tr>
        <tr>
            <td>normalprice:</td>
            <td>
                From:<input type="text" name="lownormalprice">
                To:<input type="text" name="highnormalprice">
            </td>
        </tr>
        <tr>
            <td>memberprice:</td>
            <td>
                From:<input type="text" name="lowmemberprice">
                To:<input type="text" name="highmemberprice">
            </td>
        </tr>
        <tr>
            <td>pdate:</td>
            <td>
                From:<input type="text" name="startdate">
                To:<input type="text" name="enddate">
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="ËÑ"></td>
        </tr>

    </table>
</form>
</body>
</html>
