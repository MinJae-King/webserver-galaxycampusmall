<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
  <title>회원가입</title>
  <link rel="stylesheet" href="resources/css/style.css">
  <script src="resources/js/validation.js"></script> <%-- 유효성 검사 파일 연결 중요--%>
</head>
<body>
  <%@ include file="menu.jsp"%>

  <div class="container">
    <h2>회원가입</h2>
    <form name="joinForm" action="processJoin.jsp" method="post" onsubmit="return validateJoinForm();">
      <div>
        <label for="id">아이디</label><br />
        <input type="text" name="id" required>
      </div>
      <div>
        <label for="passwd">비밀번호</label><br />
        <input type="password" name="password" required>
      </div>
      <div>
        <label for="name">이름</label><br />
        <input type="text" name="name" required>
      </div>
      <div>
        <label for="gender">성별</label><br />
        <input type="text" name="gender">
      </div>
      <div>
        <label for="birth">생일</label><br />
        <input type="text" name="birth" placeholder="YYYY-MM-DD">
      </div>
      <div>
        <label for="mail">이메일</label><br />
        <input type="email" name="email" required>
      </div>
      <div>
        <label for="phone">전화번호</label><br />
        <input type="text" name="phone">
      </div>
      <div>
        <label for="address">주소</label><br />
        <input type="text" name="address">
      </div>
      <br />
      <button type="submit">회원가입</button>
    </form>
  </div>

  <%@ include file="footer.jsp"%>
</body>
</html>
