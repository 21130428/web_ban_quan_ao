package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            Product p = dao.getProductById(id);

            if (p != null) {
                request.setAttribute("p", p);
                request.getRequestDispatcher("/user-pages/product-detail.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/home");
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
