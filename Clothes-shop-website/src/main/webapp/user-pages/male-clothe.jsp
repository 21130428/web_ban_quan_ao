<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="vi">
<head>
<title>Sản phẩm nam| Shop Quần Áo</title>

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
			<h3>Thời trang nam</h3>

			<!-- LOẠI SẢN PHẨM -->
			<div class="filter-group">
				<strong>Loại sản phẩm</strong> 
				<label><input type="checkbox" class="filter-type" value="Áo thun">Áo thun</label> 
				<label><input type="checkbox" class="filter-type" value="Áo sơ mi">Áo sơ mi</label> 
				<label><input type="checkbox" class="filter-type" value="Áo khoác">Áo khoác</label> 
				<label><input type="checkbox" class="filter-type" value="Quần jean">Quần jean</label> 
				<label><input type="checkbox" class="filter-type" value="Quần tây">Quần tây</label> 
				<label><input type="checkbox" class="filter-type" value="Quần short">Quần short</label>
			</div>

			<!-- SIZE -->
			<div class="filter-group">
				<strong>Kích cỡ</strong> 
				<label><input type="checkbox" class="filter-size" value="S">S</label> 
				<label><input type="checkbox" class="filter-size" value="M">M</label> 
				<label><input type="checkbox" class="filter-size" value="L">L</label> 
				<label><input type="checkbox" class="filter-size" value="XL">XL</label> 
				<label><input type="checkbox" class="filter-size" value="XXL">XXL</label>
			</div>

			<!-- GIÁ -->
			<div class="filter-group">
				<strong>Khoảng giá</strong> 
				<label><input type="checkbox" class="filter-price" value="0-200000">Dưới 200.000đ</label> 
				<label><input type="checkbox" class="filter-price" value="200000-500000">200.000đ – 500.000đ</label> 
				<label><input type="checkbox" class="filter-price" value="500000-999999999">Trên 500.000đ</label>
			</div>
		</aside>


		<!-- ================= PRODUCTS ================= -->
		<section class="products">

			<div class="products-grid">

				<!-- PRODUCT -->
                <c:forEach items="${listP}" var="p">
                    <div class="product-card" 
                         data-type="${p.categoryName}" 
                         data-size="${p.size}" 
                         data-price="${p.price}">
                        
                        <div class="product-img">
                            <%-- Đường dẫn ảnh động dựa trên dữ liệu từ Database --%>
                            <img src="${pageContext.request.contextPath}/assets/uploaded-images/${p.imageUrl}" 
                                 alt="${p.name}">
                            <div class="favorite">
                                <i class="fa-solid fa-heart"></i>
                            </div>
                        </div>
                        
                        <div class="product-info">
                            <h4>${p.name}</h4>
                            <div class="price">
                                <%-- Định dạng tiền tệ: 500000 -> 500,000 --%>
                                <fmt:formatNumber value="${p.price}" pattern="#,###" />đ
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                </button>
                               <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}" class="btn btn-detail">
								    Chi tiết
								</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Hiển thị khi không có sản phẩm -->
                <c:if test="${empty listP}">
                    <div class="text-center w-100 py-5">
                        <p class="text-muted">Hiện tại chưa có sản phẩm nào thuộc mục này.</p>
                    </div>
                </c:if>
				
			</div>
		</section>

	</div>
	<jsp:include page="/user-pages/footer.jsp" />
<script>
	document.addEventListener("DOMContentLoaded", function () {
	    // Lấy tất cả checkbox và các card sản phẩm
	    const checkboxes = document.querySelectorAll('.filter-group input[type="checkbox"]');
	    const products = document.querySelectorAll(".product-card");

	    checkboxes.forEach((checkbox) => {
	        checkbox.addEventListener("change", filterProducts);
	    });

	    function filterProducts() {
	        // Lấy mảng các giá trị được chọn
	        const selectedTypes = Array.from(document.querySelectorAll(".filter-type:checked")).map(cb => cb.value);
	        const selectedSizes = Array.from(document.querySelectorAll(".filter-size:checked")).map(cb => cb.value);
	        const selectedPrices = Array.from(document.querySelectorAll(".filter-price:checked")).map(cb => cb.value);

	        products.forEach((product) => {
	            const pType = product.getAttribute("data-type");
	            const pSize = product.getAttribute("data-size");
	            const pPrice = parseFloat(product.getAttribute("data-price"));

	            // Kiểm tra: Nếu không chọn gì ở nhóm đó thì coi như thỏa mãn (Match = true)
	            const typeMatch = selectedTypes.length === 0 || selectedTypes.includes(pType);
	            const sizeMatch = selectedSizes.length === 0 || selectedSizes.includes(pSize);
	            
	            let priceMatch = selectedPrices.length === 0;
	            selectedPrices.forEach(range => {
	                const [min, max] = range.split("-").map(Number);
	                if (pPrice >= min && pPrice <= max) priceMatch = true;
	            });

	            // Hiển thị sản phẩm nếu thỏa mãn ĐỒNG THỜI cả 3 bộ lọc
	            if (typeMatch && sizeMatch && priceMatch) {
	                product.style.display = ""; // Để trống để nhận lại giá trị CSS mặc định (grid/block)
	            } else {
	                product.style.display = "none";
	            }
	        });
	    }
	});
</script>
</body>
</html>
