<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Sản phẩm yêu thích | Fashion Shop</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: #f6f6f6;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 40px 20px;
        }

        /* ================= TITLE ================= */
        .page-title {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .page-title h1 {
            font-size: 28px;
            color: #2c3e50;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .page-title h1 i {
            color: #e74c3c;
        }

        /* ================= GRID ================= */
        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
            gap: 25px;
        }

        /* ================= PRODUCT CARD ================= */
        .product-card {
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 6px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-6px);
        }

        .product-img {
            position: relative;
        }

        .product-img img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .remove-fav {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #e74c3c;
            color: white;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.3s;
        }

        .remove-fav:hover {
            background: #c0392b;
        }

        .product-info {
            padding: 15px;
            text-align: center;
        }

        .product-info h4 {
            font-size: 15px;
            margin-bottom: 8px;
            color: #333;
        }

        .price {
            color: #e74c3c;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .btn-group {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .btn {
            border: none;
            padding: 8px 14px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 13px;
            transition: 0.3s;
        }

        .btn-cart {
            background: #3498db;
            color: white;
        }

        .btn-cart:hover {
            background: #2980b9;
        }

        .btn-detail {
            background: #ecf0f1;
        }

        .btn-detail:hover {
            background: #dcdde1;
        }

        /* ================= EMPTY ================= */
        .empty {
            text-align: center;
            padding: 80px 20px;
            color: #777;
        }

        .empty i {
            font-size: 60px;
            color: #e74c3c;
            margin-bottom: 15px;
        }

        .empty a {
            display: inline-block;
            margin-top: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }

        .empty a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
	<jsp:include page="/user-pages/navbar.jsp" />
<div class="container">

    <!-- TITLE -->
    <div class="page-title">
        <h1>
            <i class="fa-solid fa-heart"></i>
            Sản phẩm yêu thích
        </h1>
    </div>

    <!-- ================= WISHLIST ================= -->
    <div class="container">
	    <c:choose>
	        <%-- Kiểm tra nếu danh sách yêu thích (wishlist) không trống --%>
	        <c:when test="${not empty wishlist}">
	            <div class="wishlist-grid">
	                <c:forEach var="p" items="${wishlist}">
	                    <div class="product-card">
	                        <div class="product-img">
	                            <%-- Hiển thị ảnh sản phẩm từ thuộc tính imageUrl --%>
	                            <img
								src="${pageContext.request.contextPath}/assets/uploaded-images/${p.imageUrl}"
								alt="${p.name}">
	                            
	                            <%-- Nút Xóa khỏi yêu thích --%>
	                            <div class="remove-fav" 
	                                 onclick="window.location.href='wishlist-controller?action=delete&pid=${p.id}'">
	                                <i class="fa-solid fa-xmark"></i>
	                            </div>
	                        </div>
	                        
	                        <div class="product-info">
	                            <h4>${p.name}</h4>
	                            <div class="price">
	                                <fmt:formatNumber value="${p.price}" pattern="#,###" />đ
	                            </div>
	                            
	                            <div class="btn-group">
	                                <%-- Nút thêm nhanh vào giỏ hàng --%>
	                                <button class="btn btn-cart" 
	                                        onclick="window.location.href='cart-controller?action=add&pid=${p.id}'">
	                                    <i class="fa-solid fa-cart-shopping"></i>
	                                </button>
	                                
	                                <%-- Nút xem chi tiết sản phẩm --%>
	                                <button class="btn btn-detail" 
	                                        onclick="window.location.href='detail?pid=${p.id}'">
	                                    Chi tiết
	                                </button>
	                            </div>
	                        </div>
	                    </div>
	                </c:forEach>
	            </div>
	        </c:when>
	
	        <%-- EMPTY STATE: Hiển thị khi danh sách trống --%>
	        <c:otherwise>
	            <div class="empty">
	                <i class="fa-solid fa-heart-crack"></i>
	                <h3>Chưa có sản phẩm yêu thích</h3>
	                <p>Hãy thêm sản phẩm bạn thích để xem lại sau</p>
	                <a href="${pageContext.request.contextPath}/user-pages/home.jsp" class="btn-primary">Tiếp tục mua sắm</a>
	            </div>
	        </c:otherwise>
	    </c:choose>
	</div>
	
	<jsp:include page="/user-pages/footer.jsp" />
</body>
</html>
>