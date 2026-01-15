package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    private boolean isAjax(HttpServletRequest req) {
        return "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
    }

    private Integer tryParseInt(String s) {
        try { return Integer.parseInt(s); } catch (Exception e) { return null; }
    }

    @SuppressWarnings("unchecked")
    private Map<Integer, CartItem> getCart(HttpSession session) {
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new HashMap<>();
        return cart;
    }

    private int totalQty(Map<Integer, CartItem> cart) {
        int total = 0;
        for (CartItem i : cart.values()) total += i.getQuantity();
        return total;
    }

    private void unauthorized(HttpServletRequest req, HttpServletResponse resp, boolean ajax) throws IOException {
        if (ajax) { resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED); return; }
        resp.sendRedirect(req.getContextPath() + "/user-pages/login.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "view";

        boolean ajax = isAjax(req);
        HttpSession session = req.getSession();

        // View cart
        if ("view".equals(action)) {
            resp.sendRedirect(req.getContextPath() + "/user-pages/cart.jsp");
            return;
        }

        // Require login for modifying cart
        User user = (User) session.getAttribute("user");
        if (user == null) {
            unauthorized(req, resp, ajax);
            return;
        }

        Integer pid = tryParseInt(req.getParameter("pid"));
        if (pid == null) {
            resp.sendError(400, "Missing/invalid pid");
            return;
        }

        Map<Integer, CartItem> cart = getCart(session);
        ProductDao dao = new ProductDao();

        switch (action) {
            case "add": {
                CartItem item = cart.get(pid);
                if (item != null) {
                    item.setQuantity(item.getQuantity() + 1);
                } else {
                    Product p = dao.getProductById(pid);
                    if (p != null) cart.put(pid, new CartItem(p, 1, p.getPrice()));
                }
                break;
            }
            case "update": {
                Integer mod = tryParseInt(req.getParameter("mod"));
                if (mod == null) { resp.sendError(400, "Missing/invalid mod"); return; }
                CartItem item = cart.get(pid);
                if (item != null) {
                    int newQty = item.getQuantity() + mod;
                    if (newQty > 0) item.setQuantity(newQty);
                    else cart.remove(pid);
                }
                break;
            }
            case "delete":
                cart.remove(pid);
                break;

            default:
                resp.sendError(400, "Unknown action");
                return;
        }

        session.setAttribute("cart", cart);

        if (ajax) {
            resp.setContentType("text/plain; charset=UTF-8");
            resp.getWriter().write(String.valueOf(totalQty(cart)));
        } else {
            resp.sendRedirect(req.getContextPath() + "/user-pages/cart.jsp");
        }
    }
}
