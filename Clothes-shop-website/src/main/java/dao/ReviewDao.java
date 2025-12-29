package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Review;

public class ReviewDao {
	// Lưu đánh giá mới
	public boolean insertReview(int userId, int productId, int rating, String comment) {
		String sql = "INSERT INTO product_reviews (user_id, product_id, rating, comment) VALUES (?, ?, ?, ?) "
				+ "ON DUPLICATE KEY UPDATE rating = ?, comment = ?, created_at = CURRENT_TIMESTAMP";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			ps.setInt(3, rating);
			ps.setString(4, comment);
			ps.setInt(5, rating);
			ps.setString(6, comment);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Lấy 5 đánh giá mới nhất của 1 sản phẩm
	public List<Review> getTop5ReviewsByProductId(int productId) {
		List<Review> list = new ArrayList<>();
		String sql = "SELECT r.*, u.username FROM product_reviews r JOIN users u ON r.user_id = u.user_id "
				+ "WHERE r.product_id = ? ORDER BY r.created_at DESC LIMIT 5";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, productId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Review r = new Review();
				r.setUsername(rs.getString("username"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
				r.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Tính điểm trung bình và tổng số đánh giá
	public Map<String, Object> getReviewStats(int productId) {
		Map<String, Object> stats = new HashMap<>();
		String sql = "SELECT AVG(rating) as avg_score, COUNT(*) as total FROM product_reviews WHERE product_id = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, productId);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				stats.put("avg", rs.getDouble("avg_score"));
				stats.put("total", rs.getInt("total"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stats;
	}

	public List<Review> getAllReviewsForAdmin() {
		List<Review> list = new ArrayList<>();
		String sql = "SELECT r.*, u.username, p.product_name " + "FROM product_reviews r "
				+ "JOIN users u ON r.user_id = u.user_id " + "JOIN products p ON r.product_id = p.product_id "
				+ "ORDER BY r.created_at DESC";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Review r = new Review();
				r.setReviewId(rs.getInt("review_id"));
				r.setUsername(rs.getString("username"));
				r.setProductName(rs.getString("product_name"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
				r.setCreatedAt(rs.getTimestamp("created_at"));
				list.add(r);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteReview(int reviewId) {
		String sql = "DELETE FROM product_reviews WHERE review_id = ?";
		try (Connection conn = new DBConnect().getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, reviewId);
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
