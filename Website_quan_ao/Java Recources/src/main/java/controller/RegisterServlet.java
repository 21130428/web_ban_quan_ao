package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import config.DBConnect;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirmPassword");
		if (!password.equals(confirm)) {
			response.getWriter().print("Mật khẩu không khớp!");
			return;
		}
		if (fullName.isEmpty() || email.isEmpty() || password.isEmpty()) {
			response.getWriter().print("Vui lòng điền đầy đủ thông tin!");
			return;
		}
		try (Connection conn = DBConnect.getConnection()) {
			String checkSql = "SELECT * FROM users WHERE email = ?";
			try (PreparedStatement checkPs = conn.prepareStatement(checkSql)) {
				checkPs.setString(1, email);
				if (checkPs.executeQuery().next()) {
					response.getWriter().print("Email đã tồn tại!");
					return;
				}
			}
			String sql = "INSERT INTO users(fullName, email, password, phoneNumber, createAt, statusID, activateCode, lockUntil, failPassword, accountType, banned)\r\n"
					+ "VALUES (?, ?, ?, ?, NOW(), 1, null, null, 0, 0, 0)";
			try (PreparedStatement ps = conn.prepareStatement(sql)) {
				ps.setString(1, fullName);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setString(4, phone);
				ps.executeUpdate();
			}
			response.sendRedirect(request.getContextPath() + "/pages-user/log-in.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("Có lỗi xảy ra. Vui lòng thử lại111111111111!");
		}
	}
}
