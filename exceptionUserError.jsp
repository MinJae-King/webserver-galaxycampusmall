<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>404 - 페이지를 찾을 수 없습니다</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/error.css">
</head>
<body>
    <main>
        <div class="error-container">
            <h1 class="error-code">404</h1>
            <p class="error-message">요청하신 페이지를 찾을 수 없습니다.</p>
            <p class="error-suggestion">
                요청 URL: <%= request.getRequestURL() %>
                <% if (request.getQueryString() != null) { %>
                    ?<%= request.getQueryString() %>
                <% } %>
            </p>
            <a href="index.jsp" class="btn-home">홈으로 돌아가기</a>
        </div>
    </main>
</body>

<%@ include file="footer.jsp" %>
</html>
