package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.time.LocalDateTime;

import dao.UserDao;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDAO = new UserDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResetPasswordServlet() {
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
		String token = request.getParameter("token");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String regex = "^(?=.*[A-Za-z])(?=.*\\d).{6,}$";
		if (!password.matches(regex)) {
			request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự và chứa chữ cái và số!");
			request.getRequestDispatcher("/user-pages/reset-password.jsp").forward(request, response);
			return;
		}
		if (!password.equals(confirm)) {
			request.setAttribute("error", "Mật khẩu không khớp!");
			request.getRequestDispatcher("/user-pages/reset-password.jsp").forward(request, response);
			return;
		}
		User user = userDAO.findByToken(token);
		if (user == null || user.getTokenExpiry().toLocalDateTime().isBefore(LocalDateTime.now())) {
			request.setAttribute("error", "Link không hợp lệ hoặc đã hết hạn!");
			request.getRequestDispatcher("/user-pages/reset-password.jsp").forward(request, response);
			return;
		}
		// cập nhật mật khẩu
		userDAO.updatePassword(user.getEmail(), password);
		// xoá token
		userDAO.clearToken(user.getEmail());
		request.setAttribute("message", "Đổi mật khẩu thành công! Vui lòng đăng nhập.");
		request.getRequestDispatcher("/user-pages/login.jsp").forward(request, response);
	}

}
