package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection conn = null;

        String url = "jdbc:mysql://localhost:3306/GalaxyCampusMall";
        String user = "root";
        String password = "1234";

        Class.forName("com.mysql.jdbc.Driver"); // 최신 MySQL 드라이버 오류방지
        conn = DriverManager.getConnection(url, user, password);

        return conn;
    }
}
