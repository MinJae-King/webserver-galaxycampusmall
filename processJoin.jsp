<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String mail = request.getParameter("mail");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
%>

<sql:setDataSource var="dataSource" driver="com.mysql.cj.jdbc.Driver"
  url="jdbc:mysql://localhost:3306/GalaxyCampusMall?useSSL=false&serverTimezone=UTC"
  user="root" password="1234" />

<sql:update dataSource="${dataSource}" var="result">
    INSERT INTO member (id, password, name, gender, birth, mail, phone, address)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    <sql:param value="<%=id%>" />
  <sql:param value="<%=password%>" />
  <sql:param value="<%=name%>" />
  <sql:param value="<%=gender%>" />
  <sql:param value="<%=birth%>" />
  <sql:param value="<%=mail%>" />
  <sql:param value="<%=phone%>" />
  <sql:param value="<%=address%>" />
</sql:update>

<c:if test="${result >= 1}">
  <c:redirect url="login.jsp" />
</c:if>
<c:if test="${result < 1}">
  <script>
			alert("회원가입에 실패했습니다. 다시 시도해주세요.");
			history.back();
		</script>
</c:if>
