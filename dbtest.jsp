<%@ page import="java.sql.*" %>
<%
Connection conn = null;

try {
    String url = "jdbc:mysql://localhost:3306/GalaxyCampusMall?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String password = "1234";

    Class.forName("com.mysql.cj.jdbc.Driver"); // mysql-connector 8.x 버전 기준
    conn = DriverManager.getConnection(url, user, password);

    out.println("✅ 데이터베이스 연결 성공!");
} catch (Exception ex) {
    out.println("❌ 연결 실패: " + ex.getMessage());
} finally {
    if (conn != null) try { conn.close(); } catch (Exception e) {}
}
%>
