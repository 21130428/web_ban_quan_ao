package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.OrderItem;
import java.io.IOException;
import java.util.List;
import com.google.gson.Gson;

import dao.OrderDao;

/**
 * Servlet implementation class OrderDetailController
 */
@WebServlet("/admin-order-detail")
public class OrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int orderId = Integer.parseInt(request.getParameter("oid"));
        OrderDao dao = new OrderDao();
        List<OrderItem> items = dao.getOrderItemsByOrderId(orderId);

        // Chuyển danh sách thành JSON (Sử dụng thư viện Gson)
        String json = new Gson().toJson(items);//
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}
}
