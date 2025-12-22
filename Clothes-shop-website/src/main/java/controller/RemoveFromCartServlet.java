package controller;

import model.CartItem;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet("/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart != null) {
            Iterator<CartItem> it = cart.iterator();
            while (it.hasNext()) {
                if (it.next().getProductId() == id) {
                    it.remove();
                    break;
                }
            }
            if (cart.isEmpty()) session.removeAttribute("cart");
            else session.setAttribute("cart", cart);
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
