package controller;

import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        double subtotal = 0;
        int totalQty = 0;
        for (CartItem i : cart) {
            subtotal += i.getPrice() * i.getQuantity();
            totalQty += i.getQuantity();
        }

        req.setAttribute("cart", cart);
        req.setAttribute("subtotal", subtotal);
        req.setAttribute("totalQty", totalQty);

        req.getRequestDispatcher("/user-pages/cart.jsp").forward(req, resp);
    }
}
