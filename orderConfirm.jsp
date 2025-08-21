<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dto.Product, dto.CartItem" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>주문 확인</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <h2>📦 주문 확인</h2>

    <%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");  
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    int sum = 0;
    %>

    <h4>고객 정보</h4>
    <p>이름: <%=name%></p>
    <p>주소: <%=address%></p>
    <p>연락처: <%=phone%></p>
    

    <h4 class="mt-4">주문 내역</h4>
    <table class="table">
      <tr>
        <th>상품명</th>
        <th>옵션</th>
        <th>수량</th>
        <th>금액</th>
      </tr>
      <%
      for (CartItem item : cart) {
          Product p = item.getProduct();
          int price = p.getPrice();
          if ("Windows 11 Home".equals(item.getOs())) price += 189000;
          if ("Ultra 7".equals(item.getCpu())) price += 200000;
          if ("32GB".equals(item.getRam())) price += 50000;
          if ("1TB".equals(item.getSsd())) price += 100000;
          if ("40.6cm".equals(item.getSize())) price += 300000;
          int total = price * item.getQuantity();
          sum += total;
      %>
      <tr>
        <td><%=p.getName()%></td>
        <td class="text-start">
          OS: <%=item.getOs()%><br>
          CPU: <%=item.getCpu()%><br>
          RAM: <%=item.getRam()%><br>
          SSD: <%=item.getSsd()%><br>
          색상: <%=item.getColor()%><br>
          크기: <%=item.getSize()%>
        </td>
        <td><%=item.getQuantity()%></td>
        <td><%=total%>원</td>
      </tr>
      <%
      }
      %>
      <tr class="table-secondary fw-bold">
        <td colspan="3" class="text-end">총액</td>
        <td><%=sum%>원</td>
      </tr>
    </table>

    <form action="orderComplete.jsp" method="post" class="mt-3">
      <input type="hidden" name="name" value="<%=name%>">
      <input type="hidden" name="address" value="<%=address%>">
      <input type="hidden" name="phone" value="<%=phone%>">
      <button type="submit" class="btn btn-success">💳 결제 완료</button>
    </form>
  </div>
</body>
</html>
