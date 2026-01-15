<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<title>Sản phẩm hot | Fashion Shop</title>

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

/* ====== LAYOUT ====== */
.container {
	display: grid;
	grid-template-columns: 250px 1fr;
	gap: 20px;
	padding: 20px;
}

/* =========================================================
   ✅ HIỆU ỨNG Ô NỔI / CARD (GIỐNG ẢNH)
   Áp dụng cho: .filter, .products, .product-card
   ========================================================= */
.filter, .products, .product-card {
	background: #fff;
	border-radius: 18px;
	border: 1px solid rgba(0,0,0,0.06);
	box-shadow: 0 10px 28px rgba(0,0,0,0.10);
	position: relative;
	overflow: hidden;
	transition: transform .22s ease, box-shadow .22s ease, border-color .22s ease;
	will-change: transform;
}

/* glow nhẹ phía sau */
.filter::before, .products::before, .product-card::before {
	content: "";
	position: absolute;
	inset: -40px;
	background: radial-gradient(circle at 30% 20%,
		rgba(255,71,87,0.18),
		transparent 60%);
	opacity: 0;
	transition: opacity .22s ease;
	pointer-events: none;
	z-index: 0;
}

/* đảm bảo nội dung nằm trên glow */
.filter > *, .products > *, .product-card > * {
	position: relative;
	z-index: 1;
}

/* hover nhấc lên */
.filter:hover, .products:hover, .product-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 16px 42px rgba(0,0,0,0.16);
	border-color: rgba(255,71,87,0.30);
}
.filter:hover::before, .products:hover::before, .product-card:hover::before {
	opacity: 1;
}
.filter:active, .products:active, .product-card:active {
	transform: translateY(-2px);
}

/* ================= FILTER ================= */
.filter {
	padding: 20px;
}

.filter h3 {
	margin-bottom: 15px;
}

.filter-group {
	margin-bottom: 20px;
}

.filter-group label {
	display: block;
	margin-bottom: 5px;
	cursor: pointer;
}

/* ================= PRODUCTS ================= */
.products {
	padding: 20px;
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
	gap: 20px;
}

/* ================= PRODUCT CARD ================= */
.product-card {
	border-radius: 18px; /* card bo hơn */
	/* shadow đã có ở trên, giữ đồng nhất */
}

.product-img {
	position: relative;
}

.product-img img {
	width: 100%;
	height: 280px;
	object-fit: cover;
	display: block;
}

/* ================= FAVORITE (HEART) ================= */
.favorite {
	position: absolute;
	top: 10px;
	right: 10px;
	background: #fff;
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
	color: #e74c3c;
	transition: all 0.25s ease;
	box-shadow: 0 6px 18px rgba(0,0,0,0.12);
}

.favorite:hover {
	background: #e74c3c;
	color: #fff;
	transform: scale(1.12);
	box-shadow: 0 10px 22px rgba(231, 76, 60, 0.35);
}

/* ================= INFO ================= */
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

/* ================= BUTTONS ================= */
.btn-group {
	display: flex;
	gap: 10px;
}

.btn {
	flex: 1;
	padding: 8px;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	font-size: 14px;
	transition: all 0.25s ease;
}

/* ADD TO CART */
.btn-cart {
	background: #2ecc71;
	color: white;
}
.btn-cart:hover {
	background: #27ae60;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(46, 204, 113, 0.45);
}

/* DETAIL */
.btn-detail {
	background: #3498db;
	color: white;
}
.btn-detail:hover {
	background: #2980b9;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(52, 152, 219, 0.45);
}

/* (tuỳ chọn) hover card nhẹ thêm cho cảm giác mượt */
.product-card:hover .product-img img {
	transform: scale(1.02);
	transition: transform .22s ease;
}
</style>
</head>

<body>
	<jsp:include page="/user-pages/navbar.jsp" />

	<div class="container">

		<!-- ================= FILTER ================= -->
		<aside class="filter">
			<h3>Thời trang thịnh hành</h3>
			<h3>Lọc sản phẩm</h3>

			<div class="filter-group">
				<strong>Giới tính</strong>
				<label><input type="radio" name="gender" class="filter-gender" value="NAM"> Nam</label>
				<label><input type="radio" name="gender" class="filter-gender" value="NU"> Nữ</label>
				<label><input type="radio" name="gender" class="filter-gender" value="UNISEX"> Unisex</label>
				<label><input type="radio" name="gender" class="filter-gender" value="all" checked> Tất cả</label>
			</div>

			<div class="filter-group">
				<strong>Khoảng giá</strong>
				<label><input type="checkbox" class="filter-price" value="0-200000"> Dưới 200k</label>
				<label><input type="checkbox" class="filter-price" value="200000-500000"> 200k - 500k</label>
				<label><input type="checkbox" class="filter-price" value="500000-999999999"> Trên 500k</label>
			</div>
		</aside>

		<!-- ================= PRODUCTS ================= -->
		<section class="products">
			<div class="products-grid">
				<c:forEach items="${hotProducts}" var="p">
					<div class="product-card"
						 data-type="${p.categoryName}"
						 data-gender="${p.categoryName}"
						 data-price="${p.price}">

						<div class="product-img">
							<img
								src="${pageContext.request.contextPath}/assets/uploaded-images/${not empty p.imageUrl ? p.imageUrl : 'default.jpg'}"
								alt="${p.name}">

							<div class="favorite btn-wishlist" data-id="${p.id}">
								<i class="fa-solid fa-heart"></i>
							</div>
						</div>

						<div class="product-info">
							<h4>${p.name}</h4>
							<div class="price">
								<fmt:formatNumber value="${p.price}" pattern="#,###" />đ
							</div>

							<div class="btn-group">
								<button class="btn btn-cart add-to-cart-btn" data-id="${p.id}">
									<i class="fa-solid fa-cart-shopping"></i>
								</button>

								<button class="btn btn-detail" type="button"
									onclick="window.location.href='${pageContext.request.contextPath}/product-detail?id=${p.id}'">
									Chi tiết
								</button>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</section>

	</div>

	<jsp:include page="/user-pages/footer.jsp" />

	<script>
document.addEventListener("DOMContentLoaded", function () {
    const filters = document.querySelectorAll('.filter-group input');
    const products = document.querySelectorAll(".product-card");

    filters.forEach((input) => {
        input.addEventListener("change", filterProducts);
    });

    function filterProducts() {
        const selectedTypes = Array.from(document.querySelectorAll(".filter-type:checked")).map(cb => cb.value);
        const selectedPrices = Array.from(document.querySelectorAll(".filter-price:checked")).map(cb => cb.value);

        const genderRadio = document.querySelector(".filter-gender:checked");
        const selectedGender = genderRadio ? genderRadio.value : "all";

        products.forEach((product) => {
            const pType = product.getAttribute("data-type");
            const pGender = product.getAttribute("data-gender");
            const pPrice = parseFloat(product.getAttribute("data-price"));

            const typeMatch = selectedTypes.length === 0 || selectedTypes.includes(pType);
            const genderMatch = selectedGender === "all" || pGender === selectedGender;

            let priceMatch = selectedPrices.length === 0;
            selectedPrices.forEach(range => {
                const [min, max] = range.split("-").map(Number);
                if (pPrice >= min && pPrice <= max) priceMatch = true;
            });

            if (typeMatch && genderMatch && priceMatch) product.style.display = "";
            else product.style.display = "none";
        });
    }
});
</script>
</body>
</html>
