<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.CartItem" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navbar</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">

<style type="text/css">
/* MENU USER */
.menu-user {
	position: relative;
}

/* USER dropdown chỉnh vị trí */
.user-dropdown {
	position: absolute;
	top: 130%;
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

/* Badge số lượng giỏ hàng */
.cart-badge {
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

<%
    List<CartItem> cart =
        (List<CartItem>) session.getAttribute("cart");
    int totalQty = 0;
    if (cart != null) {
        for (CartItem c : cart) {
            totalQty += c.getQuantity();
        }
    }
%>

<header>
	<div class="container nav">

		<div class="logo" style="color: green">
			<a href="${pageContext.request.contextPath}/user-pages/home.jsp">
				FASHION
			</a>
		</div>

		<ul class="menu">
			<li>
				<a href="${pageContext.request.contextPath}/user-pages/home.jsp">
					Trang chủ
				</a>
			</li>

			<li>
				<a href="${pageContext.request.contextPath}/user-pages/hot.jsp">
					Sản phẩm
				</a>
				<div class="dropdown">
					<a href="${pageContext.request.contextPath}/user-pages/hot.jsp"
						style="color: red">Hot</a>
					<a href="${pageContext.request.contextPath}/male-clothes">
						Quần áo nam
					</a>
					<a href="${pageContext.request.contextPath}/female-clothes">
						Quần áo nữ
					</a>
					<a href="${pageContext.request.contextPath}/jewelry">
						Trang sức
					</a>
				</div>
			</li>

			<li>
				<a href="${pageContext.request.contextPath}/user-pages/event.jsp">
					Thông báo
				</a>
			</li>

			<li>
				<a href="${pageContext.request.contextPath}/user-pages/contact.jsp">
					Liên hệ
				</a>
			</li>
		</ul>

		<div class="search-box">
			<input type="text" placeholder="Tìm kiếm sản phẩm...">
			<i class="fa fa-search"></i>
		</div>

		<div class="icons">

			<a href="${pageContext.request.contextPath}/user-pages/wish-list.jsp"
				class="wishlist-link">
				<i class="fa fa-heart"></i>
			</a>

			<a href="${pageContext.request.contextPath}/user-pages/cart.jsp"
				class="cart-link">
				<i class="fa fa-shopping-cart"></i>

				<% if (totalQty > 0) { %>
					<span class="cart-badge"><%= totalQty %></span>
				<% } %>
			</a>

			<!-- USER -->
			<div class="menu-user">
				<i class="fa fa-user" id="userIcon"></i>

				<div class="dropdown user-dropdown">

					<c:if test="${not empty sessionScope.user}">
						<a href="#">
							${sessionScope.user.username}
						</a>
						<a href="${pageContext.request.contextPath}/logout">
							Đăng xuất
						</a>
					</c:if>

					<c:if test="${empty sessionScope.user}">
						<a href="${pageContext.request.contextPath}/user-pages/login.jsp">
							Đăng nhập
						</a>
						<a href="${pageContext.request.contextPath}/user-pages/signup.jsp">
							Đăng ký
						</a>
					</c:if>

				</div>
			</div>

		</div>
	</div>
</header>

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

<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>
</html>
