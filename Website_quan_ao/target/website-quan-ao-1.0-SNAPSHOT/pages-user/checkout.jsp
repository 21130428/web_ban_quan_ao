<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout - Luxury Clothes Store</title>
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet">
<style>
.checkout-section {
	padding: 40px;
}

.checkout-container {
	display: flex;
	gap: 40px;
	flex-wrap: wrap;
	background: #fff;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.cart-summary {
	flex: 1;
	min-width: 400px;
}

.cart-summary table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

.cart-summary th, .cart-summary td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.cart-total {
	margin-top: 15px;
	font-size: 16px;
}

.cart-total .total {
	font-size: 18px;
	color: #e91e63;
}

.checkout-form {
	flex: 1;
	min-width: 350px;
}

.checkout-form form {
	display: flex;
	flex-direction: column;
}

.checkout-form label {
	margin-top: 10px;
	font-weight: 600;
}

.checkout-form input, .checkout-form textarea, .checkout-form select {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 14px;
}

.checkout-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.checkout-btn {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
}

.back-btn {
	background-color: #ddd;
	color: #333;
	padding: 10px 20px;
	border-radius: 6px;
	text-decoration: none;
}

.checkout-btn:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<!-- sidebar -->
	<div class="sidebar">
		<!-- Logo -->
		<h1 class ="logo">Clothes Website</h1>
		
		<!-- List of menus -->
		<div class ="sidebar-menu">
			<a href="index.jsp" class="active"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="clothe.jsp"><ion-icon name="shirt-outline"></ion-icon>Clothes</a>
			<a href="jewelry.jsp"><ion-icon name="diamond-outline"></ion-icon>Jewelry</a>
			<a href="bill.jsp" class="active"><ion-icon name="receipt-outline"></ion-icon>Bills</a>
			<a href="bookmark.jsp"><ion-icon name= "bookmark-outline"></ion-icon>Bookmarks</a>
			<a href="notification.jsp"><ion-icon name= "notifications-outline"></ion-icon>Notifications</a>
			<a href="contact.jsp"><ion-icon name= "chatbubbles-outline"></ion-icon>Contact Us</a>
		</div>
		
		<!-- Logout  -->
		<div class ="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name= "log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- Main content -->
	<div class="main">
		<!-- Navbar -->
		<div class= "main-navbar">
			<!-- menu appear when mobile version -->
			<ion-icon class="menu-toggle" name="menu-outline"></ion-icon>
			<!-- search bar -->
			<div class="search">
				<input type="text" placeholder="Search for your favourite clothes">
				<button class="search-btn">Search</button>
			</div>
			<!-- profile icon on left side of navbar -->
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>

		<!-- Checkout Section -->
		<div class="checkout-section">
			<h2 class="main-title">Checkout</h2>
			<div class="checkout-container">
				<!-- Cart Summary -->
				<div class="cart-summary">
					<h3>Your Order</h3>
					<table class="cart-table">
						<thead>
							<tr>
								<th>Product</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Áo 2 dây</td>
								<td>300.000 VNĐ</td>
								<td>1</td>
								<td>300.000 VNĐ</td>
							</tr>
							<tr>
								<td>Đầm dự tiệc</td>
								<td>1.500.000 VNĐ</td>
								<td>1</td>
								<td>1.500.000 VNĐ</td>
							</tr>
						</tbody>
					</table>
					<div class="cart-total">
						<p>
							<strong>Subtotal:</strong> 1.800.000 VNĐ
						</p>
						<p>
							<strong>Shipping:</strong> 50.000 VNĐ
						</p>
						<p class="total">
							<strong>Total:</strong> 1.850.000 VNĐ
						</p>
					</div>
				</div>

				<!-- Payment Form -->
				<div class="checkout-form">
					<h3>Billing Details</h3>
					<form action="thankyou.jsp" method="post">
						<label>Full Name</label> <input type="text" name="fullname"
							required> <label>Email</label> <input type="email"
							name="email" required> <label>Phone Number</label> <input
							type="tel" name="phone" required> <label>Shipping
							Address</label>
						<textarea name="address" rows="3" required></textarea>

						<label>Payment Method</label> <select name="payment" required>
							<option value="">-- Select --</option>
							<option value="cod">Cash on Delivery</option>
							<option value="bank">Bank Transfer</option>
							<option value="momo">MoMo Wallet</option>
						</select>

						<div class="checkout-buttons">
							<button type="submit" class="checkout-btn">Confirm
								Payment</button>
							<a href="cart.jsp" class="back-btn">Back to Cart</a>
						</div>
					</form>
				</div>
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
