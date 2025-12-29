<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Liên hệ | Fashion Shop</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f6f6f6;
}

.container {
	max-width: 1100px;
	margin: auto;
	padding: 40px 20px;
}

/* ================= TITLE ================= */
.page-title {
	text-align: center;
	margin-bottom: 40px;
}

.page-title h1 {
	font-size: 32px;
	margin-bottom: 10px;
	color: #2c3e50;
}

.page-title p {
	color: #777;
}

/* ================= CONTACT WRAPPER ================= */
.contact-wrapper {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 30px;
	background: #fff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
}

/* ================= INFO ================= */
.contact-info h3 {
	margin-bottom: 20px;
	color: #2c3e50;
}

.contact-info p {
	margin-bottom: 15px;
	color: #555;
	font-size: 14px;
}

.info-item {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
	color: #333;
	font-size: 14px;
}

.info-item i {
	margin-right: 10px;
	color: #3498db;
	font-size: 18px;
	width: 25px;
}

/* ================= FORM ================= */
.contact-form h3 {
	margin-bottom: 20px;
	color: #2c3e50;
}

.contact-form input, .contact-form textarea {
	width: 100%;
	padding: 12px 15px;
	margin-bottom: 15px;
	border-radius: 8px;
	border: 1px solid #ddd;
	outline: none;
	font-size: 14px;
	transition: 0.3s;
}

.contact-form input:focus, .contact-form textarea:focus {
	border-color: #3498db;
	box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.15);
}

.contact-form textarea {
	resize: none;
	height: 120px;
}

.contact-form button {
	width: 100%;
	padding: 12px;
	background: #3498db;
	color: white;
	border: none;
	border-radius: 25px;
	font-size: 15px;
	cursor: pointer;
	transition: 0.3s;
}

.contact-form button:hover {
	background: #2980b9;
}
/* Style cho ô thông báo */
.alert-box {
	position: fixed;
	top: 20px;
	right: 20px;
	min-width: 300px;
	padding: 15px 20px;
	border-radius: 8px;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	z-index: 1000;
	animation: slideIn 0.5s ease-out;
}

.success {
	background-color: #2ecc71;
} /* Màu xanh lá */
.error {
	background-color: #e74c3c;
} /* Màu đỏ */
.alert-content {
	display: flex;
	align-items: center;
	gap: 10px;
}

.alert-content i {
	font-size: 20px;
}

.close-btn {
	background: none;
	border: none;
	color: white;
	font-size: 20px;
	cursor: pointer;
	margin-left: 10px;
}
}
</style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
	<c:if test="${param.success == 'true'}">
		<div id="success-alert" class="alert-box success">
			<div class="alert-content">
				<i class="fa-solid fa-circle-check"></i> <span>Gửi tin nhắn
					thành công! Chúng tôi sẽ sớm phản hồi bạn.</span>
			</div>
			<button class="close-btn"
				onclick="this.parentElement.style.display='none'">&times;</button>
		</div>
	</c:if>

	<c:if test="${param.error == 'true'}">
		<div id="error-alert" class="alert-box error">
			<div class="alert-content">
				<i class="fa-solid fa-circle-exclamation"></i> <span>Gửi thất
					bại. Vui lòng kiểm tra lại thông tin!</span>
			</div>
			<button class="close-btn"
				onclick="this.parentElement.style.display='none'">&times;</button>
		</div>
	</c:if>

	<div class="container">

		<!-- TITLE -->
		<div class="page-title">
			<h1>Liên hệ với chúng tôi</h1>
			<p>Nếu bạn có thắc mắc hoặc cần hỗ trợ, hãy gửi tin nhắn cho
				chúng tôi</p>
		</div>

		<!-- CONTACT CONTENT -->
		<div class="contact-wrapper">

			<!-- INFO -->
			<div class="contact-info">
				<h3>Thông tin cửa hàng</h3>

				<p>Fashion Shop – Thời trang nam & nữ, cập nhật xu hướng mới
					nhất.</p>

				<div class="info-item">
					<i class="fa-solid fa-location-dot"></i> 123 Nguyễn Văn A, TP. Hồ
					Chí Minh
				</div>

				<div class="info-item">
					<i class="fa-solid fa-phone"></i> 0123 456 789
				</div>

				<div class="info-item">
					<i class="fa-solid fa-envelope"></i> support@fashionshop.com
				</div>

				<div class="info-item">
					<i class="fa-solid fa-clock"></i> 08:00 – 22:00 (T2 – CN)
				</div>
			</div>

			<!-- FORM -->
			<div class="contact-form">
				<h3>Gửi tin nhắn</h3>

				<form action="${pageContext.request.contextPath}/contact"
					method="post">
					<input type="text" name="fullName" placeholder="Họ và tên" required>
					<input type="email" name="email" placeholder="Email" required>
					<input type="text" name="phone" placeholder="Số điện thoại">
					<textarea name="message" placeholder="Nội dung liên hệ..." required></textarea>

					<button type="submit">
						<i class="fa-solid fa-paper-plane"></i> Gửi liên hệ
					</button>
				</form>
			</div>

		</div>

	</div>
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>
