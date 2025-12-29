package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.Review;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import dao.ProductDao;
import dao.ReviewDao;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/product-detail")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao dao = new ProductDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductDetailController() {
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
			try {
				int id = Integer.parseInt(idStr);
				Product p = dao.getProductById(id);

				if (p != null) {
					// --- BỔ SUNG PHẦN ĐÁNH GIÁ ---
					ReviewDao rDao = new ReviewDao();
					// Lấy 5 đánh giá mới nhất
					List<Review> reviews = rDao.getTop5ReviewsByProductId(id);
					// Lấy điểm trung bình và tổng số lượng
					Map<String, Object> stats = rDao.getReviewStats(id);

					request.setAttribute("p", p);
					request.setAttribute("reviews", reviews);
					request.setAttribute("reviewStats", stats);

					request.getRequestDispatcher("/user-pages/product-detail.jsp").forward(request, response);
				} else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} catch (NumberFormatException e) {
				response.sendRedirect(request.getContextPath() + "/home");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
