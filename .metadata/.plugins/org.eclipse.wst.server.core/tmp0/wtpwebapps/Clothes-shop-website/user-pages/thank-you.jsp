<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <div class="icon" style="background: #27ae60; color: white; width: 80px; height: 80px; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 20px; font-size: 40px;">
        <i class="fa-solid fa-check"></i>
    </div>

    <h1 style="color: #2c3e50; margin-bottom: 10px;">Đặt hàng thành công!</h1>
    
    <%-- Lấy orderId từ URL: ?id=... --%>
    <div class="order-number" style="background: #f8f9fa; padding: 15px; border-radius: 8px; margin-bottom: 20px; border: 1px dashed #ddd;">
        <p style="margin: 0; color: #7f8c8d;">Mã đơn hàng của bạn:</p>
        <h2 style="margin: 5px 0; color: #2c3e50; letter-spacing: 1px;">#ORD-${param.id}</h2>
    </div>

    <p style="color: #555; line-height: 1.6;">
        Cảm ơn bạn đã tin tưởng chọn <strong>Fashion Shop</strong>.<br>
        Thông tin đơn hàng đã được gửi qua email của bạn. <br>
        Chúng tôi sẽ sớm liên hệ để xác nhận và giao hàng.
    </p>

    <div class="btn-group" style="margin-top: 30px; display: flex; gap: 15px; justify-content: center;">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-home" style="padding: 12px 25px; background: #3498db; color: white; text-decoration: none; border-radius: 25px; display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-house"></i> Tiếp tục mua sắm
        </a>
    </div>
</div>

</body>
</html>
