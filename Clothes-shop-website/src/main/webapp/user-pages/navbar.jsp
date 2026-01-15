<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style type="text/css">
/* =========================
   ICON NAVBAR (ĐẸP HƠN)
   ========================= */
.icons {
	display: flex;
	align-items: center;
	gap: 12px;
}

/* nút icon tròn */
.icon-btn {
	width: 42px;
	height: 42px;
	border-radius: 50%;
	background: #fff;
	border: 1px solid rgba(0, 0, 0, 0.10);
	display: flex;
	align-items: center;
	justify-content: center;
	position: relative;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
	transition: transform .18s ease, box-shadow .18s ease, border-color .18s ease;
	text-decoration: none;
}

/* icon */
.icon-btn i {
	font-size: 18px;
	color: #111;
	transition: transform .18s ease, color .18s ease;
}

/* hover */
.icon-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.14);
	border-color: rgba(231, 76, 60, 0.35);
}
.icon-btn:hover i {
	transform: scale(1.08);
}

/* tim đỏ */
.icon-btn.heart i {
	color: #e74c3c;
}

/* badge chung (giỏ + thông báo) */
.icon-badge, .cart-badge, .badge-notify {
	position: absolute;
	top: -6px;
	right: -6px;
	min-width: 18px;
	height: 18px;
	padding: 0 6px;
	border-radius: 999px;
	background: #ff4757;
	color: #fff;
	font-size: 11px;
	font-weight: 700;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid #fff;
	line-height: 1;
}

/* =========================
   USER DROPDOWN
   ========================= */
.menu-user {
	position: relative;
	cursor: pointer;
}

/* user dropdown nằm giữa icon */
.user-dropdown {
	position: absolute;
	top: 130%;
	left: 50%;
	transform: translateX(-50%) translateY(8px);
	min-width: 170px;
	z-index: 2000;

	opacity: 0;
	visibility: hidden;
	transition: .2s ease;
}

.user-dropdown.show {
	opacity: 1;
	visibility: visible;
	transform: translateX(-50%) translateY(0);
}

/* giữ style dropdown theo style.css của bạn */
.user-dropdown a {
	display: block;
	padding: 12px 14px;
	white-space: nowrap;
}

/* =========================
   NOTIFY: làm icon tròn nhưng giữ logic hover dropdown cũ
   ========================= */
.notification-menu {
	position: relative;
	display: inline-flex;
}

/* tránh bị “tụt hover” khi rê chuột xuống dropdown */
.notify-dropdown::before {
	content: "";
	position: absolute;
	top: -20px;
	right: 0;
	width: 100%;
	height: 20px;
	background: transparent;
}
</style>
</head>

