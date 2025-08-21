<%@ page contentType="text/html; charset=UTF-8" %>
<%
Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
if (isAdmin == null || !isAdmin) {
    response.sendRedirect("404.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 메인</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<jsp:include page="menu.jsp" />

<div class="container">
    <h2>👨‍💼 관리자 페이지</h2>
    <ul>
        <li><a href="addProduct.jsp">상품 등록</a></li>
        <li><a href="deleteProduct.jsp">상품 삭제</a></li>
        <li><a href="productList.jsp">상품 목록 보기</a></li> 
        <li><a href="manageOrders.jsp">주문 관리 (예정)</a></li>
        <li><a href="userManager.jsp">회원 관리 (예정)</a></li>
        <li><a href="logout.jsp">로그아웃</a></li>
    </ul>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
