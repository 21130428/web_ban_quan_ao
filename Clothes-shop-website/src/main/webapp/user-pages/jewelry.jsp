<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Trang sức| Shop Quần Áo</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f6f6f6;
}

.container {
	display: grid;
	grid-template-columns: 250px 1fr;
	gap: 20px;
	padding: 20px;
}

/* ================= FAVORITE (HEART) ================= */
.favorite {
	position: absolute;
	top: 10px;
	right: 10px;
	background: white;
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
	color: #ccc;
	transition: all 0.3s ease;
}

.favorite:hover {
	background: #e74c3c;
	color: white;
	transform: scale(1.15);
	box-shadow: 0 4px 10px rgba(231, 76, 60, 0.4);
}

/* ================= BUTTON COMMON ================= */
.btn {
	transition: all 0.3s ease;
}

/* ================= ADD TO CART ================= */
.btn-cart {
	background: #2ecc71;
	color: white;
}

.btn-cart:hover {
	background: #27ae60;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(46, 204, 113, 0.5);
}

/* ================= DETAIL BUTTON ================= */
.btn-detail {
	background: #3498db;
	color: white;
}

.btn-detail:hover {
	background: #2980b9;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(52, 152, 219, 0.5);
}

/* ================= FILTER ================= */
.filter {
	background: white;
	padding: 20px;
	border-radius: 10px;
}

.filter h3 {
	margin-bottom: 15px;
}

.filter-group {
	margin-bottom: 20px;
}

.filter-group label {
	display: block;
	margin-bottom: 5px;
	cursor: pointer;
}

/* ================= PRODUCTS ================= */
.products {
	background: white;
	padding: 20px;
	border-radius: 10px;
}

.products-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
	gap: 20px;
}

.product-card {
	background: #fff;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s;
}

.product-img {
	position: relative;
}

.product-img img {
	width: 100%;
	height: 280px;
	object-fit: cover;
}

.favorite {
	position: absolute;
	top: 10px;
	right: 10px;
	background: white;
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
	color: #e74c3c;
}

.product-info {
	padding: 15px;
}

.product-info h4 {
	font-size: 16px;
	margin-bottom: 5px;
}

.price {
	color: #e67e22;
	font-weight: 600;
	margin-bottom: 10px;
}

.btn-group {
	display: flex;
	gap: 10px;
}

.btn {
	flex: 1;
	padding: 8px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
}

.btn-cart {
	background: #2ecc71;
	color: white;
}

.btn-detail {
	background: #3498db;
	color: white;
}

/* ================= PRODUCTS HEADER ================= */
.products-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
	padding-bottom: 10px;
	border-bottom: 2px solid #eee;
}

/* TITLE */
.products-header h2 {
	font-size: 22px;
	font-weight: 600;
	color: #333;
	position: relative;
}

/* underline nhẹ cho tiêu đề */
.products-header h2::after {
	content: "";
	width: 60px;
	height: 3px;
	background: #e67e22;
	position: absolute;
	left: 0;
	bottom: -8px;
	border-radius: 2px;
}

/* ================= SORT SELECT ================= */
.products-header select {
	padding: 8px 15px;
	border-radius: 20px;
	border: 1px solid #ddd;
	font-size: 14px;
	cursor: pointer;
	background: #fff;
	outline: none;
	transition: all 0.3s ease;
}

/* hover */
.products-header select:hover {
	border-color: #3498db;
}

