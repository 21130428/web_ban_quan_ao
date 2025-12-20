package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
	private UserDAO userDAO = new UserDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/user-pages/reset-password.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
