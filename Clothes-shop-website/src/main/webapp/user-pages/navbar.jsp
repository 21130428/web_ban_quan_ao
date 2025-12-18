<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    top: 130%;      /* đẩy xuống dưới icon */
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
    content: "2";           /* sau này thay bằng Session */
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
        <div class="logo" style="color: green">FASHION</div>

        <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/user-pages/home.jsp">Trang chủ</a></li>
            <li>
                <a href="${pageContext.request.contextPath}/user-pages/hot.jsp">Sản phẩm</a>
                <div class="dropdown">
                	<a href="${pageContext.request.contextPath}/user-pages/hot.jsp" style="color: red">Hot</a>
                    <a href="${pageContext.request.contextPath}/male-clothes">Quần áo nam</a>
                    <a href="${pageContext.request.contextPath}/female-clothes">Quần áo nữ</a>
                    <a href="${pageContext.request.contextPath}/jewelry">Trang sức</a>
                </div>
            </li>
            <li><a href="${pageContext.request.contextPath}/user-pages/event.jsp">Thông báo</a></li>
            <li><a href="${pageContext.request.contextPath}/user-pages/contact.jsp">Liên hệ</a></li>
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
			</a>
            <!-- USER -->
            <div class="menu-user">
                <i class="fa fa-user" id="userIcon"></i>

                <div class="dropdown user-dropdown">
                    <a href="#">Tài khoản</a>
                    <a href="${pageContext.request.contextPath}/user-pages/login.jsp">
                        Đăng xuất
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>
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
<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</html>