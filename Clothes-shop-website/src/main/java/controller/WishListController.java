package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    private boolean isAjax(HttpServletRequest req) {
        return "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
    }

    private Integer tryParseInt(String s) {
        try { return Integer.parseInt(s); } catch (Exception e) { return null; }
    }

    private void unauthorized(HttpServletRequest req, HttpServletResponse resp, boolean ajax) throws IOException {
        if (ajax) { resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED); return; }
        resp.sendRedirect(req.getContextPath() + "/user-pages/login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        boolean ajax = isAjax(req);

        String action = req.getParameter("action");
        if (action == null) action = "view";

        if (user == null) {
            unauthorized(req, resp, ajax);
            return;
        }

        ProductDao dao = new ProductDao();

        if ("add".equals(action) || "delete".equals(action)) {
            Integer pid = tryParseInt(req.getParameter("pid"));
            if (pid == null) { resp.sendError(400, "Missing/invalid pid"); return; }

            if ("add".equals(action)) dao.addToWishlist(user.getUserId(), pid);
            else dao.removeFromWishlist(user.getUserId(), pid);

            if (ajax) {
                resp.setContentType("text/plain; charset=UTF-8");
                resp.getWriter().write("OK");
                return;
            }

            // không ajax: quay về wishlist
            resp.sendRedirect(req.getContextPath() + "/wishlist-controller?action=view");
            return;
        }

        // view
        List<Product> list = dao.getWishlist(user.getUserId());
        req.setAttribute("wishlist", list);
        req.getRequestDispatcher("user-pages/wish-list.jsp").forward(req, resp);
    }
}
