package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import config.DBConnect;
import dao.UserDAO;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");

		if (!password.equals(confirm)) {
			request.setAttribute("error", "Mật khẩu không khớp!");
			request.getRequestDispatcher("user-pages/signup.jsp").forward(request, response);
			return;
		}

		if (userDAO.isEmailExists(email)) {
			request.setAttribute("error", "Email đã tồn tại!");
			request.getRequestDispatcher("user-pages/signup.jsp").forward(request, response);
			return;
		}

		User u = new User();
		u.setusername(username);
		u.setEmail(email);
		u.setPassword(password);
		u.setRole("USER");

		if (userDAO.register(u)) {
			response.sendRedirect("user-pages/login.jsp");
		} else {
			request.setAttribute("error", "Đăng ký thất bại!");
			request.getRequestDispatcher("user-pages/signup.jsp").forward(request, response);
		}
	}
}