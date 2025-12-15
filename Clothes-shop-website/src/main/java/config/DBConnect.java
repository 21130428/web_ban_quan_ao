package config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	 private static final String URL = "jdbc:mysql://localhost:3306/clothe_shop_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
	    private static final String USER = "root";
	    private static final String PASS = "tandamme123";

	    public static Connection getConnection() throws Exception {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        return DriverManager.getConnection(URL, USER, PASS);
	    }
}
