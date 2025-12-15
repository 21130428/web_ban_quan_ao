
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Fashion Store</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">

<style>/* ===== BANNER SLIDER ===== */
.banner-slider {
	width: 100%;
	height: 420px;
}

.swiper-slide {
	position: relative;
}

.swiper-slide img {
	width: 100%;
	height: 420px;
	object-fit: cover;
}

/* nội dung trên banner */
.swiper-desc {
	position: absolute;
	top: 50%;
	left: 80px;
	transform: translateY(-50%);
	color: #fff;
	max-width: 520px;
}

.swiper-desc h1 {
	font-size: 48px;
	margin-bottom: 15px;
}

.swiper-desc p {
	font-size: 18px;
	margin-bottom: 25px;
}

.swiper-btn {
	background: #111;
	padding: 12px 28px;
	border-radius: 30px;
	color: #fff;
	display: inline-block;
}

/* SECTION */
section {
	padding: 60px 0;
}

.section-title {
	text-align: center;
	margin-bottom: 40px;
	font-size: 28px;
}

.category-list {
	max-width: 1200px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 30px;
}

.category-item {
	position: relative;
	overflow: hidden;
	border-radius: 18px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
}

.category-item img {
	width: 100%;
	height: 280px;
	object-fit: cover;
	transition: transform 0.5s ease;
}

.category-item span {
	position: absolute;
	bottom: 25px;
	left: 25px;
	font-size: 22px;
	font-weight: 600;
	color: #fff;
	z-index: 2;
}

.category-item::after {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(to top, rgba(0, 0, 0, 0.6), transparent);
}

.category-item:hover img {
	transform: scale(1.08);
}

.products {
	background: #fff;
}

.product-list {
	max-width: 1200px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 30px;
}

.product-card {
	background: #fff;
	border-radius: 16px;
	overflow: hidden;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
	transition: all 0.35s ease;
	text-align: center;
}

.product-card img {
	width: 100%;
	height: 260px;
	object-fit: cover;
}

.product-card h3 {
	font-size: 16px;
	font-weight: 500;
	margin: 18px 0 8px;
	padding: 0 10px;
}

.product-card .price {
	font-size: 16px;
	font-weight: 600;
	color: #e53935;
	margin-bottom: 18px;
}

.product-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.15);
}

.badge {
	position: absolute;
	top: 15px;
	left: 15px;
	background: #111;
	color: #fff;
	font-size: 12px;
	padding: 5px 12px;
	border-radius: 20px;
}

.wishlist {
	position: absolute;
	top: 15px;
	right: 15px;
	font-size: 18px;
	color: #fff;
	background: rgba(0, 0, 0, 0.4);
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
}

.wishlist:hover {
	color: #e53935;
}

.product-actions {
	position: absolute;
	inset: 0;
	background: rgba(0, 0, 0, 0.4);
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 0;
	transition: 0.3s ease;
}

.product-card:hover .product-actions {
	opacity: 1;
}

.btn-cart {
	background: #fff;
	color: #111;
	padding: 12px 26px;
	border-radius: 30px;
	font-weight: 600;
	transition: 0.3s ease;
}

.btn-cart:hover {
	background: #111;
	color: #fff;
}

.product-info {
	padding: 18px;
	text-align: center;
}

.category {
	font-size: 13px;
	color: #777;
}

.product-info h3 {
	font-size: 16px;
	margin: 6px 0 10px;
}

.rating {
	color: #fbc02d;
	font-size: 14px;
	margin-bottom: 10px;
}

.rating span {
	color: #777;
	font-size: 13px;
	margin-left: 4px;
}

.colors {
	display: flex;
	justify-content: center;
	gap: 8px;
	margin-bottom: 12px;
}

.color {
	width: 14px;
	height: 14px;
	border-radius: 50%;
	border: 1px solid #ddd;
}

.color.black {
	background: #111;
}

.color.beige {
	background: #d7c6a1;
}

.color.gray {
	background: #999;
}

.promo {
	padding: 80px 20px;
	background: #f7f7f7;
}

.promo-box {
	position: relative;
	max-width: 1200px;
	margin: auto;
	border-radius: 24px;
	overflow: hidden;
	box-shadow: 0 15px 40px rgba(0, 0, 0, 0.25);
}

.promo-box img {
	width: 100%;
	height: 420px;
	object-fit: cover;
	transition: transform 0.6s ease;
}

/* Overlay tối */
.promo-box::after {
	content: "";
	position: absolute;
	inset: 0;
	background: linear-gradient(to right, rgba(0, 0, 0, 0.6),
		rgba(0, 0, 0, 0.25), rgba(0, 0, 0, 0.05));
}

