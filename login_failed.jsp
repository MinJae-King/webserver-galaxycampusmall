<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
    <link rel="stylesheet" href="resources/css/style.css">
    <title>로그인 실패</title>
</head>
<body>
    <div class="container py-4">
        <%@ include file="menu.jsp" %>

        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">로그인 실패</h1>
                <p class="col-md-8 fs-4">아이디 또는 비밀번호가 잘못되었습니다. 다시 시도하세요.</p>
            </div>
        </div>

        <p><a href="login.jsp" class="btn btn-primary">로그인 페이지로 돌아가기</a></p>

        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>