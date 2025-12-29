package controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebFilter("/admin/*")
public class AdminFilter extends HttpFilter implements Filter {

	public AdminFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);

		// 1. Kiểm tra session có tồn tại không
		User user = (session != null) ? (User) session.getAttribute("user") : null;

		// 2. Logic phân quyền
		if (user != null && "ADMIN".equals(user.getRole())) {
			// Nếu là Admin, cho phép đi tiếp vào trang yêu cầu
			chain.doFilter(request, response);
		} else {
			// Nếu không phải Admin hoặc chưa đăng nhập, đá về trang Login hoặc Home kèm
			// thông báo
			session = httpRequest.getSession(true);
			session.setAttribute("error", "Vui lòng đăng nhập với quyền Admin để truy cập!");
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/user-pages/login.jsp");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
