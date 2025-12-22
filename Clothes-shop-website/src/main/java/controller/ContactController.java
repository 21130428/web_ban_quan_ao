package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.ContactDao;

/**
 * Servlet implementation class ContactController
 */
@WebServlet("/contact")
public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactController() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. Đảm bảo đọc được tiếng Việt từ Form
        request.setCharacterEncoding("UTF-8");

        // 2. Lấy dữ liệu từ các thẻ input qua thuộc tính 'name'
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        // 3. Lấy userId từ Session nếu người dùng đã đăng nhập
        HttpSession session = request.getSession();
        model.User user = (model.User) session.getAttribute("user");
        Integer userId = (user != null) ? user.getUserId() : null;

        // 4. Lưu vào Database
        ContactDao dao = new ContactDao();
        // Bạn cần viết thêm hàm insert này trong ContactDao
        boolean isSuccess = dao.insertContact(userId, fullName, email, phone, message);

        // 5. Điều hướng dựa trên kết quả
        if (isSuccess) {
            response.sendRedirect(request.getContextPath() + "/user-pages/thank-you.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/user-pages/contact.jsp?error=true");
        }
	}
}
