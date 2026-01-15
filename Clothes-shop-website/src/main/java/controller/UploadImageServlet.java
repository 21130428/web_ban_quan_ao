package controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/upload-image")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1MB buffer
    maxFileSize = 10 * 1024 * 1024,       // 10MB/file
    maxRequestSize = 20 * 1024 * 1024     // 20MB/request
)
public class UploadImageServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("image");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Chưa chọn ảnh");
            return;
        }

        // lấy tên file gốc (an toàn)
        String original = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // lấy extension
        String ext = "";
        int dot = original.lastIndexOf('.');
        if (dot >= 0) ext = original.substring(dot).toLowerCase();

        // validate extension cơ bản
        if (!(ext.equals(".png") || ext.equals(".jpg") || ext.equals(".jpeg") || ext.equals(".webp"))) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Chỉ cho phép PNG/JPG/JPEG/WEBP");
            return;
        }

        // đặt tên mới tránh trùng
        String fileName = UUID.randomUUID().toString() + ext;

        // lưu vào thư mục deploy: /assets/uploaded-images
        String uploadDir = getServletContext().getRealPath("/assets/uploaded-images");
        Files.createDirectories(Paths.get(uploadDir));

        Path savePath = Paths.get(uploadDir, fileName);

        try (InputStream in = filePart.getInputStream()) {
            Files.copy(in, savePath, StandardCopyOption.REPLACE_EXISTING);
        }

        // trả về link ảnh để bạn test ngay
        String url = request.getContextPath() + "/assets/uploaded-images/" + fileName;
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write("Upload OK: " + url);
    }
}
