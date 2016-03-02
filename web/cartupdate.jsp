<%@ page import="java.util.List" %>
<%@ page import="com.shopping.CartItem" %><%--
  Created by IntelliJ IDEA.
  User: tage
  Date: 3/2/16
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" pageEncoding="GBK" %>
<jsp:useBean id="cart" class="com.shopping.Cart" scope="session"></jsp:useBean>
<%
    if (cart == null) {
        out.print("没有任何购物项");
        return;
    }

    List<CartItem> cartItems = cart.getItems();
    for (int i = 0; i < cartItems.size(); i++) {
        CartItem ci = cartItems.get(i);
        String strId = request.getParameter("p" + ci.getProductId());
        if (strId != null && !strId.trim().equals("")) {
            ci.setCount(Integer.parseInt(strId));
        }
    }
    /*setTimeout(go, 3000);*/
%>


<html>
<head></head>
<body>
三秒钟后返回购物车
<div id="num">

</div>
<script language="JavaScript">
    var leftTime = 3;
    function go() {
        document.getElementById("num").innerText = leftTime;
        leftTime -= 1;
        if (leftTime <= 0) {
            document.location.href = "cart.jsp";
        }
    }

    setInterval(go, 1000);
</script>
</body>
</html>