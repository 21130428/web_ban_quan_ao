package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.UserDAO;

@WebServlet("/admin/manage-users")
public class AdminUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDao = new UserDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserController() {
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
		String action = request.getParameter("action");
	    HttpSession session = request.getSession();
	    User currentUser = (User) session.getAttribute("user"); // Lấy admin đang đăng nhập

	    if ("changeRole".equals(action)) {
	        try {
	            int uid = Integer.parseInt(request.getParameter("uid"));
	            String role = request.getParameter("role");

	            // KIỂM TRA: Nếu ID cần sửa trùng với ID người đang đăng nhập
	            if (currentUser != null && currentUser.getUserId() == uid) {
	                // Gửi thông báo lỗi về trang quản lý
	                request.getSession().setAttribute("errorMessage", "Bạn không thể tự hạ quyền của chính mình!");
	            } else {
	                boolean success = userDao.updateRole(uid, role);
	                if(success) {
	                    request.getSession().setAttribute("successMessage", "Cập nhật quyền thành công!");
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        response.sendRedirect("manage-users");
	        return;
	    }

	    // Hiển thị danh sách như cũ
	    List<User> userList = userDao.getAllUsers();
	    request.setAttribute("userList", userList);
	    request.getRequestDispatcher("/admin-pages/user-manager.jsp").forward(request, response);
	}

}
