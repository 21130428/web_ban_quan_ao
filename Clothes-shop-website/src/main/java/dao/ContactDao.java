package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.ContactMessage;

public class ContactDao extends DBConnect {

	// 1. Lấy tất cả tin nhắn để hiển thị lên bảng quản trị
	public List<ContactMessage> getAllMessages() {
		List<ContactMessage> list = new ArrayList<>();
		String sql = "SELECT * FROM contact_messages ORDER BY created_at DESC";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ContactMessage m = new ContactMessage();
				m.setMessageId(rs.getInt("message_id"));
				m.setUserId((Integer) rs.getObject("user_id")); // Lấy giá trị có thể null
				m.setFullName(rs.getString("full_name"));
				m.setEmail(rs.getString("email"));
				m.setPhone(rs.getString("phone"));
				m.setMessage(rs.getString("message"));
				m.setStatus(rs.getString("status"));
				m.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 2. Xử lý phản hồi: Cập nhật trạng thái và tạo thông báo cho User
	public void replyMessage(int messageId, int userId, String replyContent) {
		String sqlUpdate = "UPDATE contact_messages SET status = 'REPLIED' WHERE message_id = ?";
		String sqlNotify = "INSERT INTO user_notifications (user_id, title, content, icon) VALUES (?, ?, ?, ?)";

		try (Connection conn = getConnection()) {
			conn.setAutoCommit(false); // Bắt đầu Transaction

			// Cập nhật trạng thái tin nhắn
			try (PreparedStatement ps1 = conn.prepareStatement(sqlUpdate)) {
				ps1.setInt(1, messageId);
				ps1.executeUpdate();
			}

			// Gửi thông báo nếu tin nhắn đó thuộc về một User đã đăng ký
			if (userId > 0) {
				try (PreparedStatement ps2 = conn.prepareStatement(sqlNotify)) {
					ps2.setInt(1, userId);
					ps2.setString(2, "Phản hồi từ Fashion Shop");
					ps2.setString(3, replyContent);
					ps2.setString(4, "fa-reply"); // Icon phản hồi
					ps2.executeUpdate();
				}
			}

			conn.commit(); // Hoàn tất
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 3. Đếm số tin nhắn mới cho Badge trên Header
	// Sửa lại hàm này trong ContactDao.java
	public int countByStatus(String status) {
		String sql = "SELECT COUNT(*) FROM contact_messages WHERE status = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public boolean insertContact(Integer userId, String name, String email, String phone, String msg) {
		String sql = "INSERT INTO contact_messages (user_id, full_name, email, phone, message, status) VALUES (?, ?, ?, ?, ?, 'NEW')";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setObject(1, userId); // Sử dụng setObject để xử lý giá trị null cho khách vãng lai
			ps.setString(2, name);
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.setString(5, msg);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}