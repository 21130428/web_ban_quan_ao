package controller;

import dao.UserDAO;
import model.User;
import util.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private UserDAO userDAO = new UserDAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		User user = userDAO.findByEmail(email);
		if (user == null) {
			request.setAttribute("error", "Email không tồn tại!");
			request.getRequestDispatcher("/user-pages/forgot-password.jsp").forward(request, response);
			return;
		}
		// Tạo token
		String token = UUID.randomUUID().toString();
		LocalDateTime expiry = LocalDateTime.now().plusMinutes(15);
		userDAO.saveResetToken(email, token, expiry);
		String resetLink = "http://localhost:8080/Clothes-shop-website/reset-password?token=" + token;
		EmailUtil.sendResetPasswordEmail(user.getEmail(), resetLink);
		System.out.println("LINK RESET PASSWORD:");
		System.out.println(resetLink);
		request.setAttribute("message", "Link đặt lại mật khẩu đã được gửi về email!");
		request.getRequestDispatcher("/user-pages/forgot-password.jsp").forward(request, response);
	}
}
