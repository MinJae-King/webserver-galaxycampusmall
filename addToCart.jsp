<%@ page
  import="java.util.*, dto.Product, dto.CartItem, dao.ProductRepository"%>
<%
request.setCharacterEncoding("UTF-8");

String productId = request.getParameter("productId");
String os = request.getParameter("os");
String cpu = request.getParameter("cpu");
String ram = request.getParameter("ram");
String ssd = request.getParameter("ssd");
String color = request.getParameter("color");
String size = request.getParameter("size");
int quantity = Integer.parseInt(request.getParameter("quantity"));

ProductRepository repo = ProductRepository.getInstance();
Product product = repo.getProductById(productId);

// 세션에서 cart 불러오기
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
if (cart == null) {
	cart = new ArrayList<>();
}

CartItem item = new CartItem();
item.setProduct(product);
item.setOs(os);
item.setCpu(cpu);
item.setRam(ram);
item.setSsd(ssd);
item.setColor(color);
item.setSize(size);
item.setQuantity(quantity);

cart.add(item);
session.setAttribute("cart", cart);

response.sendRedirect("cart.jsp");
%>
