package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Product;

import java.io.File;
import java.io.IOException;

import dao.ProductDao;

/**
 * Servlet implementation class ProductController
 */
@WebServlet("/admin/manage-product")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao dao = new ProductDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("delete".equals(action)) {
			dao.deleteProduct(Integer.parseInt(request.getParameter("id")));
		}
		request.setAttribute("listP", dao.getAllProducts());
		request.getRequestDispatcher("/admin-pages/product-manager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		// 1. Khởi tạo đối tượng và lấy dữ liệu cơ bản
		Product p = new Product();
		String idStr = request.getParameter("productId");
		String description = request.getParameter("description");

		p.setName(request.getParameter("productName"));
		p.setColor(request.getParameter("color"));
		p.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		p.setSize(request.getParameter("size"));
		p.setTarget(request.getParameter("target"));
		p.setMaterial(request.getParameter("material"));
		p.setDescription(description);

		try {
			String priceStr = request.getParameter("price");
			p.setPrice(priceStr != null ? Double.parseDouble(priceStr) : 0.0);
		} catch (Exception e) {
			p.setPrice(0.0);
		}
		String typeIdStr = request.getParameter("typeId");
		if (typeIdStr == null) {
			typeIdStr = request.getParameter("typeIdJewelry");
		}

		if (typeIdStr != null && !typeIdStr.isEmpty()) {
			p.setTypeId(Integer.parseInt(typeIdStr));
		}

		// 2. XỬ LÝ FILE ẢNH
		Part filePart = request.getPart("productImage");
		String fileName = filePart.getSubmittedFileName();

		if (fileName != null && !fileName.isEmpty()) {
			// Đường dẫn thực tế đến thư mục assets/images trong webapp
			String uploadPath = "C:\\Users\\PC\\School_work\\Clothes-shop-website\\src\\main\\webapp\\assets\\uploaded-images";
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists())
				uploadDir.mkdirs();

			// Lưu file vật lý
			filePart.write(uploadPath + File.separator + fileName);
			p.setImageUrl(fileName); // Lưu tên file vào đối tượng
		} else {
			// Nếu không chọn ảnh mới, lấy lại tên ảnh cũ từ Database hoặc mặc định
			String oldImage = request.getParameter("oldImage");
			p.setImageUrl((oldImage != null && !oldImage.isEmpty()) ? oldImage : "default.jpg");
		}

		System.out.println("Đang thêm sản phẩm: " + p.getName());
		// 3. GỌI DAO (Chỉ gọi 1 lần sau khi đã set đủ dữ liệu vào p)
		if (idStr == null || idStr.isEmpty()) {
			dao.addProduct(p);
		} else {
			p.setId(Integer.parseInt(idStr));
			dao.updateProduct(p);
		}

		// 4. Chuyển hướng về trang danh sách
		response.sendRedirect(request.getContextPath() + "/admin/manage-product");

	}

}
