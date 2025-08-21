<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dto.Product, dto.CartItem"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>

  <div class="container mt-5">
    <h2 class="mb-4">🛒 장바구니</h2>

    <%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    int sum = 0;
    %>

    <%
    if (cart == null || cart.isEmpty()) {
    %>
    <p class="text-muted">장바구니가 비어 있습니다.</p>
    <%
    } else {
    %>
    <table class="table table-bordered align-middle text-center">
      <thead class="table-light">
        <tr>
          <th>상품명</th>
          <th>옵션</th>
          <th>수량</th>
          <th>금액</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <%
        for (int i = 0; i < cart.size(); i++) {
        	CartItem item = cart.get(i);
        	Product p = item.getProduct();
        	int price = p.getPrice();

        	if ("Windows 11 Home".equals(item.getOs()))
        		price += 189000;
        	if ("Ultra 7".equals(item.getCpu()))
        		price += 200000;
        	if ("32GB".equals(item.getRam()))
        		price += 50000;
        	if ("1TB".equals(item.getSsd()))
        		price += 100000;
        	if ("40.6cm".equals(item.getSize()))
        		price += 300000;

        	int total = price * item.getQuantity();
        	sum += total;
        %>
        <tr>
          <td><%=p.getName()%></td>
          <td class="text-start">OS: <%=item.getOs()%><br>
            CPU: <%=item.getCpu()%><br> RAM: <%=item.getRam()%><br>
            SSD: <%=item.getSsd()%><br> 색상: <%=item.getColor()%><br>
            크기: <%=item.getSize()%>
          </td>
          <td><%=item.getQuantity()%></td>
          <td><%=total%>원</td>
          <td><a href="deleteCart.jsp?index=<%=i%>"
            class="btn btn-sm btn-outline-danger">🗑 삭제</a></td>
        </tr>
        <%
        }
        %>
        <tr class="table-secondary fw-bold">
          <td colspan="3" class="text-end">총액</td>
          <td colspan="2"><%=sum%>원</td>
        </tr>
      </tbody>
    </table>

    <div class="d-flex gap-3 mt-4">
      <a href="shippingInfo.jsp" class="btn btn-primary">✅ 주문하기</a> <a
        href="products.jsp" class="btn btn-outline-secondary">🛍 계속
        쇼핑하기</a>
    </div>
    <%
    }
    %>
  </div>

  <%@ include file="footer.jsp"%>
</body>
</html>
