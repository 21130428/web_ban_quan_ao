package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import model.User;

public class UserDAO {

	private User mapUser(ResultSet rs) throws Exception {
		User user = new User();

		user.setUserId(rs.getInt("user_id"));
		user.setUsername(rs.getString("username"));
		user.setEmail(rs.getString("email"));
		user.setPassword(rs.getString("password"));
		user.setRole(rs.getString("role"));
		user.setCreatedAt(rs.getTimestamp("created_at"));
		// reset password (nếu có)
		try {
			user.setResetToken(rs.getString("reset_token"));
			user.setTokenExpiry(rs.getTimestamp("token_expiry"));
		} catch (Exception e) {
		}

		return user;
	}

	// kiểm tra email đã tồn tại chưa
	public boolean emailExists(String email) {
		String sql = "SELECT user_id FROM users WHERE email = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// insert user mới
	public boolean register(String username, String email, String password) {
		String sql = "INSERT INTO users(username, email, password, role, created_at) "
				+ "VALUES (?, ?, ?, 'USER', NOW())";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			return ps.executeUpdate() > 0;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public User login(String email, String password) {
		String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));
				user.setRole(rs.getString("role"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public User findByEmail(String email) {
		String sql = "SELECT * FROM users WHERE email = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return mapUser(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void saveResetToken(String email, String token, LocalDateTime expiry) {
		String sql = "UPDATE users SET reset_token = ?, token_expiry = ? WHERE email = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, token);
			ps.setTimestamp(2, Timestamp.valueOf(expiry));
			ps.setString(3, email);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public User findByToken(String token) {
		String sql = "SELECT * FROM users WHERE reset_token = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, token);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				User user = mapUser(rs);
				user.setResetToken(rs.getString("reset_token"));
				user.setTokenExpiry(rs.getTimestamp("token_expiry"));
				return user;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void updatePassword(String email, String newPassword) {
		String sql = "UPDATE users SET password = ? WHERE email = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, newPassword);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void clearToken(String email) {
		String sql = "UPDATE users SET reset_token = NULL, token_expiry = NULL WHERE email = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, email);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
