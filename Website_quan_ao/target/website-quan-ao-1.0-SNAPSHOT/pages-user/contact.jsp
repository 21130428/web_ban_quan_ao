<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<title>Contact Us</title>
</head>
<body>
	<!-- sidebar -->
	<div class="sidebar">
		<h1 class="logo">Clothes Website</h1>
		<div class="sidebar-menu">
			<a href="index.jsp"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="clothe.jsp"><ion-icon name="shirt-outline"></ion-icon>Clothes</a>
			<a href="jewelry.jsp"><ion-icon name="diamond-outline"></ion-icon>Jewelry</a>
			<a href="bill.jsp"><ion-icon name="receipt-outline"></ion-icon>Bills</a>
			<a href="bookmark.jsp"><ion-icon name="bookmark-outline"></ion-icon>Bookmarks</a>
			<a href="notification.jsp"><ion-icon name="notifications-outline"></ion-icon>Notifications</a>
			<a href="contact.jsp" class="active"><ion-icon
					name="chatbubbles-outline"></ion-icon>Contact Us</a>
		</div>
		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- main -->
	<div class="main">
		

		<!-- main content -->
		<div class="main-highlight">
			<h2 class="main-title">Contact Us</h2>
			<p style="margin: 1rem 0; color: #333;">Chúng tôi luôn sẵn sàng
				lắng nghe ý kiến của bạn! Hãy gửi tin nhắn hoặc liên hệ trực tiếp
				với chúng tôi qua thông tin bên dưới.</p>

			<div class="contact-container">
				<!-- contact info -->
				<div class="contact-info">
					<h3>Thông tin liên hệ</h3>
					<p>
						<ion-icon name="location-outline"></ion-icon>
						123 Lê Lợi, Quận 1, TP. Hồ Chí Minh
					</p>
					<p>
						<ion-icon name="call-outline"></ion-icon>
						0909 999 888
					</p>
					<p>
						<ion-icon name="mail-outline"></ion-icon>
						support@clotheswebsite.com
					</p>
					<p>
						<ion-icon name="time-outline"></ion-icon>
						Thứ 2 – Thứ 7: 8:00 – 21:00
					</p>

					<div class="social-links">
						<a href="#"><ion-icon name="logo-facebook"></ion-icon></a> <a
							href="#"><ion-icon name="logo-instagram"></ion-icon></a> <a
							href="#"><ion-icon name="logo-tiktok"></ion-icon></a>
					</div>
				</div>

				<!-- Phần nội dung liên hệ -->
				<main>
					<div class="contact-container">
						<div class="contact-form">
							<h3>📩 Gửi tin nhắn cho chúng tôi</h3>
							<form action="sendMessage.jsp" method="post">
								<div class="form-row">
									<div class="form-group">
										<label>Họ và tên</label> <input type="text" name="name"
											required placeholder="Nhập họ tên của bạn">
									</div>

									<div class="form-group">
										<label>Email</label> <input type="email" name="email" required
											placeholder="Nhập email của bạn">
									</div>
								</div>

								<div class="form-group full-width">
									<label>Nội dung</label>
									<textarea name="message" rows="8" required
										placeholder="Nhập nội dung liên hệ"></textarea>
								</div>

								<button type="submit" class="btn-send">Send message</button>
							</form>
						</div>
					</div>
				</main>
			</div>
		</div>

		<!-- icons -->
		<script type="module"
			src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule
			src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
