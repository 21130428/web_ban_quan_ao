package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/clothe_shop_db", "root", "");
            System.out.println("Kết nối Database thành công!"); // Nếu không thấy dòng này thì là lỗi ở đây
            return conn;
        } catch (Exception e) {
            System.out.println("Lỗi kết nối: " + e.getMessage());
            return null;
        }
    }
}
