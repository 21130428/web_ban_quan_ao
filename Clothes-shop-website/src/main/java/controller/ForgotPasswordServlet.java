package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import util.EmailUtil;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.UUID;

import dao.UserDao;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDAO = new UserDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
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
