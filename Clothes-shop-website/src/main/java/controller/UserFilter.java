package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;
import model.User;

@WebFilter({ "/cart/*", "/order/*", "/profile/*", "/checkout" })
public class UserFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(false);
		User user = (session != null) ? (User) session.getAttribute("user") : null;
		if (user == null) {
			HttpSession session2 = req.getSession(true);
			session2.setAttribute("loginMessage", "Vui lòng đăng nhập để tiếp tục");
			res.sendRedirect(req.getContextPath() + "/user-pages/login.jsp");
			return;
		}
		chain.doFilter(request, response);
	}
}
