<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
// 로그인 여부 확인
String userId = (String) session.getAttribute("loginUserId");
if (userId == null) {
	response.sendRedirect("login.jsp");
	return;
}

// DB 연결 및 회원 정보 조회
String url = "jdbc:mysql://localhost:3306/galaxycampusmall?serverTimezone=Asia/Seoul";
String dbUser = "root";
String dbPassword = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String name = "", gender = "", birth = "", mail = "", phone = "", address = "";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbUser, dbPassword);

	String sql = "SELECT * FROM member WHERE id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userId);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		name = rs.getString("name");
		gender = rs.getString("gender");
		birth = rs.getString("birth");
		mail = rs.getString("mail");
		phone = rs.getString("phone");
		address = rs.getString("address");
	}

} catch (Exception e) {
	out.println("오류 발생: " + e.getMessage());
} finally {
	try {
		if (rs != null)
	rs.close();
		if (pstmt != null)
	pstmt.close();
		if (conn != null)
	conn.close();
	} catch (Exception e) {
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
  <jsp:include page="menu.jsp" />

  <div class="container">
    <h2>회원정보 수정</h2>

    <form action="processEditUser.jsp" method="post">
      <input type="hidden" name="id" value="<%=userId%>"> <label>이름:</label><br>
      <input type="text" name="name" value="<%=name%>" required><br>

      <label>성별:</label><br> <input type="text" name="gender"
        value="<%=gender%>"><br> <label>생일:</label><br>
      <input type="text" name="birth" value="<%=birth%>"><br>

      <label>이메일:</label><br> <input type="email" name="mail"
        value="<%=mail%>"><br> <label>전화번호:</label><br>
      <input type="text" name="phone" value="<%=phone%>"><br>

      <label>주소:</label><br> <input type="text" name="address"
        value="<%=address%>"><br> <label>비밀번호 변경 :</label><br>
      <input type="password" name="password"><br> <br>

      <button type="submit">정보 수정</button>
    </form>
  </div>

  <jsp:include page="footer.jsp" />
</body>
</html>
