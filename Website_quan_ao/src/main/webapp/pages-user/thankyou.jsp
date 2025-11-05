<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thank You - Luxury Clothes Store</title>
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet">
<style>
.thankyou-section {
	padding: 60px;
	text-align: center;
	background-color: #fff;
	border-radius: 12px;
	margin: 40px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.thankyou-section h2 {
	font-size: 28px;
	color: #4CAF50;
	margin-bottom: 20px;
}

.thankyou-section p {
	font-size: 16px;
	margin-bottom: 10px;
}

.thankyou-details {
	margin-top: 30px;
	text-align: left;
	display: inline-block;
	background-color: #f9f9f9;
	padding: 20px 30px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.thankyou-details strong {
	color: #333;
}

.thankyou-buttons {
	margin-top: 30px;
}

.thankyou-buttons a {
	display: inline-block;
	padding: 10px 20px;
	border-radius: 6px;
	text-decoration: none;
	margin: 0 10px;
}

.btn-home {
	background-color: #4CAF50;
	color: white;
}

.btn-home:hover {
	background-color: #45a049;
}

.btn-shop {
	background-color: #2196F3;
	color: white;
}

.btn-shop:hover {
	background-color: #1b7cd6;
}
</style>
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
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact Us</a>
		</div>
		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- main -->
	<div class="main">

		<!-- Thank You Section -->
		<div class="thankyou-section">
			<h2>Cảm ơn bạn đã mua sắm tại Luxury Clothes Store!</h2>
			<p>Đơn hàng của bạn đã được ghi nhận và đang trong quá trình xử lý.</p>
			<p>Chúng tôi sẽ liên hệ với bạn trong thời gian sớm nhất để xác nhận đơn hàng.</p>

			<div class="thankyou-details">
				<p><strong>Họ tên:</strong> <%= request.getParameter("fullname") %></p>
				<p><strong>Email:</strong> <%= request.getParameter("email") %></p>
				<p><strong>Số điện thoại:</strong> <%= request.getParameter("phone") %></p>
				<p><strong>Địa chỉ giao hàng:</strong> <%= request.getParameter("address") %></p>
				<p><strong>Phương thức thanh toán:</strong>
					<%
						String payment = request.getParameter("payment");
						if ("cod".equals(payment)) out.print("Thanh toán khi nhận hàng");
						else if ("bank".equals(payment)) out.print("Chuyển khoản ngân hàng");
						else if ("momo".equals(payment)) out.print("Ví MoMo");
						else out.print("Không xác định");
					%>
				</p>
			</div>

			<div class="thankyou-buttons">
				<a href="index.jsp" class="btn-home">Home</a>
				<a href="clothe.jsp" class="btn-shop">Continue Shopping</a>
			</div>
		</div>
	</div>

	<!-- Ionicons -->
	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
