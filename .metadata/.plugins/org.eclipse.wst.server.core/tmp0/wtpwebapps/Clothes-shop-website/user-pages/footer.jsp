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
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).on('click', '.btn-cart', function(e) {
    e.preventDefault();
    var productId = $(this).attr('data-id'); // Đảm bảo dùng .attr('data-id') hoặc .data('id')
    
    if(!productId) {
        console.error("Không tìm thấy ID sản phẩm trên nút này!");
        return;
    }

    $.ajax({
        // Dùng đường dẫn tuyệt đối từ gốc project
        url: '${pageContext.request.contextPath}/cart-controller', 
        type: 'GET',
        data: {
            action: 'add',
            pid: productId
        },
        // Thêm dòng này để trình duyệt nhận diện đây là yêu cầu Ajax
        headers: {
            "X-Requested-With": "XMLHttpRequest"
        },
        success: function(response) {
            alert('Đã thêm sản phẩm vào giỏ hàng thành công!');
            // Cập nhật số lượng trên icon giỏ hàng nếu có
            $('.cart-badge').text(response); 
        },
        error: function(xhr, status, error) {
            console.error("Lỗi chi tiết:", status, error);
            if(xhr.status === 401) {
                alert('Vui lòng đăng nhập để thực hiện chức năng này!');
                window.location.href = '${pageContext.request.contextPath}/user-pages/login.jsp';
            } else {
                alert('Có lỗi xảy ra (Mã lỗi: ' + xhr.status + '). Vui lòng thử lại!');
            }
        }
    });
});
</script>

<script>
$(document).on('click', '.btn-wishlist', function(e) {
    var btn = $(this);
    var productId = btn.data('id');

    $.ajax({
        url: '${pageContext.request.contextPath}/wishlist-controller',
        type: 'GET',
        data: {
            action: 'add',
            pid: productId
        },
        success: function(response) {
            // Hiệu ứng đổi màu trái tim sang đỏ để người dùng biết đã thích thành công
            btn.find('i').css('color', 'red'); 
            alert('Đã thêm vào danh sách yêu thích!');
        },
        error: function(xhr) {
            if (xhr.status === 401) {
                alert('Vui lòng đăng nhập để sử dụng chức năng yêu thích!');
                window.location.href = '${pageContext.request.contextPath}/user-pages/login.jsp';
            } else {
                alert('Lỗi: Không thể thêm vào yêu thích.');
            }
        }
    });
});
</script>
</body>
</html>