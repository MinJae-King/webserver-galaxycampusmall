<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 세션 무효화
    session.invalidate();
    // 다시 로그인 페이지로
    response.sendRedirect("login.jsp");
%>
