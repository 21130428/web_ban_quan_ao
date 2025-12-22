package controller;

import model.CartItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/update-cart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int qty = Math.max(1, Integer.parseInt(req.getParameter("quantity")));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart) {
                if (item.getProductId() == id) {
                    item.setQuantity(qty);
                    break;
                }
            }
        }
        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
