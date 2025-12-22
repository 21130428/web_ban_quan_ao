package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Notification;

public class NotificationDao extends DBConnect {
	// Lấy 5 thông báo mới nhất của một User
    public List<Notification> getTop5ByUserId(int userId) {
        List<Notification> list = new ArrayList<>();
        String sql = "SELECT * FROM user_notifications WHERE user_id = ? ORDER BY created_at DESC LIMIT 5";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Notification n = new Notification();
                n.setId(rs.getInt("user_notification_id"));
                n.setTitle(rs.getString("title"));
                n.setContent(rs.getString("content"));
                n.setIcon(rs.getString("icon"));
                n.setRead(rs.getBoolean("is_read"));
                n.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(n);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Đếm số thông báo chưa đọc
    public int countUnread(int userId) {
        String sql = "SELECT COUNT(*) FROM user_notifications WHERE user_id = ? AND is_read = FALSE";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // Đánh dấu thông báo là đã đọc khi click vào Modal
    public void markAsRead(int notifyId) {
        String sql = "UPDATE user_notifications SET is_read = TRUE WHERE user_notification_id = ?";
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, notifyId);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
