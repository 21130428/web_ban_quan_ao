<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body class="auth-body">

	<div class="auth-container">
		<div class="auth-box">
			<h2>Đăng nhập</h2>
			<p class="auth-desc">Chào mừng bạn quay trở lại 👋</p>

			<form action="${pageContext.request.contextPath}/login" method="post">
				<div class="input-group">
					<i class="fa fa-envelope"></i> <input type="email" name="email"
						placeholder="Email" required>
				</div>

				<div class="input-group">
					<i class="fa fa-lock"></i> <input type="password" name="password"
						placeholder="Mật khẩu" required>
				</div>

				<button type="submit" class="auth-btn">Đăng nhập</button>
			</form>

			<p class="auth-link">
				Chưa có tài khoản? <a
					href="${pageContext.request.contextPath}/user-pages/signup.jsp">Đăng
					ký</a>
			</p>
		</div>

	</div>

</body>
</html>
