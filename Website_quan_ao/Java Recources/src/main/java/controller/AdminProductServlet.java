package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products")
public class AdminProductServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("add".equals(action)) {
                request.getRequestDispatcher("/pages-admin/admin-product-form.jsp").forward(request, response);
                return;
            } else if ("edit".equals(action)) {
                String idStr = request.getParameter("id");
                if (idStr != null) {
                    int id = Integer.parseInt(idStr);
                    Product p = productDAO.getById(id);
                    request.setAttribute("product", p);
                }
                request.getRequestDispatcher("/pages-admin/admin-product-form.jsp").forward(request, response);
                return;
            } else if ("delete".equals(action)) {
                String idStr = request.getParameter("id");
                if (idStr != null) {
                    productDAO.delete(Integer.parseInt(idStr));
                }
            }

            List<Product> list = productDAO.listAll();
            request.setAttribute("products", list);
            request.getRequestDispatcher("/pages-admin/admin-products.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idStr = request.getParameter("id");
            Product p = new Product();
            p.setName(request.getParameter("name"));
            p.setDescription(request.getParameter("description"));
            String priceStr = request.getParameter("price");
            p.setPrice(priceStr == null || priceStr.isEmpty() ? 0.0 : Double.parseDouble(priceStr));
            String catStr = request.getParameter("category_id");
            p.setCategoryId(catStr == null || catStr.isEmpty() ? null : Integer.parseInt(catStr));
            p.setImage(request.getParameter("image"));
            String stockStr = request.getParameter("stock");
            p.setStock(stockStr == null || stockStr.isEmpty() ? 0 : Integer.parseInt(stockStr));
            String statusStr = request.getParameter("status");
            p.setStatus(statusStr == null || statusStr.isEmpty() ? 1 : Integer.parseInt(statusStr));

            if (idStr == null || idStr.isEmpty()) {
                productDAO.insert(p);
            } else {
                p.setId(Integer.parseInt(idStr));
                productDAO.update(p);
            }
            response.sendRedirect(request.getContextPath() + "/admin/products");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
