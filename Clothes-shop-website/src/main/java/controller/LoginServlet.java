package controller;

import dao.UserDAO;
import model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDAO userDAO = new UserDAO();
		User user = userDAO.login(email, password);
		if (user == null) {
			request.setAttribute("error", "Email hoặc mật khẩu không đúng");
			request.getRequestDispatcher("/user-pages/login.jsp").forward(request, response);
			return;
		}
		// LƯU SESSION
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		// PHÂN QUYỀN
		if ("ADMIN".equals(user.getRole())) {
			response.sendRedirect(request.getContextPath() + "/admin-pages/admin-navbar.jsp");
		} else {
			response.sendRedirect(request.getContextPath() + "/user-pages/home.jsp");
		}
	}
}
