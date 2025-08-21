<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="dto.Product"%>
<%
String id = request.getParameter("id");
ProductRepository repo = ProductRepository.getInstance();
Product product = repo.getProductById(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
  <jsp:include page="menu.jsp" />

  <div class="container">
    <h2>📖 상품 정보 수정</h2>

    <%
    if (product == null) {
    %>
    <p>해당 상품을 찾을 수 없습니다.</p>
    <%
    } else {
    %>
    <form action="processEditProduct.jsp" method="post">
      <input type="hidden" name="id" value="<%=product.getId()%>">

      <label>상품명:</label><br> <input type="text" name="name"
        value="<%=product.getName()%>" required><br>
      <br> <label>설명:</label><br>
      <textarea name="description" rows="4" cols="50"><%=product.getDescription()%></textarea>
      <br>
      <br> <label>가격:</label><br> <input type="number"
        name="price" value="<%=product.getPrice()%>" required><br>
      <br> <label>이미지 URL:</label><br> <input type="text"
        name="imageUrl" value="<%=product.getFilename()%>"> <br>
      <br> <label>캠퍼스 할인 적용:</label><br> <input
        type="checkbox" name="campusDiscount"
        <%=product.isCampusDiscount() ? "checked" : ""%>><br>
      <br>

      <button type="submit">수정 완료</button>
    </form>
    <%
    }
    %>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>
