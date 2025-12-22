package controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebServlet("/add-to-wishlist")
public class AddToWishlistServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        Set<Integer> wish = (Set<Integer>) session.getAttribute("wishlistSession");
        if (wish == null) wish = new HashSet<>();

        wish.add(id);
        session.setAttribute("wishlistSession", wish);

        String referer = req.getHeader("Referer");
        resp.sendRedirect(referer != null ? referer : (req.getContextPath() + "/wishlist"));
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }
}