<%@ page import="java.util.Iterator" %>
<%@ page import="com.shopping.Category" %>
<%@ page import="java.util.List" %><%--
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
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
</head>
<body>
<center>������</center>
<form action="productsearch.jsp" method="post">
    <input type="hidden" name="action" value="simplesearch">
    ���:<select name="categoryid">
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
    �ؼ���:<input type="text" name="name">
    <input type="submit" value="��">
</form>
<center>��������</center>
<form action="productsearch.jsp" method="post">
    <input type="hidden" name="action" value="complexsearch">
    <table>
        <tr>
            <td>category:</td>
            <td>
                <select>
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
            <td colspan="2"><input type="submit" value="��"></td>
        </tr>

    </table>
</form>
</body>
</html>
