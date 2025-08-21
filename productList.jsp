<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
ProductRepository repo = ProductRepository.getInstance();
List<Product> productList = repo.getAllProducts();
Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>노트북 상품 목록</title>
<link rel="stylesheet" href="resources/css/style.css">
<style>
.product-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
	gap: 20px;
	margin-top: 20px;
}

.product-card {
	border: 1px solid #ccc;
	padding: 15px;
	border-radius: 10px;
	text-align: center;
}

.product-card img {
	width: 200px;
	height: auto;
}
</style>
</head>
<body>
  <jsp:include page="menu.jsp" />

  <div class="container">
    <h2>📦 전체 노트북 상품 목록</h2>

    <div class="product-grid">
      <%
      for (Product p : productList) {
      %>
      <div class="product-card">
        <img src="<%=p.getFilename()%>" alt="<%=p.getName()%>">
        <h4><%=p.getName()%></h4>
        <p><%=p.getDescription()%></p>
        <p>
          <strong><%=String.format("%,d", p.getPrice())%>원</strong>
        </p>

        <%
        if (isAdmin != null && isAdmin) {
        %>
        <form action="processDeleteProduct.jsp" method="post">
          <input type="hidden" name="id" value="<%=p.getId()%>">
          <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?')">🗑
            삭제</button>
        </form>
        <!-- 수정 버튼 부분 추가 부분 -->
        <form action="editProduct.jsp" method="get">
          <input type="hidden" name="id" value="<%=p.getId()%>">
          <button type="submit">✏️ 수정</button>
        </form>

        <%
        }
        %>
      </div>
      <%
      }
      %>
    </div>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>
