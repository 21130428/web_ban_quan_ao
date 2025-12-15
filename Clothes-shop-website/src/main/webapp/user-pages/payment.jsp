<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Thanh toán | Fashion Shop</title>

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
	max-width: 1200px;
	margin: auto;
	padding: 40px 20px;
}

/* ================= TITLE ================= */
.page-title {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 30px;
}

.page-title i {
	font-size: 26px;
	color: #27ae60;
}

.page-title h1 {
	font-size: 28px;
	color: #2c3e50;
}

/* ================= CHECKOUT ================= */
.checkout-wrapper {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 30px;
}

/* ================= FORM ================= */
.checkout-form {
	background: #fff;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
}

.checkout-form h3 {
	margin-bottom: 20px;
	color: #2c3e50;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 6px;
	font-size: 14px;
	color: #555;
}

.form-group input, .form-group textarea, .form-group select {
	width: 100%;
	padding: 12px;
	border-radius: 8px;
	border: 1px solid #ddd;
	outline: none;
	font-size: 14px;
}

.form-group textarea {
	resize: none;
	height: 90px;
}

/* ================= PAYMENT ================= */
.payment-method {
	margin-top: 25px;
}

.payment-method label {
	display: flex;
	align-items: center;
	gap: 10px;
	margin-bottom: 10px;
	cursor: pointer;
	font-size: 14px;
}

/* ================= ORDER SUMMARY ================= */
.order-summary {
	background: #fff;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
	height: fit-content;
}

.order-summary h3 {
	margin-bottom: 20px;
	color: #2c3e50;
}

.summary-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
	font-size: 14px;
}

.summary-row.total {
	font-weight: 600;
	font-size: 16px;
}

.place-order-btn {
	width: 100%;
	margin-top: 20px;
	padding: 12px;
	border: none;
	background: #27ae60;
	color: white;
	border-radius: 25px;
	font-size: 15px;
	cursor: pointer;
	transition: 0.3s;
}

.place-order-btn:hover {
	background: #219150;
}

@media ( max-width : 768px) {
	.checkout-wrapper {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
	<div class="container">

		<!-- TITLE -->
		<div class="page-title">
			<i class="fa-solid fa-credit-card"></i>
			<h1>Thanh toán</h1>
		</div>

		<div class="checkout-wrapper">

			<!-- ================= FORM ================= -->
			<div class="checkout-form">
				<h3>Thông tin giao hàng</h3>

				<form action="checkout" method="post">

					<div class="form-group">
						<label>Họ và tên</label> <input type="text" name="fullName"
							required>
					</div>

					<div class="form-group">
						<label>Số điện thoại</label> <input type="text" name="phone"
							required>
					</div>

					<div class="form-group">
						<label>Email</label> <input type="email" name="email">
					</div>

					<div class="form-group">
						<label>Địa chỉ giao hàng</label>
						<textarea name="address" required></textarea>
					</div>

					<div class="payment-method">
						<h3>Phương thức thanh toán</h3>

						<label> <input type="radio" name="payment" checked>
							Thanh toán khi nhận hàng (COD)
						</label> <label> <input type="radio" name="payment">
							Chuyển khoản ngân hàng
						</label> <label> <input type="radio" name="payment"> Ví
							điện tử (Momo, ZaloPay)
						</label>
					</div>

				</form>
			</div>

			<!-- ================= SUMMARY ================= -->
			<div class="order-summary">
				<h3>Đơn hàng của bạn</h3>

				<div class="summary-row">
					<span>Tạm tính</span> <span>1.995.000đ</span>
				</div>

				<div class="summary-row">
					<span>Phí vận chuyển</span> <span>30.000đ</span>
				</div>

				<div class="summary-row total">
					<span>Tổng cộng</span> <span>2.025.000đ</span>
				</div>

				<button class="place-order-btn"
			        type="button"
			        onclick="window.location.href='${pageContext.request.contextPath}/user-pages/order-success.jsp'">
			    Đặt hàng
			</button>
			</div>

		</div>

	</div>
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>