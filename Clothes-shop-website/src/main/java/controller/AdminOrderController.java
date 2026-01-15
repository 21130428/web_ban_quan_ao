package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;

import java.io.IOException;
import java.util.List;

import dao.NotificationDao;
import dao.OrderDao;

/**
 * Servlet implementation class AdminOrderController
 */
@WebServlet("/admin-orders")
public class AdminOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminOrderController() {
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
		OrderDao dao = new OrderDao();
	    String action = request.getParameter("action");

	    // Xử lý đổi trạng thái đơn hàng
	    if ("updateStatus".equals(action)) {
	        try {
	            int oid = Integer.parseInt(request.getParameter("oid"));
	            int sid = Integer.parseInt(request.getParameter("sid"));
	            
	            // 1. Cập nhật trạng thái đơn hàng trong DB
	            dao.updateOrderStatus(oid, sid);

	            // 2. Lấy userId của chủ đơn hàng
	            int userIdForNotify = dao.getUserIdByOrderId(oid);
	            
	            if (userIdForNotify > 0) {
	                String statusText = "";
	                String title = "📦 Cập nhật đơn hàng"; // Tiêu đề mặc định cho đơn hàng

	                switch (sid) {
	                    case 2: statusText = "đã được xác nhận"; break;
	                    case 3: statusText = "đang được giao đến bạn"; break;
	                    case 4: statusText = "đã giao thành công. Cảm ơn bạn!"; break;
	                    case 5: 
	                        statusText = "đã bị hủy"; 
	                        title = "⚠️ Thông báo hủy đơn"; // Đổi tiêu đề nếu bị hủy
	                        break;
	                }

	                if (!statusText.isEmpty()) {
	                    NotificationDao notifyDao = new NotificationDao();
	                    String content = "Đơn hàng #ORD-" + oid + " của bạn " + statusText;
	                    
	                    // QUAN TRỌNG: Truyền đủ 4 tham số (userId, title, content, type)
	                    // khớp với hàm addNotification mà chúng ta đã sửa ở bước trước
	                    notifyDao.addNotification(userIdForNotify, title, content, "ORDER");
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        response.sendRedirect("admin-orders");
	        return;
	    }

	    // Logic hiển thị danh sách đơn hàng (giữ nguyên)
	    String statusParam = request.getParameter("status");
	    int statusId = (statusParam != null) ? Integer.parseInt(statusParam) : 0;
	    List<Order> list = dao.getOrdersByStatus(statusId);

	    request.setAttribute("orderList", list);
	    request.setAttribute("currentStatus", statusId);
	    request.getRequestDispatcher("/admin-pages/order-manager.jsp").forward(request, response);
	}
}
