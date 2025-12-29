package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.NotificationDao;

/**
 * Servlet implementation class MarkReadController
 */
@WebServlet("/mark-read")
public class MarkReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MarkReadController() {
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
		String idStr = request.getParameter("id");
		if (idStr != null) {
			int id = Integer.parseInt(idStr);
			NotificationDao dao = new NotificationDao();
			dao.markAsRead(id);
		}
		// Không cần forward hay redirect vì đây là gọi ngầm từ JS (fetch)
		response.setStatus(HttpServletResponse.SC_OK);
	}
}
