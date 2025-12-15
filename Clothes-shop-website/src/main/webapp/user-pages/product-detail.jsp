<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Chi tiết sản phẩm | Fashion Shop</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
* {
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f6f6f6;
	margin: 0;
	padding: 30px 0;
}

.container {
	width: 1200px;
	max-width: 95%;
	margin: auto;
}

/* ================= PRODUCT DETAIL ================= */
.product-detail {
	background: white;
	padding: 30px;
	display: grid;
	grid-template-columns: 1fr 1.2fr;
	gap: 40px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
}

.product-image img {
	width: 100%;
	border-radius: 10px;
}

.product-info h1 {
	font-size: 26px;
	margin-bottom: 10px;
}

.price {
	font-size: 24px;
	color: #e74c3c;
	font-weight: 600;
	margin-bottom: 15px;
}

.desc {
	font-size: 14px;
	color: #555;
	margin-bottom: 20px;
	line-height: 1.6;
}

.option-group {
	margin-bottom: 20px;
}

.option-group strong {
	display: block;
	margin-bottom: 8px;
}

/* COLORS */
.colors span {
	display: inline-block;
	width: 28px;
	height: 28px;
	border-radius: 50%;
	margin-right: 8px;
	cursor: pointer;
	border: 2px solid transparent;
}

.colors span:hover {
	border-color: #333;
}

.black {
	background: #000;
}

.white {
	background: #fff;
	border: 1px solid #ccc;
}

.red {
	background: #e74c3c;
}

.blue {
	background: #3498db;
}

/* SIZES */
.sizes span {
	padding: 6px 14px;
	border: 1px solid #ccc;
	border-radius: 20px;
	margin-right: 8px;
	cursor: pointer;
	font-size: 14px;
}

.sizes span:hover {
	background: #000;
	color: white;
}

/* QUANTITY */
.quantity {
	display: flex;
	align-items: center;
	gap: 10px;
}

.quantity button {
	width: 32px;
	height: 32px;
	border: none;
	background: #ddd;
	cursor: pointer;
}

.quantity input {
	width: 50px;
	text-align: center;
}

/* BUTTONS */
.actions {
	display: flex;
	gap: 15px;
	margin-top: 20px;
}

.btn {
	padding: 12px 20px;
	border-radius: 30px;
	cursor: pointer;
	border: none;
	font-size: 14px;
}

.btn-cart {
	background: #000;
	color: white;
}

.btn-cart:hover {
	opacity: 0.85;
}

.btn-fav {
	background: #fff;
	border: 1px solid #ccc;
}

.btn-fav:hover {
	color: red;
}

/* ================= SUGGEST PRODUCTS ================= */
.suggest-title {
	margin: 40px 0 20px;
	font-size: 22px;
}

