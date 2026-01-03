package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import util.PasswordUtil;

import java.io.IOException;

import dao.UserDAO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
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
		response.sendRedirect(request.getContextPath() + "/user-pages/login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDAO userDAO = new UserDAO();
		User user = userDAO.findByEmail(email);
		if (user == null || !PasswordUtil.checkPassword(password, user.getPassword())) {
			request.setAttribute("error", "Email hoặc mật khẩu không đúng");
			request.getRequestDispatcher("/user-pages/login.jsp").forward(request, response);
			return;
		}
		// LƯU SESSION
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		// PHÂN QUYỀN
		if ("ADMIN".equals(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/admin/manage-product");
		} else {
			response.sendRedirect(request.getContextPath() + "/home");
		}

	}

}
