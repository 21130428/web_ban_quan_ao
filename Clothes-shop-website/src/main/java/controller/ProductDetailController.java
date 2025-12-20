package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;

import dao.ProductDao;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            // Bạn cần viết thêm hàm getProductById(id) trong ProductDao
            Product p = dao.getProductById(id); 
            
            if (p != null) {
                request.setAttribute("p", p);
                request.getRequestDispatcher("/user-pages/product-detail.jsp").forward(request, response);
            } else {
                response.sendRedirect("home"); // Không tìm thấy thì về trang chủ
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
