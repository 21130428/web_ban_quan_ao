package controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

@WebServlet("/check-session")
public class CheckSessionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession(false);
		resp.setContentType("text/plain; charset=UTF-8");
		if (session != null && session.getAttribute("user") != null) {
			User user = (User) session.getAttribute("user");
			resp.getWriter().println("SESSION OK: " + user.getUsername());
		} else {
			resp.getWriter().println("CHƯA CÓ SESSION");
		}
	}
}
