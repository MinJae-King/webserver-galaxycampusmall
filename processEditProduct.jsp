<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.Product" %>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String description = request.getParameter("description");
String priceStr = request.getParameter("price");
String imageUrl = request.getParameter("imageUrl");
boolean campusDiscount = request.getParameter("campusDiscount") != null;

ProductRepository repo = ProductRepository.getInstance();
Product product = repo.getProductById(id);

if (product != null) {
    product.setName(name);
    product.setDescription(description);
    product.setPrice(Integer.parseInt(priceStr));
    product.setFilename(imageUrl);
    product.setCampusDiscount(campusDiscount);
}

// 수정 완료 후 목록으로 이동
response.sendRedirect("productList.jsp");
%>
