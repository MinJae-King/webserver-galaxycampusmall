<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/style.css">
<title>주문 완료</title>
</head>
<body>
  <div class="container mt-5">
    <h2>✅ 주문이 완료되었습니다!</h2>
    <%
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    %>

    <p>
      <strong>고객 정보</strong>
    </p>
    <p>
      이름:
      <%=name != null ? name : "정보 없음"%></p>
    <p>
      주소:
      <%=address != null ? address : "정보 없음"%></p>
    <p>
      연락처:
      <%=phone != null ? phone : "정보 없음"%></p>

    <hr>
    <p>감사합니다. 상품이 곧 배송될 예정입니다.</p>

    <%
    // 장바구니 비우기
    session.removeAttribute("cart");
    %>
  </div>
</body>
</html>
