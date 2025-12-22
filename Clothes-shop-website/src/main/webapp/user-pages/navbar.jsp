<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style type="text/css">
/* MENU USER */
.menu-user {
	position: relative;
}

/* USER dropdown chỉnh vị trí */
.user-dropdown {
	position: absolute;
	top: 130%; /* đẩy xuống dưới icon */
	transform: translateX(-50%) translateY(8px);
	min-width: 160px;
	z-index: 2000;
}

.user-dropdown.show {
	opacity: 1;
	visibility: visible;
	transform: translateX(-50%) translateY(0);
}

.wishlist-link i {
	font-size: 18px;
	color: #e74c3c;
	transition: 0.3s;
}

.wishlist-link:hover i {
	transform: scale(1.15);
}

.cart-link {
	position: relative;
	text-decoration: none;
	color: #333;
	font-size: 18px;
	padding: 8px;
	transition: 0.3s;
}

.cart-link:hover {
	color: #3498db;
}

.cart-link i {
	transition: 0.3s;
}

.cart-link:hover i {
	transform: scale(1.15);
}

/* Badge số lượng */
.cart-link::after {
	content: "2"; /* sau này thay bằng Session */
	position: absolute;
	top: 0;
	right: 0;
	background: #e74c3c;
	color: white;
	font-size: 11px;
	width: 18px;
	height: 18px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<header>
		<div class="container nav">
			<div class="logo" style="color: green">
				<a href="${pageContext.request.contextPath}/user-pages/home.jsp">FASHION</a>
			</div>
			<ul class="menu">
				<li><a
					href="${pageContext.request.contextPath}/user-pages/home.jsp">Trang
						chủ</a></li>
				
				<li><a href="${pageContext.request.contextPath}/user-pages/hot.jsp" 
					   style="color: red; font-weight: bold;">Hot</a></li>

				<li><a
					href="${pageContext.request.contextPath}/user-pages/hot.jsp">Sản
						phẩm</a>
					<div class="dropdown">
						<a href="${pageContext.request.contextPath}/male-clothes">Quần
							áo nam</a> 
						<a href="${pageContext.request.contextPath}/female-clothes">Quần
							áo nữ</a> 
						<a href="${pageContext.request.contextPath}/jewelry">Trang
							sức</a>
					</div></li>

				<li><a
					href="${pageContext.request.contextPath}/user-pages/contact.jsp">Liên
						 hệ</a></li>
			</ul>

			<div class="search-box">
				<input type="text" placeholder="Tìm kiếm sản phẩm..."> <i
					class="fa fa-search"></i>
			</div>

			<div class="icons">
				<a href="${pageContext.request.contextPath}/user-pages/wish-list.jsp"
					class="wishlist-link"> <i class="fa fa-heart"></i>
				</a> 
				
				<a href="${pageContext.request.contextPath}/user-pages/cart.jsp"
					class="cart-link"> <i class="fa fa-shopping-cart"></i>
				</a>
				
				<c:if test="${not empty sessionScope.user}">
                    <div class="notification-menu">
                        <i class="fa fa-bell"></i>
                        <c:if test="${newNotifyCount > 0}">
                            <span class="badge-notify">${newNotifyCount}</span>
                        </c:if>

                        <div class="notify-dropdown">
                            <div class="notify-header">Thông báo mới</div>
                            <div class="notify-list">
                                <c:forEach items="${listNotify}" var="n">
								    <div class="notify-item ${n.read ? '' : 'unread'}" 
								         onclick="showNotifyDetail('${n.type}', '<fmt:formatDate value="${n.createdAt}" pattern="HH:mm dd/MM/yyyy"/>', `${n.content}`, ${n.id})">
								        <strong>${n.type == 'ORDER' ? '📦 Cập nhật đơn hàng' : '💬 Phản hồi từ Shop'}</strong>
								        <p class="text-truncate">${n.content}</p> <small><fmt:formatDate value="${n.createdAt}" pattern="HH:mm dd/MM/yyyy"/></small>
								    </div>
								</c:forEach>
                                <c:if test="${empty listNotify}">
                                    <div class="p-3 text-center text-muted" style="font-size: 12px;">Không có thông báo mới</div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:if>
				
				<!-- USER -->
				<div class="menu-user">
					<i class="fa fa-user" id="userIcon"></i>

					<div class="dropdown user-dropdown">
						<!-- ĐÃ ĐĂNG NHẬP -->
						<c:if test="${not empty sessionScope.user}">
							<a href="#">${sessionScope.user.username} </a>

							<a href="${pageContext.request.contextPath}/logout"> Đăng
								xuất </a>
						</c:if>
						<!-- CHƯA ĐĂNG NHẬP -->
						<c:if test="${empty sessionScope.user}">
							<a href="${pageContext.request.contextPath}/user-pages/login.jsp">
								Đăng nhập </a>
							<a
								href="${pageContext.request.contextPath}/user-pages/signup.jsp">
								Đăng ký </a>
						</c:if>

					</div>

				</div>
			</div>
		</div>
	</header>
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
        function showNotifyDetail(type, time, message, id) {
            document.getElementById('modalTitle').innerText = (type === 'ORDER') ? '📦 Chi tiết đơn hàng' : '💬 Nội dung phản hồi';
            document.getElementById('modalTime').innerText = 'Thời gian: ' + time;
            document.getElementById('modalContent').innerText = message;
            document.getElementById('notifyModal').style.display = 'block';

            // Gửi lệnh ngầm cập nhật trạng thái đã đọc vào DB
            fetch('${pageContext.request.contextPath}/mark-read?id=' + id);
        }

        function closeNotify() {
            document.getElementById('notifyModal').style.display = 'none';
        }

        window.onclick = function(event) {
            if (event.target == document.getElementById('notifyModal')) {
                closeNotify();
            }
        }
</script>
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</html>