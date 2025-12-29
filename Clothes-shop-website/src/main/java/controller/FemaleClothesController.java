package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

import java.io.IOException;
import java.util.List;

import dao.ProductDao;

/**
 * Servlet implementation class FemaleClothesController
 */
@WebServlet("/female-clothes")
public class FemaleClothesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao dao = new ProductDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FemaleClothesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. Gọi DAO lấy sản phẩm có category_id = 1 (Nam)
        List<Product> list = dao.getProductsByCategory(2);
        
        // 2. Đẩy dữ liệu sang JSP
        request.setAttribute("listP", list);
        
        // 3. Forward sang file JSP của bạn
        request.getRequestDispatcher("/user-pages/female-clothe.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
