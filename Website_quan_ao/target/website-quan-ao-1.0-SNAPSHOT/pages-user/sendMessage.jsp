<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Liên hệ - Kết quả</title>
    <link rel="stylesheet" href="style.css">
    <style>
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh;
            background-color: var(--greyColor);
        }

        .message-box {
            background: #fff;
            padding: 2rem 3rem;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            max-width: 600px;
            width: 100%;
            animation: fadeInUp 0.6s ease;
        }

        .message-box h2 {
            color: var(--primaryColor);
            margin-bottom: 1rem;
        }

        .message-box p {
            color: var(--blackColor);
            margin-bottom: 2rem;
        }

        .btn-back {
            background: linear-gradient(135deg, var(--primaryColor), var(--secondaryColor));
            color: var(--secondaryColor);
            border: none;
            padding: 12px 25px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(212, 175, 55, 0.3);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <main>
        <div class="message-box">
            <%
                request.setCharacterEncoding("UTF-8");

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String message = request.getParameter("message");

                if (name == null || email == null || message == null ||
                    name.trim().isEmpty() || email.trim().isEmpty() || message.trim().isEmpty()) {
            %>
                <h2>⚠️ Thiếu thông tin!</h2>
                <p>Vui lòng nhập đầy đủ họ tên, email và nội dung trước khi gửi.</p>
                <a href="contact.jsp" class="btn-back">Quay lại</a>
            <%
                } else {
                    // Lưu tin nhắn vào file (tuỳ chọn)
                    try {
                        String filePath = application.getRealPath("/WEB-INF/messages.txt");
                        FileWriter fw = new FileWriter(filePath, true);
                        PrintWriter outFile = new PrintWriter(fw);
                        outFile.println("Tên: " + name);
                        outFile.println("Email: " + email);
                        outFile.println("Nội dung: " + message);
                        outFile.println("Thời gian: " + new Date());
                        outFile.println("----------------------------------------");
                        outFile.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
            %>
                <h2>🎉 Gửi thành công!</h2>
                <p>Cảm ơn <b><%= name %></b> đã liên hệ với chúng tôi.<br>
                Chúng tôi sẽ phản hồi qua email: <b><%= email %></b> sớm nhất có thể.</p>
                <a href="contact.jsp" class="btn-back">Gửi thêm tin nhắn</a>
            <%
                }
            %>
        </div>
    </main>
</body>
</html>
