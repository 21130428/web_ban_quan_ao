<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Giỏ hàng | Fashion Shop</title>

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

.page-title h1 {
	font-size: 28px;
	color: #2c3e50;
}

.page-title i {
	color: #3498db;
	font-size: 26px;
}

/* ================= CART ================= */
.cart-wrapper {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 30px;
}

/* ================= TABLE ================= */
table {
	width: 100%;
	background: #fff;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: center;
	font-size: 14px;
}

th {
	background: #f2f2f2;
	color: #333;
}

td img {
	width: 80px;
	border-radius: 8px;
}

.product-name {
	font-weight: 500;
	color: #333;
}

/* ================= QUANTITY ================= */
.quantity {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
}

.quantity button {
	width: 28px;
	height: 28px;
	border: none;
	background: #ecf0f1;
	cursor: pointer;
	border-radius: 50%;
}

.quantity input {
	width: 40px;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 5px;
}

/* ================= ACTION ================= */
.remove {
	color: #e74c3c;
	cursor: pointer;
	font-size: 18px;
}

/* ================= SUMMARY ================= */
.summary {
	background: #fff;
	padding: 25px;
	border-radius: 15px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
	height: fit-content;
}

.summary h3 {
	margin-bottom: 20px;
	color: #2c3e50;
}

.summary-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 12px;
	font-size: 14px;
}

.summary-row.total {
	font-weight: 600;
	font-size: 16px;
}

.checkout-btn {
	width: 100%;
	margin-top: 20px;
	padding: 12px;
	border: none;
	background: #3498db;
	color: white;
	border-radius: 25px;
	font-size: 15px;
	cursor: pointer;
	transition: 0.3s;
}

.checkout-btn:hover {
	background: #2980b9;
}

/* ================= EMPTY ================= */
.empty {
	text-align: center;
	padding: 80px 20px;
	background: #fff;
	border-radius: 15px;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
}

.empty i {
	font-size: 60px;
	color: #3498db;
	margin-bottom: 15px;
}

.empty a {
	display: inline-block;
	margin-top: 20px;
	color: #3498db;
	text-decoration: none;
	font-weight: 500;
}

.empty a:hover {
	text-decoration: underline;
}

@media ( max-width : 768px) {
	.cart-wrapper {
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
			<i class="fa-solid fa-cart-shopping"></i>
			<h1>Giỏ hàng của bạn</h1>
		</div>

		<!-- ================= CART CONTENT ================= -->
		<div class="cart-wrapper">

			<!-- CART TABLE -->
			<table>
				<thead>
					<tr>
						<th>Sản phẩm</th>
						<th>Tên</th>
						<th>Giá</th>
						<th>Số lượng</th>
						<th>Tổng</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<!-- ITEM -->
					<!-- PRODUCT 1 -->
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/ao-thun.jpg"
							alt="Áo thun"></td>
						<td class="product-name">Áo thun basic</td>
						<td>199.000đ</td>
						<td>
							<div class="quantity">
								<button>-</button>
								<input type="text" value="1">
								<button>+</button>
							</div>
						</td>
						<td>199.000đ</td>
						<td><i class="fa-solid fa-trash remove"></i></td>
					</tr>

					<!-- PRODUCT 2 -->
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/quan-jean.jpg"
							alt="Quần jean nữ"></td>
						<td class="product-name">Quần jean nữ</td>
						<td>399.000đ</td>
						<td>
							<div class="quantity">
								<button>-</button>
								<input type="text" value="2">
								<button>+</button>
							</div>
						</td>
						<td>798.000đ</td>
						<td><i class="fa-solid fa-trash remove"></i></td>
					</tr>

					<!-- PRODUCT 3 -->
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/vay-yem.jpg"
							alt="Váy yếm"></td>
						<td class="product-name">Váy yếm</td>
						<td>599.000đ</td>
						<td>
							<div class="quantity">
								<button>-</button>
								<input type="text" value="1">
								<button>+</button>
							</div>
						</td>
						<td>599.000đ</td>
						<td><i class="fa-solid fa-trash remove"></i></td>
					</tr>

					<!-- PRODUCT 4 -->
					<tr>
						<td><img
							src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/ao-len.jpg"
							alt="Áo khoác nữ"></td>
						<td class="product-name">Áo len nữ</td>
						<td>799.000đ</td>
						<td>
							<div class="quantity">
								<button>-</button>
								<input type="text" value="1">
								<button>+</button>
							</div>
						</td>
						<td>799.000đ</td>
						<td><i class="fa-solid fa-trash remove"></i></td>
					</tr>

				</tbody>
			</table>

			<!-- SUMMARY -->
			<div class="summary">
				<h3>Tóm tắt đơn hàng</h3>

				<div class="summary-row">
					<span>Tạm tính</span> <span>199.000đ</span>
				</div>

				<div class="summary-row">
					<span>Phí vận chuyển</span> <span>30.000đ</span>
				</div>

				<div class="summary-row total">
					<span>Tổng cộng</span> <span>229.000đ</span>
				</div>

				<button class="checkout-btn"
			        type="button"
			        onclick="window.location.href='${pageContext.request.contextPath}/user-pages/payment.jsp'">
			    Thanh toán
			</button>
			</div>

		</div>

		<!-- EMPTY STATE -->
		<!--
    <div class="empty">
        <i class="fa-solid fa-cart-arrow-down"></i>
        <h3>Giỏ hàng trống</h3>
        <p>Hãy thêm sản phẩm vào giỏ hàng để tiếp tục mua sắm</p>
        <a href="${pageContext.request.contextPath}/index.jsp">Quay lại mua sắm</a>
    </div>
    -->

	</div>
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>
