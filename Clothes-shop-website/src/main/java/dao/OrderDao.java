package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import model.CartItem;
import model.Order;
import model.OrderItem;

public class OrderDao extends DBConnect {
	public int createOrder(Order order, Map<Integer, CartItem> cart) {
		Connection conn = null;
		try {
			conn = getConnection();
			conn.setAutoCommit(false); // Bắt đầu Transaction

			// 1. Chèn vào bảng orders
			String sqlOrder = "INSERT INTO orders (user_id, full_name, phone, email, address, payment_method, subtotal, shipping_fee, total_amount, status_id) VALUES (?,?,?,?,?,?,?,?,?,1)";
			PreparedStatement ps = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, order.getUserId());
			ps.setString(2, order.getFullName());
			ps.setString(3, order.getPhone());
			ps.setString(4, order.getEmail());
			ps.setString(5, order.getAddress());
			ps.setString(6, order.getPaymentMethod());
			ps.setDouble(7, order.getSubtotal());
			ps.setDouble(8, order.getShippingFee());
			ps.setDouble(9, order.getTotalAmount());
			ps.executeUpdate();

			// Lấy order_id vừa tạo
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				int orderId = rs.getInt(1);

				// 2. Chèn vào bảng order_items
				String sqlItem = "INSERT INTO order_items (order_id, product_id, product_name, price, quantity) VALUES (?,?,?,?,?)";
				PreparedStatement psItem = conn.prepareStatement(sqlItem);
				for (CartItem item : cart.values()) {
					psItem.setInt(1, orderId);
					psItem.setInt(2, item.getProduct().getId());
					psItem.setString(3, item.getProduct().getName());
					psItem.setDouble(4, item.getPrice());
					psItem.setInt(5, item.getQuantity());
					psItem.addBatch();
				}
				psItem.executeBatch();
				conn.commit(); // Thành công hết thì commit
				return orderId;
			}
		} catch (Exception e) {
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException ex) {
				}
			e.printStackTrace();
		}
		return -1;
	}

	public List<Order> getAllOrders() {
		List<Order> list = new ArrayList<>();
		// JOIN với bảng order_status để lấy tên trạng thái
		String sql = "SELECT o.*, s.status_name FROM orders o " + "JOIN order_status s ON o.status_id = s.status_id "
				+ "ORDER BY o.created_at DESC";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setOrderId(rs.getInt("order_id"));
				o.setUserId(rs.getInt("user_id"));
				o.setFullName(rs.getString("full_name"));
				o.setPhone(rs.getString("phone"));
				o.setTotalAmount(rs.getDouble("total_amount"));
				o.setPaymentMethod(rs.getString("payment_method"));
				o.setCreatedAt(rs.getTimestamp("created_at"));
				o.setStatusId(rs.getInt("status_id"));
				o.setStatusName(rs.getString("status_name")); // Bạn cần thêm field này vào Model Order
				list.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void updateOrderStatus(int orderId, int statusId) {
		String sql = "UPDATE orders SET status_id = ? WHERE order_id = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, statusId);
			ps.setInt(2, orderId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Order> getOrdersByStatus(int statusId) {
	    List<Order> list = new ArrayList<>();
	    String sql = "SELECT o.*, s.status_name FROM orders o " +
	                 "LEFT JOIN order_status s ON o.status_id = s.status_id ";
	    
	    // Nếu statusId > 0 thì mới thêm điều kiện WHERE
	    if (statusId > 0) {
	        sql += " WHERE o.status_id = ?";
	    }
	    sql += " ORDER BY o.created_at DESC";

	    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        if (statusId > 0) {
	            ps.setInt(1, statusId);
	        }
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Order o = new Order();
	            o.setOrderId(rs.getInt("order_id"));
	            o.setFullName(rs.getString("full_name"));
	            o.setPhone(rs.getString("phone"));
	            o.setTotalAmount(rs.getDouble("total_amount"));
	            o.setPaymentMethod(rs.getString("payment_method"));
	            o.setCreatedAt(rs.getTimestamp("created_at"));
	            o.setStatusId(rs.getInt("status_id"));
	            o.setStatusName(rs.getString("status_name"));
	            o.setAddress(rs.getString("address"));
	            list.add(o);
	        }
	    } catch (Exception e) { e.printStackTrace(); }
	    return list;
	}
	
	public List<OrderItem> getOrderItemsByOrderId(int orderId) {
	    List<OrderItem> list = new ArrayList<>();
	    String sql = "SELECT * FROM order_items WHERE order_id = ?";
	    try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            OrderItem item = new OrderItem();
	            item.setProductName(rs.getString("product_name"));
	            item.setPrice(rs.getDouble("price"));
	            item.setQuantity(rs.getInt("quantity"));
	            list.add(item);
	        }
	    } catch (Exception e) { e.printStackTrace(); }
	    return list;
	}
	
	public int getUserIdByOrderId(int orderId) {
	    String sql = "SELECT user_id FROM orders WHERE order_id = ?";
	    try (Connection conn = getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setInt(1, orderId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            return rs.getInt("user_id");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1; // Trả về -1 nếu không tìm thấy
	}

}
