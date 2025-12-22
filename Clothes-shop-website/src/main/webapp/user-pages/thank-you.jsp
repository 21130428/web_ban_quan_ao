<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Cảm ơn bạn | Fashion Shop</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #fdfbfb, #ebedee);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .thank-box {
            background: #fff;
            padding: 40px 35px;
            max-width: 500px;
            width: 100%;
            text-align: center;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .icon {
            width: 80px;
            height: 80px;
            background: #2ecc71;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            font-size: 36px;
            margin: auto;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 26px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        p {
            font-size: 15px;
            color: #555;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }

        .btn {
            padding: 12px 22px;
            border-radius: 30px;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-home {
            background: #3498db;
            color: white;
        }

        .btn-home:hover {
            background: #2980b9;
        }

        .btn-contact {
            border: 1px solid #3498db;
            color: #3498db;
        }

        .btn-contact:hover {
            background: #3498db;
            color: white;
        }
    </style>
</head>
<body>

<div class="thank-box">
    <div class="icon">
        <i class="fa-solid fa-check"></i>
    </div>

    <h1>Cảm ơn bạn!</h1>
    <p>
        Chúng tôi đã nhận được liên hệ của bạn.<br>
        Đội ngũ <strong>Fashion Shop</strong> sẽ phản hồi trong thời gian sớm nhất.
    </p>

    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/user-pages/home.jsp" class="btn btn-home">
            <i class="fa-solid fa-house"></i> Trang chủ
        </a>

        <a href="${pageContext.request.contextPath}/user-pages/contact.jsp" class="btn btn-contact">
            Gửi thêm liên hệ
        </a>
    </div>
</div>

</body>
</html>
