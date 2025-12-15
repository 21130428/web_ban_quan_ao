<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.footer {
	background: #f5f6f8;
	color: #555;
	padding-top: 70px;
	border-top: 1px solid #e0e0e0;
}

.footer-container {
	max-width: 1200px;
	margin: auto;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 40px;
	padding: 0 20px 50px;
}

/* LOGO */
.footer-logo {
	font-size: 24px;
	font-weight: bold;
	color: #111;
	margin-bottom: 18px;
}

/* TIÊU ĐỀ */
.footer-col h4 {
	font-size: 16px;
	margin-bottom: 18px;
	color: #111;
}

/* TEXT */
.footer-col p {
	font-size: 14px;
	line-height: 1.6;
}

/* LINKS */
.footer-col ul {
	list-style: none;
}

.footer-col ul li {
	margin-bottom: 12px;
}

.footer-col ul li a {
	color: #555;
	font-size: 14px;
	transition: 0.3s ease;
}

.footer-col ul li a:hover {
	color: #111;
	padding-left: 6px;
}

/* CONTACT ICON */
.footer-col i {
	margin-right: 8px;
	color: #777;
}

/* SOCIAL */
.social {
	margin-top: 18px;
	display: flex;
	gap: 14px;
}

.social a {
	width: 36px;
	height: 36px;
	border-radius: 50%;
	background: #fff;
	border: 1px solid #ddd;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #555;
	transition: 0.3s ease;
}

.social a:hover {
	background: #111;
	color: #fff;
	border-color: #111;
}

/* BOTTOM */
.footer-bottom {
	border-top: 1px solid #e0e0e0;
	text-align: center;
	padding: 18px 0;
	font-size: 13px;
	color: #888;
}
</style>
</head>
<body>
	<footer class="footer">
		<div class="footer-container">

			<!-- BRAND -->
			<div class="footer-col">
				<h3 class="footer-logo">Fashion Store</h3>
				<p>Thương hiệu thời trang hiện đại, mang đến phong cách trẻ
					trung – thanh lịch – cá tính cho mọi khách hàng.</p>
			</div>

			<!-- QUICK LINKS -->
			<div class="footer-col">
				<h4>Liên kết nhanh</h4>
				<ul>
					<li><a href="#">Trang chủ</a></li>
					<li><a href="#">Sản phẩm</a></li>
					<li><a href="#">Yêu thích</a></li>
					<li><a href="#">Giỏ hàng</a></li>
				</ul>
			</div>

			<!-- SUPPORT -->
			<div class="footer-col">
				<h4>Hỗ trợ khách hàng</h4>
				<ul>
					<li><a href="#">Chính sách đổi trả</a></li>
					<li><a href="#">Hướng dẫn mua hàng</a></li>
					<li><a href="#">Thanh toán</a></li>
					<li><a href="#">Câu hỏi thường gặp</a></li>
				</ul>
			</div>

			<!-- CONTACT -->
			<div class="footer-col">
				<h4>Liên hệ</h4>
				<p>
					<i class="fa fa-location-dot"></i> Hà Nội, Việt Nam
				</p>
				<p>
					<i class="fa fa-phone"></i> 0123 456 789
				</p>
				<p>
					<i class="fa fa-envelope"></i> support@fashionstore.com
				</p>

				<div class="social">
					<a href="#"><i class="fab fa-facebook-f"></i></a> <a href="#"><i
						class="fab fa-instagram"></i></a> <a href="#"><i
						class="fab fa-tiktok"></i></a>
				</div>
			</div>

		</div>

		<!-- COPYRIGHT -->
		<div class="footer-bottom">© 2025 Fashion Store. All rights
			reserved.</div>
	</footer>
</body>
</html>