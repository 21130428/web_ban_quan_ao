<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="col-md-2 d-none d-md-block sidebar p-3"
	style="background: #212529; min-height: 100vh; color: white;">
	<h4 class="text-center mb-4">SHOP ADMIN</h4>
	<ul class="nav flex-column" id="adminSidebar">
		<li class="nav-item mb-2">
			<a href="${pageContext.request.contextPath}/admin/manage-product"
			   class="nav-link text-white"> 
			   <i class="bi bi-box-seam me-2"></i>Sản phẩm
			</a>
		</li>
		<li class="nav-item mb-2">
			<a href="${pageContext.request.contextPath}/admin-pages/order-manager.jsp"
			   class="nav-link text-white">
			   <i class="bi bi-cart me-2"></i>Đơn hàng
			</a>
		</li>
		<li class="nav-item mb-2">
			<a href="${pageContext.request.contextPath}/admin-pages/contact-manager.jsp"
			   class="nav-link text-white">
			   <i class="bi bi-chat-dots me-2"></i>Tin nhắn
			</a>
		</li>
		<li class="nav-item mb-2">
			<hr class="bg-secondary"> 
			<a href="../logout" class="nav-link text-danger">
				<i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
			</a>
		</li>
	</ul>
</nav>

<style>
/* Style cho mục đang được chọn */
.nav-link.active-custom {
	background: #0d6efd !important;
	border-radius: 5px;
	color: white !important;
}
/* Hiệu ứng hover cho các mục khác */
.nav-link:hover {
	background: rgba(255, 255, 255, 0.1);
	border-radius: 5px;
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
    // 1. Lấy URL hiện tại của trình duyệt
    const currentUrl = window.location.href;
    
    // 2. Lấy tất cả các thẻ <a> trong sidebar
    const navLinks = document.querySelectorAll('#adminSidebar .nav-link');

    navLinks.forEach(link => {
        // 3. So sánh URL của thẻ <a> với URL hiện tại
        if (currentUrl.includes(link.getAttribute('href'))) {
            link.classList.add('active-custom');
        } else {
            // Loại bỏ màu xám (text-secondary) để đồng bộ màu trắng, 
            // chỉ những mục không active mới có màu trắng nhẹ
            link.style.opacity = "0.7";
        }
    });
});
</script>