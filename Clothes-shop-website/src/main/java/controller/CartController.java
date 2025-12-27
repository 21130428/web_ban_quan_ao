package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import model.CartItem;
import model.Product;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import dao.ProductDao;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/cart-controller")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
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
		String pidRaw = request.getParameter("pid");

		// Kiểm tra pid có tồn tại không để tránh lỗi NumberFormatException
		if (pidRaw == null) {
			response.sendRedirect("user-pages/cart.jsp");
			return;
		}

		int pid = Integer.parseInt(pidRaw);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");

		// Nếu chưa đăng nhập, trả về mã lỗi 401 nếu là Ajax hoặc redirect nếu là thường
		if (user == null) {
			String isAjax = request.getHeader("X-Requested-With");
			if ("XMLHttpRequest".equals(isAjax)) {
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				return;
			}
			response.sendRedirect("login.jsp");
			return;
		}

		// Lấy giỏ hàng từ session
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<>();
		}

		ProductDao dao = new ProductDao();

		if ("add".equals(action)) {
			if (cart.containsKey(pid)) {
				cart.get(pid).setQuantity(cart.get(pid).getQuantity() + 1);
			} else {
				Product p = dao.getProductById(pid);
				if (p != null) {
					cart.put(pid, new CartItem(p, 1, p.getPrice()));
				}
			}
		} else if ("update".equals(action)) {
			String modRaw = request.getParameter("mod");
			if (modRaw != null) {
				int mod = Integer.parseInt(modRaw);
				CartItem item = cart.get(pid);
				if (item != null) {
					int newQty = item.getQuantity() + mod;
					if (newQty > 0)
						item.setQuantity(newQty);
					else
						cart.remove(pid);
				}
			}
		} else if ("delete".equals(action)) {
			cart.remove(pid);
		}

		// Cập nhật lại session
		session.setAttribute("cart", cart);

		// KIỂM TRA LOẠI REQUEST ĐỂ PHẢN HỒI
		String isAjax = request.getHeader("X-Requested-With");
		if ("XMLHttpRequest".equals(isAjax)) {
			// Nếu là Ajax (nút bấm ở trang chủ/wishlist), trả về số lượng tổng để cập nhật
			// icon giỏ hàng
			int totalItems = 0;
			for (CartItem item : cart.values()) {
				totalItems += item.getQuantity();
			}
			response.setContentType("text/plain");
			response.getWriter().write(String.valueOf(totalItems));
		} else {
			// Nếu là request bình thường (thẻ a hoặc redirect), quay về trang giỏ hàng
			response.sendRedirect("user-pages/cart.jsp");
		}
	}
}
