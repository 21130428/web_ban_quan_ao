package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dao.ReviewDao;

@WebServlet("/submit-review")
public class SubmitReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SubmitReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Kiểm tra bảo mật (Authentication)
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user-pages/login.jsp");
            return;
        }
        int pid = Integer.parseInt(request.getParameter("pid"));
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        ReviewDao dao = new ReviewDao();
        boolean success = dao.insertReview(user.getUserId(), pid, rating, comment);

        if (success) {
            response.getWriter().write("OK");
        } else {
            response.setStatus(500);
        }
	}

}
