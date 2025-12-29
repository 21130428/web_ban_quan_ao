package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class ProductDao extends DBConnect {

	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<>();
		// Cập nhật SELECT p.* để lấy thêm cột image_url
		String sql = "SELECT p.*, c.category_name, mp.size as m_size, wp.size as w_size, " + "jp.target, jp.material, "
				+ "COALESCE(mp.type_id, wp.type_id, jp.type_id) as type_id " // Lấy type_id từ bảng con bất kỳ
				+ "FROM products p " + "JOIN categories c ON p.category_id = c.category_id "
				+ "LEFT JOIN men_products mp ON p.product_id = mp.product_id "
				+ "LEFT JOIN women_products wp ON p.product_id = wp.product_id "
				+ "LEFT JOIN jewelry_products jp ON p.product_id = jp.product_id " + "ORDER BY p.product_id DESC";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setImageUrl(rs.getString("image_url"));
				p.setPrice(rs.getDouble("price"));
				p.setColor(rs.getString("color"));
				p.setCategoryId(rs.getInt("category_id"));
				p.setCategoryName(rs.getString("category_name"));
				p.setTypeId(rs.getInt("type_id"));
				p.setDescription(rs.getString("description"));

				String mSize = rs.getString("m_size");
				String wSize = rs.getString("w_size");
				p.setSize(mSize != null ? mSize : wSize);

				p.setTarget(rs.getString("target"));
				p.setMaterial(rs.getString("material"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product getProductById(int id) {
		String sql = "SELECT p.*, c.category_name, mp.size as m_size, wp.size as w_size, " + "jp.target, jp.material, "
				+ "COALESCE(mp.type_id, wp.type_id, jp.type_id) as type_id " + "FROM products p "
				+ "JOIN categories c ON p.category_id = c.category_id "
				+ "LEFT JOIN men_products mp ON p.product_id = mp.product_id "
				+ "LEFT JOIN women_products wp ON p.product_id = wp.product_id "
				+ "LEFT JOIN jewelry_products jp ON p.product_id = jp.product_id " + "WHERE p.product_id = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setPrice(rs.getDouble("price"));
				p.setColor(rs.getString("color"));
				p.setImageUrl(rs.getString("image_url"));
				p.setCategoryId(rs.getInt("category_id"));
				p.setDescription(rs.getString("description"));
				p.setTarget(rs.getString("target"));
				p.setMaterial(rs.getString("material"));

				String size = rs.getString("m_size") != null ? rs.getString("m_size") : rs.getString("w_size");
				p.setSize(size);

				return p;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Product> getProductsByCategory(int cid) {
		List<Product> list = new ArrayList<>();
		// Câu SQL lọc theo Category_id
		String sql = "SELECT p.*, c.category_name, mp.size as m_size, wp.size as w_size, " + "jp.target, jp.material, "
				+ "COALESCE(mp.type_id, wp.type_id, jp.type_id) as type_id " + "FROM products p "
				+ "JOIN categories c ON p.category_id = c.category_id "
				+ "LEFT JOIN men_products mp ON p.product_id = mp.product_id "
				+ "LEFT JOIN women_products wp ON p.product_id = wp.product_id "
				+ "LEFT JOIN jewelry_products jp ON p.product_id = jp.product_id " + "WHERE p.category_id = ? "
				+ "ORDER BY p.product_id DESC";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setImageUrl(rs.getString("image_url"));
				p.setPrice(rs.getDouble("price"));
				p.setColor(rs.getString("color"));
				p.setCategoryId(rs.getInt("category_id"));
				p.setCategoryName(rs.getString("category_name"));
				p.setDescription(rs.getString("description"));

				// Lấy size tùy theo bảng con
				String mSize = rs.getString("m_size");
				String wSize = rs.getString("w_size");
				p.setSize(mSize != null ? mSize : wSize);

				p.setTarget(rs.getString("target"));
				p.setMaterial(rs.getString("material"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addProduct(Product p) {
		Connection conn = null;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			// 1. Thêm vào bảng products (Thêm cột image_url)
			String sql1 = "INSERT INTO products (product_name, image_url, price, color, category_id) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement ps1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
			ps1.setString(1, p.getName());
			ps1.setString(2, p.getImageUrl());
			ps1.setDouble(3, p.getPrice());
			ps1.setString(4, p.getColor());
			ps1.setInt(5, p.getCategoryId());
			ps1.executeUpdate();

			ResultSet rs = ps1.getGeneratedKeys();
			if (rs.next()) {
				int newId = rs.getInt(1);
				// 2. Thêm vào bảng con tương ứng
				if (p.getCategoryId() == 3) { // Trang sức
					String sql2 = "INSERT INTO jewelry_products (product_id, type_id, target, material) VALUES (?, ?, ?, ?)";
					PreparedStatement ps2 = conn.prepareStatement(sql2);
					ps2.setInt(1, newId);
					ps2.setInt(2, p.getTypeId());
					ps2.setString(3, p.getTarget());
					ps2.setString(4, p.getMaterial());
					ps2.executeUpdate();
				} else { // Nam hoặc Nữ
					String tbl = (p.getCategoryId() == 1) ? "men_products" : "women_products";
					String sql2 = "INSERT INTO " + tbl + " (product_id, type_id, size) VALUES (?, ?, ?)";
					PreparedStatement ps2 = conn.prepareStatement(sql2);
					ps2.setInt(1, newId);
					ps2.setInt(2, p.getTypeId());
					ps2.setString(3, p.getSize());
					ps2.executeUpdate();
				}
			}
			conn.commit();
		} catch (Exception e) {
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException ex) {
				}
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
	}

	public void updateProduct(Product p) {
		Connection conn = null;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);

			// 1. Cập nhật bảng cha 'products'
			String sqlUpdateParent = "UPDATE products SET product_name = ?, image_url = ?, price = ?, color = ?, category_id = ?, description = ? WHERE product_id = ?";
			PreparedStatement ps1 = conn.prepareStatement(sqlUpdateParent);
			ps1.setString(1, p.getName());
			ps1.setString(2, p.getImageUrl());
			ps1.setDouble(3, p.getPrice());
			ps1.setString(4, p.getColor());
			ps1.setInt(5, p.getCategoryId());
			ps1.setString(6, p.getDescription());
			ps1.setInt(7, p.getId());
			ps1.executeUpdate();

			// 2. Cập nhật bảng con
			if (p.getCategoryId() == 3) {
				String sqlUpdateJewelry = "UPDATE jewelry_products SET type_id = ?, target = ?, material = ? WHERE product_id = ?";
				PreparedStatement ps2 = conn.prepareStatement(sqlUpdateJewelry);
				ps2.setInt(1, p.getTypeId());
				ps2.setString(2, p.getTarget());
				ps2.setString(3, p.getMaterial());
				ps2.setInt(4, p.getId());
				ps2.executeUpdate();
			} else {
				String tableName = (p.getCategoryId() == 1) ? "men_products" : "women_products";
				String sqlUpdateFashion = "UPDATE " + tableName + " SET type_id = ?, size = ? WHERE product_id = ?";
				PreparedStatement ps2 = conn.prepareStatement(sqlUpdateFashion);
				ps2.setInt(1, p.getTypeId());
				ps2.setString(2, p.getSize());
				ps2.setInt(3, p.getId());
				ps2.executeUpdate();
			}

			conn.commit();
		} catch (Exception e) {
			if (conn != null)
				try {
					conn.rollback();
				} catch (SQLException ex) {
				}
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
	}

	public void deleteProduct(int id) {
		String sql = "DELETE FROM products WHERE product_id = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Lấy danh sách yêu thích
	public List<Product> getWishlist(int userId) {
		List<Product> list = new ArrayList<>();
		// Lấy thông tin từ bảng products và join với favorites
		String sql = "SELECT p.* FROM favorites f " + "JOIN products p ON f.product_id = p.product_id "
				+ "WHERE f.user_id = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setPrice(rs.getDouble("price"));
				p.setImageUrl(rs.getString("image_url")); // Lấy ảnh trực tiếp từ bảng products
				p.setColor(rs.getString("color"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Thêm vào yêu thích (Database)
	public void addToWishlist(int userId, int productId) {
		String sql = "INSERT IGNORE INTO favorites (user_id, product_id) VALUES (?, ?)";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Loại bỏ khỏi yêu thích
	public void removeFromWishlist(int userId, int productId) {
		String sql = "DELETE FROM favorites WHERE user_id = ? AND product_id = ?";
		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, userId);
			ps.setInt(2, productId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// Lấy sản phẩm mới nhất (Top 4)
	public List<Product> getNewArrivals() {
		List<Product> list = new ArrayList<>();
		// Query lấy sản phẩm + ảnh đầu tiên + tên danh mục
		String sql = "SELECT p.*, c.category_name, "
				+ "(SELECT url FROM product_images WHERE product_id = p.product_id LIMIT 1) as image_url "
				+ "FROM products p " + "JOIN categories c ON p.category_id = c.category_id "
				+ "ORDER BY p.created_at DESC LIMIT 4";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapProductFromRS(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// Lấy sản phẩm bán chạy (Top 4 dựa trên order_items)
	public List<Product> getBestSellers() {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT p.*, c.category_name, SUM(oi.quantity) as total_sold, "
				+ "(SELECT url FROM product_images WHERE product_id = p.product_id LIMIT 1) as image_url "
				+ "FROM products p " + "JOIN categories c ON p.category_id = c.category_id "
				+ "JOIN order_items oi ON p.product_id = oi.product_id " + "GROUP BY p.product_id "
				+ "ORDER BY total_sold DESC LIMIT 4";

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				list.add(mapProductFromRS(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private Product mapProductFromRS(ResultSet rs) throws SQLException {
		Product p = new Product();
		p.setId(rs.getInt("product_id"));
		p.setName(rs.getString("product_name"));
		p.setPrice(rs.getDouble("price"));
		p.setImageUrl(rs.getString("image_url"));
		p.setCategoryName(rs.getString("category_name"));
		return p;
	}

	public List<Product> getAllHotProducts() {
		List<Product> list = new ArrayList<>();
		// SQL: Lấy thông tin sản phẩm, tên danh mục, ảnh đầu tiên và tổng số lượng đã
		// bán
		String sql = "SELECT p.*, c.category_name, "
				+ "(SELECT url FROM product_images WHERE product_id = p.product_id LIMIT 1) as image_url, "
				+ "IFNULL(SUM(oi.quantity), 0) as total_sold " + "FROM products p "
				+ "JOIN categories c ON p.category_id = c.category_id "
				+ "LEFT JOIN order_items oi ON p.product_id = oi.product_id " + "GROUP BY p.product_id "
				+ "ORDER BY total_sold DESC"; // Sắp xếp từ bán chạy nhất xuống thấp nhất

		try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getInt("product_id"));
				p.setName(rs.getString("product_name"));
				p.setPrice(rs.getDouble("price"));
				p.setColor(rs.getString("color"));
				p.setCategoryName(rs.getString("category_name"));
				p.setImageUrl(rs.getString("image_url"));
				// Lưu ý: Nếu Model có trường totalSold, bạn có thể set vào để hiển thị số lượng
				// đã bán
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}