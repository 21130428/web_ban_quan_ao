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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.NotificationDao;

/**
 * Servlet Filter implementation class AppFilter
 */
@WebFilter("/*")
public class AppFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AppFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httprequest = (HttpServletRequest) request;
        HttpSession session = httprequest.getSession();
        
        // Lấy User từ session
        Object userObj = session.getAttribute("user");
        if (userObj != null) {
            // Giả sử đối tượng User của bạn có hàm getUserId()
            // Ép kiểu User theo đúng class User của bạn
            model.User user = (model.User) userObj;
            
            NotificationDao nDao = new NotificationDao();
            // Đẩy dữ liệu vào request scope để Navbar.jsp có thể dùng JSTL lấy ra
            request.setAttribute("newNotifyCount", nDao.countUnread(user.getUserId()));
            request.setAttribute("listNotify", nDao.getTop5ByUserId(user.getUserId()));
        }
        
        chain.doFilter(request, response);
	}

}
