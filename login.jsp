<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
  <title>로그인</title>
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/login.css">
</head>
<body class="white-bg">
  <%@ include file="menu.jsp" %>

  <div class="login-fullscreen">>
    <div class="login-gray-box">
      <div class="login-box">
        <h2 class="login-title">Galaxy Campus 로그인</h2>

        <%
          String error = request.getParameter("error");
          if ("1".equals(error)) {
        %>
          <div class="login-error">아이디와 비밀번호를 확인해 주세요.</div>
        <%
          }
        %>

        <form action="processLogin.jsp" method="post">
          <label>아이디</label>
          <input type="text" name="id" required>

          <label>비밀번호</label>
          <input type="password" name="passwd" required>

          <button type="submit">로그인</button>
        </form>

        <div class="login-links">
          <a href="join.jsp">회원가입</a> |
          <a href="#">아이디 찾기</a> |
          <a href="#">비밀번호 찾기</a>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="footer.jsp" %>
</body>
</html>
