<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");

// 로그인 여부 확인
String userId = (String) session.getAttribute("loginUserId");
if (userId == null) {
	response.sendRedirect("login.jsp");
	return;
}

// 입력 파람 값 가져오기
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String password = request.getParameter("password");

//DB 연결 정보
String url = "jdbc:mysql://localhost:3306/galaxycampusmall?serverTimezone=Asia/Seoul";

String dbUser = "root";
String dbPassword = "1234";

Connection conn = null;
PreparedStatement pstmt = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, dbUser, dbPassword);

	if (password == null || password.trim().isEmpty()) {
		// 비밀번호 변경 없이 업데이트
		String sql = "UPDATE member SET name=?, gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, gender);
		pstmt.setString(3, birth);
		pstmt.setString(4, mail);
		pstmt.setString(5, phone);
		pstmt.setString(6, address);
		pstmt.setString(7, userId);
	} else {
		// 비밀번호도 함께 변경
		String sql = "UPDATE member SET name=?, gender=?, birth=?, mail=?, phone=?, address=?, password=? WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, gender);
		pstmt.setString(3, birth);
		pstmt.setString(4, mail);
		pstmt.setString(5, phone);
		pstmt.setString(6, address);
		pstmt.setString(7, password);
		pstmt.setString(8, userId);
	}

	int result = pstmt.executeUpdate();

	if (result > 0) {
		session.setAttribute("loginUserName", name);
		out.println("<script>alert('회원정보가 성공적으로 수정되었습니다.'); location.href='index.jsp';</script>");
	} else {
		out.println("<script>alert('회원정보 수정에 실패했습니다.'); history.back();</script>");
	}

} catch (Exception e) {
	out.println("오류 발생: " + e.getMessage());
} finally {
	try {
		if (pstmt != null)
	pstmt.close();
		if (conn != null)
	conn.close();
	} catch (Exception e) {
	}
}
%>
