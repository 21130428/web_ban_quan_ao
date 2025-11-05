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
<title>Your Cart - Luxury Clothes Store</title>
<style>
.main-cart {
  padding: 20px;
}

.cart-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.cart-table th, .cart-table td {
  padding: 10px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}

.cart-img {
  width: 60px;
  height: 60px;
  object-fit: cover;
  border-radius: 10px;
  margin-right: 10px;
}

.cart-qty {
  width: 60px;
  text-align: center;
}

.btn-remove {
  background-color: crimson;
  color: white;
  border: none;
  padding: 5px 10px;
  cursor: pointer;
  border-radius: 6px;
}

.btn-remove:hover {
  background-color: darkred;
}

.cart-summary {
  margin-top: 20px;
  text-align: right;
}

.cart-buttons {
  margin-top: 15px;
}

.btn-continue, .btn-checkout {
  display: inline-block;
  padding: 10px 20px;
  border-radius: 8px;
  text-decoration: none;
  border: none;
  cursor: pointer;
}

.btn-continue {
  background-color: #ddd;
  color: black;
}

.btn-checkout {
  background-color: #2e8b57;
  color: white;
  margin-left: 10px;
}

.btn-checkout:hover {
  background-color: #1f6b40;
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
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact
				Us</a>
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
				<input type="text" placeholder="Search for your favourite clothes">
				<button class="search-btn">Search</button>
			</div>
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>

		<!-- main content -->
		<div class="main-cart">
			<h2 class="main-title">🛍 Giỏ hàng của bạn</h2>
			<hr class="divider">

			<table class="cart-table">
				<thead>
					<tr>
						<th>Sản phẩm</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Tổng</th>
						<th>Xóa</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><img
							src="../assets/images/Female/Female_adult/ao-kieu.webp"
							class="cart-img"> <span>Áo kiểu nữ</span></td>
						<td>350.000 VNĐ</td>
						<td><input type="number" value="1" min="1" class="cart-qty"></td>
						<td>350.000 VNĐ</td>
						<td><button class="btn-remove">X</button></td>
					</tr>
					<tr>
						<td><img
							src="../assets/images/Male/Male_adult/ao-cardigan.jpg"
							class="cart-img"> <span>Áo cardigan nam</span></td>
						<td>680.000 VNĐ</td>
						<td><input type="number" value="2" min="1" class="cart-qty"></td>
						<td>1.360.000 VNĐ</td>
						<td><button class="btn-remove">X</button></td>
					</tr>
				</tbody>
			</table>

			<div class="cart-summary">
				<h3>
					Tổng cộng: <span class="cart-total">1.710.000 VNĐ</span>
				</h3>
				<div class="cart-buttons">
					<a href="index.jsp" class="btn-continue">← Continue Shopping</a>
					<button class="btn-checkout"
						onclick="window.location.href='checkout.jsp'">Check out now</button>
				</div>
			</div>
		</div>
	</div>

	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>