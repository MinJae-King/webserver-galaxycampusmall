<%@ page contentType="text/html; charset=UTF-8" %>
<%
Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
if (isAdmin == null || !isAdmin) {
    response.sendRedirect("accessDenied.jsp"); // 관리자 아닐 경우 차단
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>노트북 상품 등록</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<jsp:include page="menu.jsp" />

<div class="container">
    <h2>📦 노트북 상품 등록</h2>
    <form action="processAddProduct.jsp" method="post" enctype="multipart/form-data">
    
        <div>
            <label for="id">상품 ID</label>
            <input type="text" name="id" id="id" required>
        </div>

        <div>
            <label for="name">상품명</label>
            <input type="text" name="name" id="name" required>
        </div>

        <div>
            <label for="description">상품 설명</label>
            <textarea name="description" id="description" rows="4"></textarea>
        </div>

        <div>
            <label for="price">가격</label>
            <input type="text" name="price" id="price" required>
        </div>

        <div>
            <label for="productImage">상품 이미지</label>
            <input type="file" name="productImage" id="productImage">
        </div>

        <div>
            <button type="submit">등록</button>
        </div>
    </form>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
