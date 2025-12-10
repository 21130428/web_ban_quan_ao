package dao;

import config.DBConnect;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> listAll() throws Exception {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products ORDER BY created_at DESC";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = mapRow(rs);
                list.add(p);
            }
        }
        return list;
    }

    public Product getById(int id) throws Exception {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return mapRow(rs);
            }
        }
        return null;
    }

    public void insert(Product p) throws Exception {
        String sql = "INSERT INTO products(name, description, price, category_id, image, stock, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            if (p.getCategoryId() == null) ps.setNull(4, java.sql.Types.INTEGER); else ps.setInt(4, p.getCategoryId());
            ps.setString(5, p.getImage());
            ps.setInt(6, p.getStock());
            ps.setInt(7, p.getStatus());
            ps.executeUpdate();
        }
    }

    public void update(Product p) throws Exception {
        String sql = "UPDATE products SET name = ?, description = ?, price = ?, category_id = ?, image = ?, stock = ?, status = ? WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            if (p.getCategoryId() == null) ps.setNull(4, java.sql.Types.INTEGER); else ps.setInt(4, p.getCategoryId());
            ps.setString(5, p.getImage());
            ps.setInt(6, p.getStock());
            ps.setInt(7, p.getStatus());
            ps.setInt(8, p.getId());
            ps.executeUpdate();
        }
    }

    public void delete(int id) throws Exception {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    private Product mapRow(ResultSet rs) throws Exception {
        Product p = new Product();
        p.setId(rs.getInt("id"));
        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getDouble("price"));
        int cat = rs.getInt("category_id");
        if (rs.wasNull()) p.setCategoryId(null); else p.setCategoryId(cat);
        p.setImage(rs.getString("image"));
        p.setStock(rs.getInt("stock"));
        p.setStatus(rs.getInt("status"));
        p.setCreatedAt(rs.getTimestamp("created_at"));
        return p;
    }
}
