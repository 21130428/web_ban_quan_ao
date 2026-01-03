<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Sự kiện & Thông báo | Fashion Shop</title>

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
	max-width: 1100px;
	margin: auto;
	padding: 30px 20px;
}

/* ================= PAGE TITLE ================= */
.page-title {
	text-align: center;
	margin-bottom: 40px;
}

.page-title h1 {
	font-size: 32px;
	margin-bottom: 10px;
	color: #2c3e50;
}

.page-title p {
	color: #777;
}

/* ================= EVENT LIST ================= */
.event-list {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
	gap: 25px;
}

.event-card {
	background: #fff;
	border-radius: 14px;
	overflow: hidden;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s;
}

.event-card:hover {
	transform: translateY(-6px);
}

.event-img {
	position: relative;
}

.event-img img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

.event-badge {
	position: absolute;
	top: 15px;
	left: 15px;
	padding: 6px 14px;
	border-radius: 20px;
	font-size: 13px;
	color: white;
	font-weight: 600;
}

.sale {
	background: #e74c3c;
}

.new {
	background: #27ae60;
}

.hot {
	background: #f39c12;
}

.event-content {
	padding: 18px;
}

.event-content h3 {
	font-size: 18px;
	margin-bottom: 8px;
	color: #333;
}

.event-content p {
	font-size: 14px;
	color: #666;
	margin-bottom: 12px;
}

.event-time {
	font-size: 13px;
	color: #999;
	margin-bottom: 15px;
}

.event-btn {
	display: inline-block;
	padding: 8px 18px;
	background: #3498db;
	color: white;
	border-radius: 20px;
	font-size: 14px;
	text-decoration: none;
	transition: 0.3s;
}

.event-btn:hover {
	background: #2980b9;
}
</style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
	<div class="container">

		<!-- PAGE TITLE -->
		<div class="page-title">
			<h1>Thông báo & Sự kiện</h1>
			<p>Cập nhật các chương trình ưu đãi và sản phẩm mới nhất</p>
		</div>

		<!-- EVENT LIST -->
		<div class="event-list">

			<!-- EVENT -->
			<div class="event-card">
				<div class="event-img">
					<img
						src="${pageContext.request.contextPath}/assets/images/promo.avif"
						alt="Sale"> <span class="event-badge sale">SALE</span>
				</div>
				<div class="event-content">
					<h3>Sale mùa hè lên đến 50%</h3>
					<p>Ưu đãi cực sốc cho toàn bộ áo thun, quần short và váy hè.</p>
					<div class="event-time">
						<i class="fa-regular fa-clock"></i> 01/06 - 15/06
					</div>
					<a href="#" class="event-btn">Xem chi tiết</a>
				</div>
			</div>

			<!-- EVENT -->
			<div class="event-card">
				<div class="event-img">
					<img
						src="${pageContext.request.contextPath}/assets/images/promo.avif"
						alt="New"> <span class="event-badge new">NEW</span>
				</div>
				<div class="event-content">
					<h3>Ra mắt bộ sưu tập Thu Đông</h3>
					<p>Phong cách mới, chất liệu cao cấp dành cho cả nam và nữ.</p>
					<div class="event-time">
						<i class="fa-regular fa-calendar"></i> Từ 20/09
					</div>
					<a href="#" class="event-btn">Khám phá</a>
				</div>
			</div>

			<!-- EVENT -->
			<div class="event-card">
				<div class="event-img">
					<img
						src="${pageContext.request.contextPath}/assets/images/promo.avif"
						alt="Hot"> <span class="event-badge hot">HOT</span>
				</div>
				<div class="event-content">
					<h3>Flash Sale cuối tuần</h3>
					<p>Giảm giá sốc trong 48 giờ – Số lượng có hạn.</p>
					<div class="event-time">
						<i class="fa-regular fa-clock"></i> Cuối tuần này
					</div>
					<a href="#" class="event-btn">Mua ngay</a>
				</div>
			</div>

			<div class="event-card">
				<div class="event-content">
					<h3>📦 Đơn hàng đang giao</h3>
					<p>Đơn hàng #DH1023 của bạn đang trên đường giao đến.</p>
					<div class="event-time">
						<i class="fa-regular fa-clock"></i> 2 giờ trước
					</div>
				</div>
			</div>

			<div class="event-card">
				<div class="event-content">
					<h3>🆕 Sản phẩm mới</h3>
					<p>Bộ sưu tập Street Style 2025 đã có mặt tại shop.</p>
					<div class="event-time">
						<i class="fa-regular fa-calendar"></i> Hôm nay
					</div>
				</div>
			</div>

			<div class="event-card">
				<div class="event-content">
					<h3>💡 Xu hướng tuần này</h3>
					<p>Áo croptop + quần ống rộng đang là lựa chọn hot.</p>
					<div class="event-time">
						<i class="fa-regular fa-fire"></i> Trending
					</div>
				</div>
			</div>

		</div>

	</div>
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>
