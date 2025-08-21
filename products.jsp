<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dao.ProductRepository, dto.Product"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>갤럭시북 캠퍼스몰 - 상품 목록</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

  <!-- 배너 이미지 추가 -->
  <img class="banner-image" src="resources/images/pc_banner.png"
    alt="PC 배너">

  <!-- 상품 목록 부분 -->
  <div class="product-grid">
    <%
    ProductRepository repo = ProductRepository.getInstance();
    List<Product> products = repo.getAllProducts();
    for (Product p : products) {
    %>
    <div class="product-card">
      <img class="product-image" src="<%=p.getFilename()%>"
        alt="<%=p.getName()%>">

      <div class="product-info">
        <h3><%=p.getName()%></h3>
        <div class="product-price"><%=p.getPrice()%>원
        </div>

        <%
        if (p.isCampusDiscount()) {
        %>
        <div class="discount-badge">🎓 교육 할인 적용</div>
        <%
        }
        %>

        <ul class="feature-list">
          <li>AI PC에 최적화된 퍼포먼스</li>
          <li>360도 회전 힌지와 S Pen</li>
          <li>AI로 강화된 갤럭시 연결 경험</li>
        </ul>

        <a href="product.jsp?id=<%=p.getId()%>" class="buy-button">구매하기</a>
      </div>
    </div>
    <%
    }
    %>
  </div>

  <%@ include file="footer.jsp"%>
</body>
</html>
