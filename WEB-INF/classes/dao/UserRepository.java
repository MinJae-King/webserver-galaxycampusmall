package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.User;

public class UserRepository {
	// 싱글톤 패턴 해당 부분 로직에 소개
	private static UserRepository instance = new UserRepository();

	public static UserRepository getInstance() {
		return instance;
	}

	// DB 연결 정보
	private static final String URL = "jdbc:mysql://localhost:3306/GalaxyCampusMall?useSSL=false&serverTimezone=UTC";
	private static final String DB_USER = "root";
	private static final String DB_PASS = "1234";
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

	private UserRepository() {
		try {
			Class.forName(DRIVER); 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 커넥션 가져오기
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection(URL, DB_USER, DB_PASS);
	}

	/** 사용자 조회 */
	public User getUserById(String id) {
		String sql = "SELECT * FROM member WHERE id = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					User user = new User();
					user.setId(rs.getString("id"));
					user.setPasswd(rs.getString("password"));
					user.setName(rs.getString("name"));
					user.setGender(rs.getString("gender"));
					user.setBirth(rs.getString("birth"));
					user.setMail(rs.getString("mail"));
					user.setPhone(rs.getString("phone"));
					user.setAddress(rs.getString("address"));
					return user;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean addUser(User user) {
		String sql = "INSERT INTO member (id, password, name, gender, birth, mail, phone, address) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, user.getId());
			ps.setString(2, user.getPasswd());
			ps.setString(3, user.getName());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getBirth());
			ps.setString(6, user.getMail());
			ps.setString(7, user.getPhone());
			ps.setString(8, user.getAddress());
			return ps.executeUpdate() == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
