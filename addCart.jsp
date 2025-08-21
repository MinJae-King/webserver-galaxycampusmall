<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dto.Product, dao.ProductRepository"%>
<%
String id = request.getParameter("id");
if (id == null || id.isEmpty()) {
	response.sendRedirect("products.jsp");
	return;
}

ProductRepository dao = ProductRepository.getInstance();
Product product = dao.getProductById(id);

if (product == null) {
	response.sendRedirect("products.jsp");
	return;
}

List<Product> cart = (List<Product>) session.getAttribute("cart");
if (cart == null) {
	cart = new ArrayList<>();
	session.setAttribute("cart", cart);
}

cart.add(product);
response.sendRedirect("Cart.jsp");
%>
