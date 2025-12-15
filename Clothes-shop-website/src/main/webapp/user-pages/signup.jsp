<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet"
    href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body class="auth-body">

<div class="auth-container">
    <div class="auth-box">
        <h2>Đăng ký</h2>
        <p class="auth-desc">Tạo tài khoản mới</p>

        <form action="${pageContext.request.contextPath}/signup" method="post">

            <div class="input-group">
                <i class="fa fa-user"></i>
                <input type="text" name="username" placeholder="Username" required>
            </div>

            <div class="input-group">
                <i class="fa fa-envelope"></i>
                <input type="email" name="email" placeholder="Email" required>
            </div>

            <div class="input-group">
                <i class="fa fa-lock"></i>
                <input type="password" name="password" placeholder="Mật khẩu" required>
            </div>

            <div class="input-group">
                <i class="fa fa-lock"></i>
                <input type="password" name="confirm" placeholder="Nhập lại mật khẩu" required>
            </div>

            <button type="submit" class="auth-btn">Đăng ký</button>
        </form>

        <p class="auth-link">
            Đã có tài khoản?
            <a href="${pageContext.request.contextPath}/user-pages/login.jsp">Đăng nhập</a>
        </p>
    </div>
</div>

</body>
</html>