/* focus */
.products-header select:focus {
	border-color: #3498db;
	box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
}
</style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
	<div class="container">

		<!-- ================= FILTER ================= -->
		<aside class="filter">
			<h3>Trang sức</h3>

			<!-- LOẠI TRANG SỨC -->
			<div class="filter-group">
				<strong>Loại trang sức</strong> <label><input
					type="checkbox"> Nhẫn</label> <label><input type="checkbox">
					Dây chuyền</label> <label><input type="checkbox"> Vòng tay</label>
				<label><input type="checkbox"> Lắc tay</label> <label><input
					type="checkbox"> Bông tai</label> <label><input
					type="checkbox"> Đồng hồ</label>
			</div>

			<!-- ĐỐI TƯỢNG -->
			<div class="filter-group">
				<strong>Đối tượng</strong> <label><input type="checkbox">
					Nam</label> <label><input type="checkbox"> Nữ</label> <label><input
					type="checkbox"> Unisex</label>
			</div>

			<!-- CHẤT LIỆU -->
			<div class="filter-group">
				<strong>Chất liệu</strong> <label><input type="checkbox">
					Vàng</label> <label><input type="checkbox"> Bạc</label> <label><input
					type="checkbox"> Titan</label> <label><input
					type="checkbox"> Thép không gỉ</label> <label><input
					type="checkbox"> Đá quý</label>
			</div>

			<!-- MÀU -->
			<div class="filter-group">
				<strong>Màu sắc</strong> <label><input type="checkbox">
					Vàng</label> <label><input type="checkbox"> Bạc</label> <label><input
					type="checkbox"> Đen</label> <label><input type="checkbox">
					Trắng</label> <label><input type="checkbox"> Hồng</label>
			</div>

			<!-- GIÁ -->
			<div class="filter-group">
				<strong>Khoảng giá</strong> <label><input type="checkbox">
					Dưới 500.000đ</label> <label><input type="checkbox">
					500.000đ – 2.000.000đ</label> <label><input type="checkbox">
					Trên 2.000.000đ</label>
			</div>
		</aside>

		<!-- ================= PRODUCTS ================= -->
		<section class="products">
			<div class="products-header">
				<h2>TRANG SỨC NAM & NỮ</h2>
				<select>
					<option>Mới nhất</option>
					<option>Giá tăng dần</option>
					<option>Giá giảm dần</option>
					<option>Bán chạy</option>
				</select>
			</div>

			<div class="products-grid">

				<!-- PRODUCT -->
				<div class="product-card">
					<div class="product-img">
						<img
							src="${pageContext.request.contextPath}/assets/images/Female/Trang_suc_nu/day-chuyen.jpg"
							alt="Dây chuyền bạc">
						<div class="favorite">
							<i class="fa-solid fa-heart"></i>
						</div>
					</div>
					<div class="product-info">
						<h4>Dây chuyền bạc Unisex</h4>
						<div class="price">1.299.000đ</div>
						<div class="btn-group">
							<button class="btn btn-cart">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>
							<button class="btn btn-detail">Chi tiết</button>
						</div>
					</div>
				</div>

				<div class="product-card">
					<div class="product-img">
						<img
							src="${pageContext.request.contextPath}/assets/images/Female/Trang_suc_nu/nhan.jpg"
							alt="Nhẫn bạc nam">
						<div class="favorite">
							<i class="fa-solid fa-heart"></i>
						</div>
					</div>
					<div class="product-info">
						<h4>Nhẫn bạc nam</h4>
						<div class="price">899.000đ</div>
						<div class="btn-group">
							<button class="btn btn-cart">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>
							<button class="btn btn-detail">Chi tiết</button>
						</div>
					</div>
				</div>

				<div class="product-card">
					<div class="product-img">
						<img
							src="${pageContext.request.contextPath}/assets/images/Female/Trang_suc_nu/bong-tai-2.jpg"
							alt="Bông tai nữ">
						<div class="favorite">
							<i class="fa-solid fa-heart"></i>
						</div>
					</div>
					<div class="product-info">
						<h4>Bông tai nữ đính đá</h4>
						<div class="price">1.499.000đ</div>
						<div class="btn-group">
							<button class="btn btn-cart">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>
							<button class="btn btn-detail">Chi tiết</button>
						</div>
					</div>
				</div>

			</div>
		</section>


	</div>
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>
