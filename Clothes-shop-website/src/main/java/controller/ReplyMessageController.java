package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.ContactDao;

/**
 * Servlet implementation class ReplyMessageController
 */
@WebServlet("/admin/reply-message")
public class ReplyMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyMessageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int messageId = Integer.parseInt(request.getParameter("messageId"));
        int userId = 0;
        try {
            userId = Integer.parseInt(request.getParameter("userId"));
        } catch (Exception e) { /* User vãng lai không có ID */ }
        
        String replyMessage = request.getParameter("replyMessage");

        ContactDao dao = new ContactDao();
        // Gọi hàm xử lý (Hàm này chúng ta đã viết ở bước trước - sử dụng Transaction)
        dao.replyMessage(messageId, userId, replyMessage);

        // Quay lại trang danh sách sau khi xong
        response.sendRedirect("manage-contacts?success=true");
    }

}
