package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dao.UserDao;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDao userDAO = new UserDao();
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
			response.sendRedirect(request.getContextPath() + "/admin/manage-product");
		} else {
			response.sendRedirect(request.getContextPath() + "/home");
		}

	}

}