.suggest-grid {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.product-card {
	background: white;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.product-card:hover {
	transform: translateY(-6px);
}

.product-card img {
	width: 100%;
	height: 220px;
	object-fit: cover;
}

.product-card .info {
	padding: 12px;
}

.product-card h4 {
	font-size: 15px;
	margin-bottom: 6px;
}

.product-card .price {
	font-size: 16px;
	color: #e74c3c;
}

/* ================= REVIEWS ================= */
.reviews {
	margin-top: 50px;
	background: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
}

.reviews h2 {
	margin-bottom: 20px;
}

.review-summary {
	display: flex;
	align-items: center;
	margin-bottom: 25px;
}

.avg-rating {
	text-align: center;
}

.avg-rating .score {
	font-size: 36px;
	font-weight: 700;
}

.stars {
	color: #f1c40f;
	margin: 5px 0;
}

.review-list {
	margin-bottom: 30px;
}

.review-item {
	border-bottom: 1px solid #eee;
	padding: 15px 0;
}

.review-item strong {
	display: block;
	margin-bottom: 4px;
}

.review-item p {
	font-size: 14px;
	color: #555;
	margin-top: 6px;
}

/* ADD REVIEW */
.add-review h3 {
	margin-bottom: 10px;
}

.rating-select i {
	font-size: 22px;
	cursor: pointer;
	color: #ccc;
}

.rating-select i:hover {
	color: #f1c40f;
}

.add-review textarea {
	width: 100%;
	height: 100px;
	margin: 12px 0;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	resize: none;
}

.add-review button {
	padding: 10px 20px;
	background: #000;
	color: white;
	border: none;
	border-radius: 25px;
	cursor: pointer;
}

.add-review button:hover {
	opacity: 0.85;
}
</style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
	<div class="container">

		<!-- ================= PRODUCT DETAIL ================= -->
		<div class="product-detail">
			<div class="product-image">
				<img
					src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/ao-thun.jpg"
					alt="Áo thun basic">
			</div>

			<div class="product-info">
				<h1>Áo thun basic</h1>
				<div class="price">199.000đ</div>

				<p class="desc">Áo thun basic form rộng, chất cotton mềm mịn,
					phù hợp mặc hằng ngày hoặc phối nhiều phong cách khác nhau.</p>

				<!-- COLOR -->
				<div class="option-group">
					<strong>Màu sắc</strong>
					<div class="colors">
						<span class="black"></span> <span class="white"></span> <span
							class="red"></span> <span class="blue"></span>
					</div>
				</div>

				<!-- SIZE -->
				<div class="option-group">
					<strong>Kích cỡ</strong>
					<div class="sizes">
						<span>S</span> <span>M</span> <span>L</span> <span>XL</span>
					</div>
				</div>

				<!-- QUANTITY -->
				<div class="option-group">
					<strong>Số lượng</strong>
					<div class="quantity">
						<button>-</button>
						<input type="text" value="1">
						<button>+</button>
					</div>
				</div>

				<!-- ACTIONS -->
				<div class="actions">
					<button class="btn btn-cart">
						<i class="fa-solid fa-cart-shopping"></i> Thêm vào giỏ
					</button>

					<button class="btn btn-fav">
						<i class="fa-solid fa-heart"></i> Yêu thích
					</button>
				</div>
			</div>
		</div>

		<!-- ================= REVIEWS ================= -->
		<div class="reviews">

			<h2>Đánh giá sản phẩm</h2>

			<!-- SUMMARY -->
			<div class="review-summary">
				<div class="avg-rating">
					<span class="score">4.5</span>
					<div class="stars">
						<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star-half-stroke"></i>
					</div>
					<p>12 đánh giá</p>
				</div>
			</div>

			<!-- REVIEW LIST -->
			<div class="review-list">

				<div class="review-item">
					<strong>Nguyễn Văn A</strong>
					<div class="stars">
						<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
						<i class="fa-regular fa-star"></i>
					</div>
					<p>Áo đẹp, vải mềm, mặc rất thoải mái 👍</p>
				</div>

				<div class="review-item">
					<strong>Trần Thị B</strong>
					<div class="stars">
						<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i>
						<i class="fa-solid fa-star"></i>
					</div>
					<p>Đóng gói cẩn thận, giao hàng nhanh, sẽ mua lại.</p>
				</div>

			</div>

			<!-- ADD REVIEW -->
			<div class="add-review">
				<h3>Viết đánh giá của bạn</h3>

				<div class="rating-select">
					<i class="fa-regular fa-star"></i> <i class="fa-regular fa-star"></i>
					<i class="fa-regular fa-star"></i> <i class="fa-regular fa-star"></i>
					<i class="fa-regular fa-star"></i>
				</div>

				<textarea placeholder="Nhập đánh giá của bạn..."></textarea>

				<button>Gửi đánh giá</button>
			</div>

		</div>

		<!-- ================= SUGGEST PRODUCTS ================= -->
		<h2 class="suggest-title">Sản phẩm đề xuất</h2>

		<div class="suggest-grid">
			<div class="product-card">
				<img
					src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/ao-croptop.jpg">
				<div class="info">
					<h4>Áo croptop</h4>
					<div class="price">299.000đ</div>
				</div>
			</div>

			<div class="product-card">
				<img
					src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/quan-short.jpg">
				<div class="info">
					<h4>Quần short nữ</h4>
					<div class="price">399.000đ</div>
				</div>
			</div>

			<div class="product-card">
				<img
					src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/vay-yem.jpg">
				<div class="info">
					<h4>Váy yếm</h4>
					<div class="price">599.000đ</div>
				</div>
			</div>

			<div class="product-card">
				<img
					src="${pageContext.request.contextPath}/assets/images/Female/Female_teenager/ao-khoac.jpg">
				<div class="info">
					<h4>Áo khoác nữ</h4>
					<div class="price">699.000đ</div>
				</div>
			</div>
		</div>

	</div>
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>
