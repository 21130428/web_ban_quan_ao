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
 * Servlet implementation class JewelryController
 */
@WebServlet("/jewelry")
public class JewelryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao dao = new ProductDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JewelryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Product> list = dao.getProductsByCategory(3);
        
        request.setAttribute("listP", list);
        request.getRequestDispatcher("/user-pages/jewelry.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
