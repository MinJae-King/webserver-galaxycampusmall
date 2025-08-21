<%@ page import="java.util.*, dto.CartItem" %>
<%
request.setCharacterEncoding("UTF-8");

int index = Integer.parseInt(request.getParameter("index"));

List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
if (cart != null && index >= 0 && index < cart.size()) {
    cart.remove(index);
    session.setAttribute("cart", cart); // 삭제 후 다시 세션에 저장
}

response.sendRedirect("cart.jsp");
%>