<body>
	<header>
		<div class="container nav">
			<div class="logo" style="color: green">
				<a href="${pageContext.request.contextPath}/home">FASHION</a>
			</div>

			<ul class="menu">
				<li><a href="${pageContext.request.contextPath}/home">Trang chủ</a></li>

				<li><a href="${pageContext.request.contextPath}/hot-products"
					style="color: red; font-weight: bold;">Hot</a></li>

				<li>
					<a href="${pageContext.request.contextPath}/hot-products">Sản phẩm</a>
					<div class="dropdown">
						<a href="${pageContext.request.contextPath}/male-clothes">Quần áo nam</a>
						<a href="${pageContext.request.contextPath}/female-clothes">Quần áo nữ</a>
						<a href="${pageContext.request.contextPath}/jewelry">Trang sức</a>
					</div>
				</li>

				<li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
			</ul>

			<!-- ICONS -->
			<div class="icons">

				<!-- Yêu thích -->
				<a href="${pageContext.request.contextPath}/wishlist-controller?action=view"
				   class="icon-btn heart" title="Yêu thích">
					<i class="fa fa-heart"></i>
				</a>

				<!-- Giỏ hàng -->
				<a href="${pageContext.request.contextPath}/cart-controller?action=view"
				   class="icon-btn" title="Giỏ hàng">
					<i class="fa fa-shopping-cart"></i>
					<!-- JS của bạn đang update .cart-badge nên giữ class này -->
					<span class="cart-badge">0</span>
				</a>

				<!-- Thông báo: chỉ hiện khi đã login -->
				<c:if test="${not empty sessionScope.user}">
					<div class="notification-menu icon-btn" title="Thông báo">
						<i class="fa fa-bell"></i>

						<c:if test="${newNotifyCount > 0}">
							<span class="badge-notify">${newNotifyCount}</span>
						</c:if>

						<div class="notify-dropdown">
							<div class="notify-header">Thông báo mới</div>
							<div class="notify-list">
								<c:forEach items="${listNotify}" var="n">
									<div class="notify-item ${n.isRead ? '' : 'unread'}"
										onclick="showNotifyDetail('${n.type}', '<fmt:formatDate value="${n.createdAt}" pattern="HH:mm dd/MM/yyyy"/>', `${n.content}`, ${n.id})">
										<strong>${n.type == 'ORDER' ? '📦 Cập nhật đơn hàng' : '💬 Phản hồi từ Shop'}</strong>
										<p class="text-truncate">${n.content}</p>
										<small><fmt:formatDate value="${n.createdAt}" pattern="HH:mm dd/MM/yyyy" /></small>
									</div>
								</c:forEach>

								<c:if test="${empty listNotify}">
									<div class="p-3 text-center text-muted" style="font-size: 12px;">
										Không có thông báo mới
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:if>

				<!-- USER -->
				<div class="menu-user icon-btn" title="Tài khoản">
					<i class="fa fa-user" id="userIcon"></i>

					<div class="dropdown user-dropdown">
						<c:if test="${not empty sessionScope.user}">
							<a href="${pageContext.request.contextPath}/profile">
								${sessionScope.user.username}
							</a>
							<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
						</c:if>

						<c:if test="${empty sessionScope.user}">
							<a href="${pageContext.request.contextPath}/user-pages/login.jsp">Đăng nhập</a>
							<a href="${pageContext.request.contextPath}/user-pages/signup.jsp">Đăng ký</a>
						</c:if>
					</div>
				</div>

			</div>
		</div>
	</header>

	<!-- MODAL THÔNG BÁO -->
	<div id="notifyModal" class="custom-modal">
		<div class="modal-content-card">
			<div class="modal-header-custom">
				<h3 id="modalTitle"></h3>
				<span class="close-btn" onclick="closeNotify()">&times;</span>
			</div>
			<div class="modal-body-custom">
				<div class="info-meta">
					<i class="fa fa-clock"></i> <span id="modalTime"></span>
				</div>
				<div id="modalContent" class="content-text"></div>
			</div>
			<div class="modal-footer-custom">
				<button class="btn-done" onclick="closeNotify()">Đã hiểu</button>
			</div>
		</div>
	</div>

</body>

<script>
const userIcon = document.getElementById("userIcon");
const userDropdown = document.querySelector(".user-dropdown");

userIcon.onclick = (e) => {
    e.stopPropagation();
    userDropdown.classList.toggle("show");
};

document.onclick = () => {
    userDropdown.classList.remove("show");
};
</script>

<script>
function showNotifyDetail(type, time, message, id, element) {
    document.getElementById('modalTitle').innerText = (type === 'ORDER') ? '📦 Chi tiết đơn hàng' : '💬 Nội dung phản hồi';
    document.getElementById('modalTime').innerText = 'Thời gian: ' + time;
    document.getElementById('modalContent').innerText = message;
    document.getElementById('notifyModal').style.display = 'block';

    if (element && element.classList.contains('unread')) {
        fetch('${pageContext.request.contextPath}/mark-read?id=' + id)
            .then(response => {
                if (response.ok) {
                    element.classList.remove('unread');

                    let badge = document.querySelector('.badge-notify');
                    if (badge) {
                        let count = parseInt(badge.innerText) - 1;
                        if (count > 0) badge.innerText = count;
                        else badge.remove();
                    }
                }
            });
    }
}

function closeNotify() {
    document.getElementById('notifyModal').style.display = 'none';
}

window.onclick = function(event) {
    if (event.target == document.getElementById('notifyModal')) closeNotify();
}
</script>

<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</html>
