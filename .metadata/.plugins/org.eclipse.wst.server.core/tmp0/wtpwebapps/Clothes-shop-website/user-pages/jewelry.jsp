<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="vi">
<head>
<title>Trang sức| Fashion Shop</title>

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
		    <h3>Trang sức</h3>
		
		    <div class="filter-group">
		        <strong>Loại trang sức</strong> 
		        <label><input type="checkbox" class="filter-type" value="Nhẫn"> Nhẫn</label> 
		        <label><input type="checkbox" class="filter-type" value="Dây chuyền"> Dây chuyền</label> 
		        <label><input type="checkbox" class="filter-type" value="Vòng tay"> Vòng tay</label>
		        <label><input type="checkbox" class="filter-type" value="Lắc tay"> Lắc tay</label> 
		        <label><input type="checkbox" class="filter-type" value="Bông tai"> Bông tai</label> 
		        <label><input type="checkbox" class="filter-type" value="Đồng hồ"> Đồng hồ</label>
		    </div>
		
		    <div class="filter-group">
		        <strong>Đối tượng</strong> 
		        <label><input type="checkbox" class="filter-target" value="NAM"> Nam</label> 
		        <label><input type="checkbox" class="filter-target" value="NU"> Nữ</label> 
		        <label><input type="checkbox" class="filter-target" value="UNISEX"> Unisex</label>
		    </div>
		
		    <div class="filter-group">
		        <strong>Chất liệu</strong> 
		        <label><input type="checkbox" class="filter-material" value="Vàng"> Vàng</label> 
		        <label><input type="checkbox" class="filter-material" value="Bạc"> Bạc</label> 
		        <label><input type="checkbox" class="filter-material" value="Titan"> Titan</label> 
		        <label><input type="checkbox" class="filter-material" value="Thép không gỉ"> Thép không gỉ</label> 
		        <label><input type="checkbox" class="filter-material" value="Đá quý"> Đá quý</label>
		    </div>
		
		    <div class="filter-group">
		        <strong>Khoảng giá</strong> 
		        <label><input type="checkbox" class="filter-price" value="0-500000"> Dưới 500k</label> 
		        <label><input type="checkbox" class="filter-price" value="500000-2000000"> 500k – 2tr</label> 
		        <label><input type="checkbox" class="filter-price" value="2000000-999999999"> Trên 2tr</label>
		    </div>
		</aside>
		<!-- ================= PRODUCTS ================= -->
		<section class="products">
		    <div class="products-grid">
		        <%-- Lặp qua danh sách trang sức từ Servlet --%>
			    <c:forEach items="${listP}" var="p">
			        <div class="product-card" 
			             data-type="${p.categoryName}" 
			             data-target="${p.target}" 
			             data-material="${p.material}" 
			             data-price="${p.price}">
			            
			            <div class="product-img">
			                <%-- Đường dẫn đồng bộ với thư mục uploaded-images --%>
			                <img src="${pageContext.request.contextPath}/assets/uploaded-images/${p.imageUrl}" 
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
			                    <a href="${pageContext.request.contextPath}/product-detail?id=${p.id}" class="btn btn-detail">
								    Chi tiết
								</a>
			                </div>
			            </div>
			        </div>
			    </c:forEach>
			    <%-- Thông báo nếu không có sản phẩm --%>
			    <c:if test="${empty listP}">
			        <div class="text-center w-100 py-5">
			            <p class="text-muted">Hiện chưa có mẫu trang sức nào được cập nhật.</p>
			        </div>
			    </c:if>
		        
		    </div>
		</section>
	</div>
	<jsp:include page="/user-pages/footer.jsp" />
	
<script>
document.addEventListener("DOMContentLoaded", function () {
    const checkboxes = document.querySelectorAll('.filter-group input[type="checkbox"]');
    const products = document.querySelectorAll(".product-card");

    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener("change", filterProducts);
    });

    function filterProducts() {
        // Thu thập các mảng giá trị đang được chọn
        const selectedTypes = getSelected(".filter-type");
        const selectedTargets = getSelected(".filter-target");
        const selectedMaterials = getSelected(".filter-material");
        const selectedColors = getSelected(".filter-color");
        const selectedPrices = getSelected(".filter-price");

        products.forEach((product) => {
            const pType = product.getAttribute("data-type");
            const pTarget = product.getAttribute("data-target");
            const pMaterial = product.getAttribute("data-material");
            const pColor = product.getAttribute("data-color");
            const pPrice = parseFloat(product.getAttribute("data-price"));

            // Kiểm tra từng điều kiện (Nếu mảng rỗng thì mặc định là true)
            const typeMatch = selectedTypes.length === 0 || selectedTypes.includes(pType);
            const targetMatch = selectedTargets.length === 0 || selectedTargets.includes(pTarget);
            const materialMatch = selectedMaterials.length === 0 || selectedMaterials.includes(pMaterial);
            const colorMatch = selectedColors.length === 0 || selectedColors.includes(pColor);
            
            let priceMatch = selectedPrices.length === 0;
            selectedPrices.forEach(range => {
                const [min, max] = range.split("-").map(Number);
                if (pPrice >= min && pPrice <= max) priceMatch = true;
            });

            // Hiển thị nếu thỏa mãn TẤT CẢ nhóm lọc (AND)
            if (typeMatch && targetMatch && materialMatch && colorMatch && priceMatch) {
                product.style.display = ""; 
            } else {
                product.style.display = "none";
            }
        });
    }

    function getSelected(selector) {
        return Array.from(document.querySelectorAll(selector + ":checked")).map(cb => cb.value);
    }
});
</script>
</body>
</html>
