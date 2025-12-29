package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import model.CartItem;
import model.Order;

import java.io.IOException;
import java.util.Map;

import dao.NotificationDao;
import dao.OrderDao;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet("/checkout")
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

		if (user == null || cart == null || cart.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/user-pages/login.jsp");
			return;
		}

		// 1. Lấy thông tin từ form
		Order order = new Order();
		order.setUserId(user.getUserId());
		order.setFullName(request.getParameter("fullName"));
		order.setPhone(request.getParameter("phone"));
		order.setEmail(request.getParameter("email"));
		order.setAddress(request.getParameter("address"));
		order.setPaymentMethod(request.getParameter("paymentMethod"));

		// 2. Tính toán tiền
		double subtotal = 0;
		for (CartItem item : cart.values()) {
			subtotal += item.getPrice() * item.getQuantity();
		}
		order.setSubtotal(subtotal);
		order.setShippingFee(30000);
		order.setTotalAmount(subtotal + 30000);

		// 3. Lưu vào DB
		OrderDao dao = new OrderDao();
		int orderId = dao.createOrder(order, cart);

		if (orderId > 0) {
			NotificationDao notifyDao = new NotificationDao();
			String title = "🎉 Đặt hàng thành công";
			String content = "Bạn đã đặt hàng thành công đơn hàng #ORD-" + orderId + ". Shop sẽ sớm liên hệ xác nhận!";
			notifyDao.addNotification(user.getUserId(), title, content, "ORDER");
			session.removeAttribute("cart"); // Xóa giỏ hàng sau khi đặt thành công
			response.sendRedirect("user-pages/thank-you.jsp?id=" + orderId);
		} else {
			response.sendRedirect("error.jsp");
		}

	}

}
