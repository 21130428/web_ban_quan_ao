package dao;

import model.User;
import config.DBConnect;
import java.sql.*;

public class UserDAO {

	// Kiểm tra email tồn tại
	public boolean isEmailExists(String email) {
		String sql = "SELECT * FROM users WHERE email = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			return rs.next();

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// Đăng ký user mới
	public boolean register(User u) {
		String sql = "INSERT INTO users(username, password, email, role) VALUES (?, ?, ?, ?)";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, u.getusername());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getRole() == null ? "USER" : u.getRole());

			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public User getUserByEmail(String email) {
		String sql = "SELECT * FROM users WHERE email = ?";
		try (Connection conn = DBConnect.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				User u = new User();
				u.setUserId(rs.getInt("user_id"));
				u.setusername(rs.getString("username"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password")); // đã hash
				u.setRole(rs.getString("role"));
				return u;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// Kiểm tra login
	public User login(String email, String password) {
		User user = getUserByEmail(email);
		if (user != null) {
			if (password.equals(user.getPassword())) {
				return user;
			}
		}
		return null;
	}
}
