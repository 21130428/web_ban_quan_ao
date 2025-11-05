<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet">
<title>Bill - Luxury Clothes Store</title>
</head>
<body>
	<!-- sidebar -->
	<div class="sidebar">
		<h1 class="logo">Clothes Website</h1>

		<div class="sidebar-menu">
			<a href="index.jsp" class="active"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="clothe.jsp"><ion-icon name="shirt-outline"></ion-icon>Clothes</a>
			<a href="jewelry.jsp"><ion-icon name="diamond-outline"></ion-icon>Jewelry</a>
			<a href="bill.jsp" class="active"><ion-icon name="receipt-outline"></ion-icon>Bills</a>
			<a href="bookmark.jsp"><ion-icon name= "bookmark-outline"></ion-icon>Bookmarks</a>
			<a href="notification.jsp"><ion-icon name="notifications-outline"></ion-icon>Notification</a>
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact Us</a>
		</div>

		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- main -->
	<div class="main">
		<!-- main navbar -->
		<div class="main-navbar">
			<ion-icon class="menu-toggle" name="menu-outline"></ion-icon>
			<div class="search">
				<input type="text" placeholder="Search for order by ID or name">
				<button class="search-btn">Search</button>
			</div>
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>

		<!-- main content for invoice -->
		<div class="main-content">
			<h2 class="main-title">Hóa đơn của bạn</h2>
			<p class="invoice-desc">Xem chi tiết các đơn hàng bạn đã mua tại cửa hàng.</p>

			<div class="invoice-container">
				<div class="invoice-card">
					<h3>Đơn hàng #INV00123</h3>
					<p><strong>Ngày đặt:</strong> 15/10/2025</p>
					<p><strong>Phương thức thanh toán:</strong> Chuyển khoản</p>
					<p><strong>Trạng thái:</strong> Đã thanh toán ✅</p>

					<table class="invoice-table">
						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Số lượng</th>
								<th>Đơn giá</th>
								<th>Thành tiền</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Áo sơ mi</td>
								<td>2</td>
								<td>220.000VNĐ</td>
								<td>440.000VNĐ</td>
							</tr>
							<tr>
								<td>Đầm dự tiệc</td>
								<td>1</td>
								<td>1.500.000VNĐ</td>
								<td>1.500.000VNĐ</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3" style="text-align:right;"><strong>Tổng cộng:</strong></td>
								<td><strong>1.940.000VNĐ</strong></td>
							</tr>
						</tfoot>
					</table>

					<div class="invoice-actions">
						<button class="btn btn-print">Print invoice</button>
						<button class="btn btn-download">Download PDF</button>
					</div>
				</div>
				
				<div class="invoice-card">
					<h3>Đơn hàng #INV0364</h3>
					<p><strong>Ngày đặt:</strong> 19/02/2025</p>
					<p><strong>Phương thức thanh toán:</strong> Tiền mặt</p>
					<p><strong>Trạng thái:</strong> Đã thanh toán ✅</p>

					<table class="invoice-table">
						<thead>
							<tr>
								<th>Tên sản phẩm</th>
								<th>Số lượng</th>
								<th>Đơn giá</th>
								<th>Thành tiền</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Váy dạ hội</td>
								<td>2</td>
								<td>220.000VNĐ</td>
								<td>440.000VNĐ</td>
							</tr>
							<tr>
								<td>Đồng hồ nam</td>
								<td>1</td>
								<td>1.500.000VNĐ</td>
								<td>1.500.000VNĐ</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3" style="text-align:right;"><strong>Tổng cộng:</strong></td>
								<td><strong>2.890.000VNĐ</strong></td>
							</tr>
						</tfoot>
					</table>

					<div class="invoice-actions">
						<button class="btn btn-print">Print invoice</button>
						<button class="btn btn-download">Download PDF</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script src="../assets/js/app.js"></script>
</body>
</html>