/* Nội dung */
.promo-content {
	position: absolute;
	top: 50%;
	left: 70px;
	transform: translateY(-50%);
	color: #fff;
	z-index: 2;
	max-width: 420px;
}

.promo-tag {
	display: inline-block;
	background: #e53935;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 13px;
	font-weight: 600;
	margin-bottom: 18px;
}

.promo-content h2 {
	font-size: 40px;
	margin-bottom: 15px;
}

.promo-content p {
	font-size: 16px;
	margin-bottom: 25px;
	line-height: 1.6;
}

.promo-btn {
	display: inline-block;
	padding: 12px 30px;
	border-radius: 30px;
	background: #fff;
	color: #111;
	font-weight: 600;
	transition: 0.3s ease;
}

.promo-btn:hover {
	background: #111;
	color: #fff;
}

/* Hover effect */
.promo-box:hover img {
	transform: scale(1.08);
}
</style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
	<div class="swiper mySwiper banner-slider">
		<div class="swiper-wrapper">

			<div class="swiper-slide">
				<img
					src="${pageContext.request.contextPath}/assets/images/banner4.jpg"
					alt="">
				<div class="swiper-desc">
					<h1>Thời trang hiện đại</h1>
					<p>Khám phá bộ sưu tập mới nhất 2025</p>
					<a href="#" class="swiper-btn">Mua ngay</a>
				</div>
			</div>

			<div class="swiper-slide">
				<img
					src="${pageContext.request.contextPath}/assets/images/banner1.jpg"
					alt="">
				<div class="swiper-desc">
					<h1>Phong cách nam tính</h1>
					<p>Áo khoác – quần jean – streetwear</p>
					<a href="#" class="swiper-btn">Xem ngay</a>
				</div>
			</div>

			<div class="swiper-slide">
				<img
					src="${pageContext.request.contextPath}/assets/images/banner2.jpg"
					alt="">
				<div class="swiper-desc">
					<h1>Thời trang nữ</h1>
					<p>Thanh lịch – hiện đại – cá tính</p>
					<a href="#" class="swiper-btn">Khám phá</a>
				</div>
			</div>

		</div>

		<!-- dots -->
		<div class="swiper-pagination"></div>

		<!-- arrows (tuỳ chọn) -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>


	<section class="category">
		<h2 class="section-title">Danh mục nổi bật</h2>

		<div class="category-list">
			<a href="#" class="category-item"> <img
				src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-vest.jpg">
				<span>Thời trang nam</span>
			</a> <a href="#" class="category-item"> <img
				src="${pageContext.request.contextPath}/assets/images/Female/Female_adult/ao-2-day.jpg">
				<span>Thời trang nữ</span>
			</a> <a href="#" class="category-item"> <img
				src="${pageContext.request.contextPath}/assets/images/Female/Trang_suc_nu/bong-tai.jpeg">
				<span>Phụ kiện</span>
			</a>
		</div>
	</section>

	<section class="products">
		<h2 class="section-title">Sản phẩm nổi bật</h2>

		<div class="product-list">
			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>


			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>


			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>

			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>


		</div>
	</section>

	<section class="promo">
		<div class="promo-box">
			<img
				src="${pageContext.request.contextPath}/assets/images/promo.avif"
				alt="Promo">

			<div class="promo-content">
				<span class="promo-tag">SALE 30%</span>
				<h2>Ưu đãi mùa hè</h2>
				<p>Giảm giá lên đến 30% cho toàn bộ sản phẩm mới</p>
				<a href="#" class="promo-btn">Mua ngay</a>
			</div>
		</div>
	</section>


	<section class="products">
		<h2 class="section-title">Sản phẩm mới</h2>
		<div class="product-list">
			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>


			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>


			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>

			<div class="product-card">
				<div class="product-image">
					<img
						src="${pageContext.request.contextPath}/assets/images/Male/Male_adult/ao-cardigan.jpg">
					<span class="badge">NEW</span> <i class="fa fa-heart wishlist"></i>

					<div class="product-actions">
						<a href="#" class="btn-cart">Thêm vào giỏ</a>
					</div>
				</div>

				<div class="product-info">
					<span class="category">Nam</span>
					<h3>Áo Cardigan</h3>

					<div class="rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-alt"></i> <span>(124)</span>
					</div>

					<div class="colors">
						<span class="color black"></span> <span class="color beige"></span>
						<span class="color gray"></span>
					</div>

					<p class="price">299.000đ</p>
				</div>
			</div>


		</div>
	</section>

	<jsp:include page="/user-pages/footer.jsp" />
</body>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script>
	const swiper = new Swiper(".mySwiper", {
		loop : true,
		autoplay : {
			delay : 5000,
			disableOnInteraction : false,
		},
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});
</script>
</html>

