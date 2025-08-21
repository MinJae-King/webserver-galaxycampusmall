<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.UserRepository"%>
<%@ page import="dto.User"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

UserRepository repo = UserRepository.getInstance();
User user = repo.getUserById(id);

if (user != null && user.getPasswd().equals(passwd)) {

	session.setAttribute("loginUser", user);
	session.setAttribute("loginUserName", user.getName());
	session.setAttribute("loginUserId", user.getId()); 

	boolean isAdmin = "admin".equals(user.getId());
	session.setAttribute("isAdmin", isAdmin);

	if (isAdmin) {
		response.sendRedirect("adminMain.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}

} else {
	// 로그인 실패시 리디렉션
	response.sendRedirect("login.jsp?error=1");
}
%>
