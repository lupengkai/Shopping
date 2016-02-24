<%@ page import="java.util.Iterator" %>
<%@ page import="com.shopping.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.shopping.Product" %>
<%@ page import="com.shopping.ProductMgr" %>
<%@ page import="java.util.ArrayList" %>
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
    List<Product> products = null;
    int pageCount = 0;
    String strCategoryIDQuery = "";

    String keyWord = null;
    double lowNormalPrice = -1;
    double highNormalPrice = -1;
    double lowMemberPrice = -1;
    double highMemberPrice = -1;
    String strStartDate = null;
    String strEndDate = null;

    int pageNo = 1;
    String strPageNo = request.getParameter("pageno");
    if (strPageNo != null && !strPageNo.trim().equals("")) {
        pageNo = Integer.parseInt(strPageNo);
    }


    request.setCharacterEncoding("gbk");
    String action = request.getParameter("action");


    if (action != null && action.equals("simplesearch2")) {
        keyWord = request.getParameter("keyword");
        String[] strCategoryIDs = request.getParameterValues("categoryid");
        int[] idArray = null;

        if (strCategoryIDs == null || strCategoryIDs.length == 0) {
            idArray = null;
        } else {
            for (int i = 0; i < strCategoryIDs.length; i++) {
                strCategoryIDQuery += "&categoryid=" + strCategoryIDs[i];
            }
            idArray = new int[strCategoryIDs.length];
            for (int i = 0; i < strCategoryIDs.length; i++) {

                idArray[i] = Integer.parseInt(strCategoryIDs[i]);
            }
        }

        products = new ArrayList<>();

        pageCount = ProductMgr.getInstance().findProducts(products, idArray, keyWord, -1, -1, -1, -1, null, null, pageNo, 3);
        out.println(products.size());

    }
    if (action != null && action.equals("complexsearch")) {

//<jsp:forward page="complexsearchresult.jsp"></jsp:forward>

        keyWord = request.getParameter("keyword");
        lowNormalPrice = Double.parseDouble(request.getParameter("lownormalprice"));
        highNormalPrice = Double.parseDouble(request.getParameter("highnormalprice"));
        lowMemberPrice = Double.parseDouble(request.getParameter("lowmemberprice"));
        highMemberPrice = Double.parseDouble(request.getParameter("highmemberprice"));

        int categoryID = Integer.parseInt(request.getParameter("categoryid"));

        Timestamp startDate;
        strStartDate = request.getParameter("startdate");

        if (strStartDate == null || strStartDate.trim().equals("")) {
            startDate = null;
        } else {
            startDate = Timestamp.valueOf(request.getParameter("startdate"));
        }

        Timestamp endDate;
        strEndDate = request.getParameter("enddate");
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


        products = new ArrayList<>();

        pageCount = ProductMgr.getInstance().findProducts(products, idArray, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, 3);
        out.println(products.size());
    }

    if (request.getParameter("action") != null) {
%>

<center>搜索结果</center>
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
<center>
    共<%=pageCount%>页
    &nbsp;
    <a href="productsearch.jsp?action=<%=action%>&categoryid=<%=strCategoryIDQuery%>&keyword=<%=keyWord%>&lownormalprice=<%=lowNormalPrice%>&highnormalprice=<%=highNormalPrice%>&lowmemberprice=<%=lowMemberPrice%>&highmemberprice=<%=highMemberPrice%>&startdate=<%=strStartDate%>&enddate=<%=strEndDate%>&pageno=<%=pageNo+1%>">下一页</a>
</center>
<%
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
<center>简单搜索</center>
<form action="productsearch.jsp" method="post">
    <input type="hidden" name="action" value="simplesearch">
    类别:<select name="categoryid">
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
    关键字:<input type="text" name="name">
    <input type="submit" value="搜">
</form>
<center>简单搜索2</center>
<form action="productsearch.jsp" method="get">
    <input type="hidden" name="action" value="simplesearch2">
    类别:
    <%
        for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
            Category c = it.next();
            String preStr = "";
            for (int i = 1; i < c.getGrade(); i++) {
                preStr = preStr + "--";

            }
            if (c.isLeaf()) {

    %>
    <input type="checkbox" name="categoryid" value="<%=c.getId()%>"><%=preStr + c.getName()%><br>
    <%
    } else {%>
    <%=preStr + c.getName()%><br>
    <%
            }
        }
    %>
    </input>
    关键字:<input type="text" name="keyword">
    <input type="submit" value="搜">
</form>
<center>复杂搜索</center>
<form action="productsearch.jsp" method="post" onsubmit="checkdata()" name="complex">
    <input type="hidden" name="action" value="complexsearch">
    <table>
        <tr>
            <td>category:</td>
            <td>
                <select name="categoryid">
                    <option value="0">所有类别</option>
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
            <td colspan="2"><input type="submit" value="搜"></td>
        </tr>

    </table>
</form>
</body>
</html>
