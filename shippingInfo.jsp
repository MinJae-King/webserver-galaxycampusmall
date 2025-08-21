<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <title>배송 정보 입력</title>
  <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
  <div class="container mt-5">
    <h2>배송 정보 입력</h2>
    <form action="orderConfirm.jsp" method="post">
      <div>
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div>
        <label for="address">주소:</label>
        <input type="text" id="address" name="address" required>
      </div>
      <div>
        <label for="phone">연락처:</label>
        <input type="text" id="phone" name="phone" required>
      </div>
      <div class="mt-3">
        <button type="submit">주문 확인</button>
      </div>
    </form>
  </div>
</body>
</html>
