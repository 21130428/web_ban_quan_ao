<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Sản phẩm hot | Shop Quần Áo</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
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

.filter {
	background: white;
	padding: 20px;
	border-radius: 10px;
}

.products {
	background: white;
	padding: 20px;
	border-radius: 10px;
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
	color: #e74c3c;
	cursor: pointer;
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
</style>
</head>

<body>
<jsp:include page="/user-pages/navbar.jsp" />

<div class="container">

	<!-- FILTER -->
	<aside class="filter">
		<h3>Lọc sản phẩm</h3>
		<label><input type="checkbox"> Áo thun</label><br>
		<label><input type="checkbox"> Quần jean</label>
	</aside>

	<!-- PRODUCTS -->
	<section class="products">
		<div class="products-grid">

			<!-- ================= PRODUCT 1 ================= -->
			<div class="product-card" data-price="199000">
				<div class="product-img">
					<img src="${pageContext.request.contextPath}/assets/images/Male/Male_teenager/ao-thun.jpg">
					<div class="favorite">
						<i class="fa-solid fa-heart"></i>
					</div>
				</div>

				<div class="product-info">
					<h4>Áo thun basic</h4>
					<div class="price">199.000đ</div>

					<div class="btn-group">

						<!-- ADD TO CART -->
						<form action="${pageContext.request.contextPath}/add-to-cart"
						      method="post" style="flex:1">

							<input type="hidden" name="id" value="1">
							<input type="hidden" name="name" value="Áo thun basic">
							<input type="hidden" name="image" value="Male/Male_teenager/ao-thun.jpg">
							<input type="hidden" name="price" value="199000">
							<input type="hidden" name="quantity" value="1">

							<button type="submit" class="btn btn-cart">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>
						</form>

						<button class="btn btn-detail"
						        onclick="window.location.href='${pageContext.request.contextPath}/user-pages/product-detail.jsp'">
							Chi tiết
						</button>

					</div>
				</div>
			</div>

			<!-- ================= PRODUCT 2 ================= -->
			<div class="product-card" data-price="399000">
				<div class="product-img">
					<img src="${pageContext.request.contextPath}/assets/images/Male/Male_teenager/quan-jean.jpg">
					<div class="favorite">
						<i class="fa-solid fa-heart"></i>
					</div>
				</div>

				<div class="product-info">
					<h4>Quần jean nam</h4>
					<div class="price">399.000đ</div>

					<div class="btn-group">

						<form action="${pageContext.request.contextPath}/add-to-cart"
						      method="post" style="flex:1">

							<input type="hidden" name="id" value="2">
							<input type="hidden" name="name" value="Quần jean nam">
							<input type="hidden" name="image" value="Male/Male_teenager/quan-jean.jpg">
							<input type="hidden" name="price" value="399000">
							<input type="hidden" name="quantity" value="1">

							<button type="submit" class="btn btn-cart">
								<i class="fa-solid fa-cart-shopping"></i>
							</button>
						</form>

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
