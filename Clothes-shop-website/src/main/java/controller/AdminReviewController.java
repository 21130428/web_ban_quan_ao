package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Review;

import java.io.IOException;
import java.util.List;

import dao.ReviewDao;

/**
 * Servlet implementation class AdminReviewController
 */
@WebServlet("/admin/manage-reviews")
public class AdminReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewDao reviewDao = new ReviewDao();

	public AdminReviewController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if ("delete".equals(action)) {
			int id = Integer.parseInt(request.getParameter("id"));
			reviewDao.deleteReview(id);
			response.sendRedirect("manage-reviews");
			return;
		}

		List<Review> list = reviewDao.getAllReviewsForAdmin();
		request.setAttribute("reviewList", list);
		request.getRequestDispatcher("/admin-pages/review-manager.jsp").forward(request, response);
	}

}
