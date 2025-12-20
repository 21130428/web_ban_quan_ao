package controller;

import dao.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String regex = "^(?=.*[A-Za-z])(?=.*\\d).{6,}$";
		// check password confirm
		if (!password.equals(confirm)) {
			request.setAttribute("error", "Mật khẩu không khớp");
			request.getRequestDispatcher("/user-pages/signup.jsp").forward(request, response);
			return;
		}
		UserDAO userDAO = new UserDAO();
		// check email trùng
		if (userDAO.emailExists(email)) {
			request.setAttribute("error", "Email đã tồn tại");
			request.getRequestDispatcher("/user-pages/signup.jsp").forward(request, response);
			return;
		}
		// check mk có > 6 hay không và phải có chữ cái và số
		if (!password.matches(regex)) {
		    request.setAttribute("error",
		        "Mật khẩu phải có ít nhất 6 ký tự và chứa chữ cái và số!");
		    request.getRequestDispatcher("/user-pages/signup.jsp")
		           .forward(request, response);
		    return;
		}
		// đăng ký
		boolean success = userDAO.register(username, email, password);
		if (success) {
			response.sendRedirect(request.getContextPath() + "/user-pages/login.jsp");
		} else {
			request.setAttribute("error", "Đăng ký thất bại");
			request.getRequestDispatcher("/user-pages/signup.jsp").forward(request, response);
		}
	}
}
