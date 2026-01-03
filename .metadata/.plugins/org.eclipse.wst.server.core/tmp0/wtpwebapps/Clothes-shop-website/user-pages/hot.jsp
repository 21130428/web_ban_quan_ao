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

.container {
	display: grid;
	grid-template-columns: 250px 1fr;
	gap: 20px;
	padding: 20px;
}

/* ================= FAVORITE (HEART) ================= */
.favorite {
	position: absolute;
	top: 10px;
	right: 10px;
	background: white;
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
	color: #ccc;
	transition: all 0.3s ease;
}

.favorite:hover {
	background: #e74c3c;
	color: white;
	transform: scale(1.15);
	box-shadow: 0 4px 10px rgba(231, 76, 60, 0.4);
}

/* ================= BUTTON COMMON ================= */
.btn {
	transition: all 0.3s ease;
}

/* ================= ADD TO CART ================= */
.btn-cart {
	background: #2ecc71;
	color: white;
}

.btn-cart:hover {
	background: #27ae60;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(46, 204, 113, 0.5);
}

/* ================= DETAIL BUTTON ================= */
.btn-detail {
	background: #3498db;
	color: white;
}

.btn-detail:hover {
	background: #2980b9;
	transform: translateY(-3px);
	box-shadow: 0 5px 15px rgba(52, 152, 219, 0.5);
}

/* ================= FILTER ================= */
.filter {
	background: white;
	padding: 20px;
	border-radius: 10px;
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
	background: white;
	padding: 20px;
	border-radius: 10px;
}

.products-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.products-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
	gap: 20px;
}

.product-card {
	background: #fff;
	border-radius: 10px;
	overflow: hidden;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
	transition: transform 0.3s;
}

.product-img {
	position: relative;
}

.product-img img {
	width: 100%;
	height: 280px;
	object-fit: cover;
}

.favorite {
	position: absolute;
	top: 10px;
	right: 10px;
	background: white;
	padding: 8px;
	border-radius: 50%;
	cursor: pointer;
	color: #e74c3c;
}

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

.btn-group {
	display: flex;
	gap: 10px;
}

.btn {
	flex: 1;
	padding: 8px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px;
}

.btn-cart {
	background: #2ecc71;
	color: white;
}

.btn-detail {
	background: #3498db;
	color: white;
}

/* ================= PRODUCTS HEADER ================= */
.products-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
	padding-bottom: 10px;
	border-bottom: 2px solid #eee;
}

/* TITLE */
.products-header h2 {
	font-size: 22px;
	font-weight: 600;
	color: #333;
	position: relative;
}

/* underline nhẹ cho tiêu đề */
.products-header h2::after {
	content: "";
	width: 60px;
	height: 3px;
	background: #e67e22;
	position: absolute;
	left: 0;
	bottom: -8px;
	border-radius: 2px;
}

/* ================= SORT SELECT ================= */
.products-header select {
	padding: 8px 15px;
	border-radius: 20px;
	border: 1px solid #ddd;
	font-size: 14px;
	cursor: pointer;
	background: #fff;
	outline: none;
	transition: all 0.3s ease;
}

/* hover */
.products-header select:hover {
	border-color: #3498db;
}

/* focus */
.products-header select:focus {
	border-color: #3498db;
	box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
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
		                    <img src="${pageContext.request.contextPath}/assets/uploaded-images/${not empty p.imageUrl ? p.imageUrl : 'default.jpg'}" alt="${p.name}">
		                    <div class="favorite btn-wishlist" data-id="${p.id}">
							    <i class="fa-solid fa-heart"></i>
							</div>
		                </div>
		                
		                <div class="product-info">
		                    <h4>${p.name}</h4>
		                    <div class="price"><fmt:formatNumber value="${p.price}" pattern="#,###"/>đ</div>
		                    
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
        // 1. Thu thập dữ liệu từ các bộ lọc
        const selectedTypes = Array.from(document.querySelectorAll(".filter-type:checked")).map(cb => cb.value);
        const selectedPrices = Array.from(document.querySelectorAll(".filter-price:checked")).map(cb => cb.value);
        
        // Lấy giá trị radio gender đang chọn
        const genderRadio = document.querySelector(".filter-gender:checked");
        const selectedGender = genderRadio ? genderRadio.value : "all";

        products.forEach((product) => {
            const pType = product.getAttribute("data-type");
            const pGender = product.getAttribute("data-gender");
            const pPrice = parseFloat(product.getAttribute("data-price"));

            // Logic kiểm tra Loại (Nếu không chọn cái nào thì hiện tất cả)
            const typeMatch = selectedTypes.length === 0 || selectedTypes.includes(pType);

            // Logic kiểm tra Giới tính
            const genderMatch = selectedGender === "all" || pGender === selectedGender;

            // Logic kiểm tra Giá
            let priceMatch = selectedPrices.length === 0;
            selectedPrices.forEach(range => {
                const [min, max] = range.split("-").map(Number);
                if (pPrice >= min && pPrice <= max) priceMatch = true;
            });

            // HIỂN THỊ: Sản phẩm phải khớp TẤT CẢ các điều kiện (AND)
            if (typeMatch && genderMatch && priceMatch) {
                product.style.display = ""; 
            } else {
                product.style.display = "none";
            }
        });
    }
});
</script>
</body>
</html>
