package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.User;

import java.io.IOException;
import java.util.List;

import dao.ProductDao;

/**
 * Servlet implementation class WishListController
 */
@WebServlet("/wishlist-controller")
public class WishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        String isAjax = request.getHeader("X-Requested-With");

        // 1. Kiểm tra đăng nhập
        if (user == null) {
            if ("XMLHttpRequest".equals(isAjax)) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            } else {
                response.sendRedirect("user-pages/login.jsp");
            }
            return;
        }

        ProductDao dao = new ProductDao();
        int pid = (request.getParameter("pid") != null) ? Integer.parseInt(request.getParameter("pid")) : 0;

        // 2. Xử lý các hành động
        if ("add".equals(action)) {
            dao.addToWishlist(user.getUserId(), pid);
            if ("XMLHttpRequest".equals(isAjax)) {
                response.getWriter().write("Success");
                return;
            }
        } 
        else if ("delete".equals(action)) {
            dao.removeFromWishlist(user.getUserId(), pid);
        }

        // 3. Sau khi xử lý xong (nếu không phải Ajax) thì quay về trang wishlist
        List<Product> list = dao.getWishlist(user.getUserId());
        request.setAttribute("wishlist", list);
        request.getRequestDispatcher("user-pages/wish-list.jsp").forward(request, response);
    }
}

