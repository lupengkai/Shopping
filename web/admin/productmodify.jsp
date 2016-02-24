<%@ page import="com.shopping.Product" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.shopping.ProductMgr" %>
<%@ page import="com.shopping.Category" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 2/24/16
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<%@include file="_sessioncheck.jsp" %>
<%
    request.setCharacterEncoding("GBK");
    int id = Integer.parseInt(request.getParameter("id"));
    Product p = ProductMgr.getInstance().loadByID(id);
    String action = request.getParameter("action");
    if (action != null && action.equals("modify")) {
        String name = request.getParameter("name");
        String descr = request.getParameter("descr");
        Double normalPrice = Double.parseDouble(request.getParameter("normalprice"));
        Double memberprice = Double.parseDouble(request.getParameter("memberprice"));
        int categoryId = Integer.parseInt(request.getParameter("categoryid"));
        Category c = Category.loadById(categoryId);
        if (!c.isLeaf()) {
            out.println("非叶子节点");
            return;
        }
        Product product = new Product();
        product.setId(id);
        product.setName(name);
        product.setDescr(descr);
        product.setNormalPrice(normalPrice);
        product.setMemberPrice(memberprice);
        product.setPdate(new Timestamp(System.currentTimeMillis()));
        product.setCategoryId(categoryId);
        ProductMgr.getInstance().update(product);
        out.println("Congraduations! Modify category OK!");
        return;
    }
%>
<html>
<head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
    <script type="text/javascript">
        var arrLeaf = new Array();
        <!--
        function checkdata() {

            if (arrLeaf[document.form.categoryid.selectedIndex]!='leaf') {
                alert('不能选择非叶子节点');
                document.form.categoryid.focus();
                return false;

            }
            return true;
        }
        -->
    </script>
</head>
<body>
<center>修改产品</center>
<form name="form" action="productmodify.jsp" method="post" onsubmit="return checkdata()">
    <input type="hidden" name="action" value="modify">
    <input type="hidden" name="id" value="<%=id%>">
    <table border="1">
        <tr>
            <td>产品编号：</td>
            <td><%=p.getId()%>
            </td>
        </tr>
        <tr>
            <td>产品名称：</td>
            <td><input name="name" type="text" value="<%=p.getName()%>"></td>
        </tr>
        <tr>
            <td>产品描述：</td>
            <td><textarea name="descr" rows="8" cols="40"><%=p.getDescr()%></textarea></td>
        </tr>
        <tr>
            <td>正常价格：</td>
            <td><input name="normalprice" type="text" value="<%=p.getNormalPrice()%>"></td>
        </tr>
        <tr>
            <td>会员价格：</td>
            <td><input name="memberprice" type="text" value="<%=p.getMemberPrice()%>"></td>
        </tr>
        <tr>
            <td>类别ID：</td>
            <td>
                <select name="categoryid">
                    <option value="0">所有类别</option>
                    <script type="text/javascript">
                        arrLeaf[0] = 'notleaf';
                    </script>
                    <%

                        int index = 1;
                        List<Category> categories = Category.getAllCategories();
                        for (Iterator<Category> it = categories.iterator(); it.hasNext(); ) {
                            Category c = it.next();
                            String preStr = "";
                            for (int i = 1; i < c.getGrade(); i++) {
                                preStr = preStr + "--";
                            }
                    %>
                    <script type="text/javascript">
                        arrLeaf[<%=index%>] = '<%=c.isLeaf()? "leaf":"notleaf"%>'

                    </script>
                    <option value="<%=c.getId()%>" <%=p.getCategoryId() == c.getId() ? "selected" : ""%>><%=preStr + c.getName()%>
                    </option>
                    <%
                            index++;
                        }
                    %>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit" value="提交">
</form>
</body>
</html>