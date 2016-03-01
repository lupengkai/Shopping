<%@ page import="com.shopping.Product" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopping.ProductMgr" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 1/16/16
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<%
    List<Product> products = ProductMgr.getInstance().getLatestProducts(10);
%>

<html>
  <head>
    <meta http-equiv="CONTENT-TYPE" content="text/html" ; charset="GBK">
    <title></title>
  </head>
  <body>
  <table align="center" border="1">
      <tr>
          <td>Name</td>
          <td>Member Price</td>
      </tr>
      <%
          for (Iterator<Product> it = products.iterator(); it.hasNext(); ) {
              Product p = it.next();
      %>
      <tr>


          <td>
              <a href="productdetailshow.jsp?id=<%=p.getId()%>"><%=p.getName()%>
              </a>
          </td>

          <td><%=p.getMemberPrice()%>
          </td>

      </tr>

      <%
          }
      %>
  </table>
  </body>
</html>
