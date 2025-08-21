<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" %>
<%@ include file="menu.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>500 - 서버 오류</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/error.css">
</head>
<body>
    <main>
        <div class="error-container">
            <h1 class="error-code">500</h1>
            <p class="error-message">죄송합니다. 서버 내부 오류가 발생했습니다.</p>
            <p class="error-suggestion">
                요청 URL: <%= request.getRequestURL() %>
                <% if (request.getQueryString() != null) { %>
                    ?<%= request.getQueryString() %>
                <% } %>
            </p>
            <%
                if (exception != null) {
            %>
                <p class="error-detail">
                    오류 내용: <%= exception.getMessage() %>
                </p>
            <%
                }
            %>
            <a href="index.jsp" class="btn-home">홈으로 돌아가기</a>
        </div>
    </main>
</body>

<%@ include file="footer.jsp" %>
</html>
