<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">

<style type="text/css">
.auth-error {
	background: #ffe6e6;
	color: #b00020;
	padding: 10px 14px;
	border-radius: 6px;
	margin-bottom: 14px;
	font-size: 14px;
	display: flex;
	align-items: center;
	gap: 8px;
}
</style>
</head>

<body class="auth-body">

	<div class="auth-container">
		<div class="auth-box">
			<h2>Đăng nhập</h2>
			<p class="auth-desc">Chào mừng bạn quay trở lại 👋</p>
			<c:if test="${not empty loginMessage}">
				<p style="color: red">${loginMessage}</p>
				<c:remove var="loginMessage" scope="session" />
			</c:if>
			<c:if test="${not empty error}">
				<div class="auth-error">
					<i class="fa fa-triangle-exclamation"></i> ${error}
				</div>
			</c:if>
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
			<a style="color: blue"
				href="${pageContext.request.contextPath}/user-pages/forgot-password.jsp">Quên
				mật khẩu</a>
		</div>

	</div>

</body>

</html>
