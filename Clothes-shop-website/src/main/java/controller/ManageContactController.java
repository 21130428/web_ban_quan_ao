package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ContactMessage;

import java.io.IOException;
import java.util.List;

import dao.ContactDao;

/**
 * Servlet implementation class ManageContactController
 */
@WebServlet("/admin/manage-contacts")
public class ManageContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManageContactController() {
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
		ContactDao dao = new ContactDao();

		// 1. Lấy danh sách tin nhắn
		List<ContactMessage> list = dao.getAllMessages();

		// 2. Tính toán các con số thống kê
		int newCount = dao.countByStatus("NEW");
		int repliedCount = dao.countByStatus("REPLIED");

		// 3. Đẩy dữ liệu ra Request Scope
		request.setAttribute("listMessages", list);
		request.setAttribute("newCount", newCount);
		request.setAttribute("repliedCount", repliedCount);

		// 4. Chuyển hướng đến trang JSP
		request.getRequestDispatcher("/admin-pages/contact-manager.jsp").forward(request, response);
	}

}
