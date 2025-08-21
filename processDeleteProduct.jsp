<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="dto.User" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 관리자 확인
    User loginUser = (User) session.getAttribute("loginUser");
    
    if (loginUser == null || !"admin".equals(loginUser.getId())) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    // 상품 ID 가져오기
    String id = request.getParameter("id");

    // 상품 삭제
    ProductRepository repo = ProductRepository.getInstance();
    repo.removeProduct(id);

    // 삭제 후 목록으로 이동 다시
    response.sendRedirect("productList.jsp");
%>
