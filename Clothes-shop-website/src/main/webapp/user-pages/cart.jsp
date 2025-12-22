<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <style>
        body{font-family:Poppins,sans-serif;background:#f6f6f6;margin:0}
        .container{width:1100px;max-width:95%;margin:30px auto}
        .box{background:#fff;border-radius:12px;box-shadow:0 10px 25px rgba(0,0,0,.08);padding:20px}
        table{width:100%;border-collapse:collapse}
        th,td{padding:12px;border-bottom:1px solid #eee;vertical-align:middle}
        th{text-align:left}
        .img{width:70px;height:70px;object-fit:cover;border-radius:10px;border:1px solid #eee}
        .qty{width:70px;padding:8px}
        .btn{border:none;border-radius:30px;padding:10px 16px;cursor:pointer}
        .btn-dark{background:#000;color:#fff}
        .btn-light{background:#fff;border:1px solid #ccc}
        .right{display:flex;justify-content:flex-end;gap:20px;align-items:center;margin-top:15px}
        .danger{color:#e74c3c;text-decoration:none}
    </style>
</head>
<body>
<jsp:include page="/user-pages/navbar.jsp"/>

<div class="container">
    <div class="box">
        <h2><i class="fa-solid fa-cart-shopping"></i> Giỏ hàng</h2>

        <c:if test="${empty cart}">
            <p>Giỏ hàng của bạn đang trống.</p>
            <a class="btn btn-dark" href="${pageContext.request.contextPath}/user-pages/home.jsp">Tiếp tục mua sắm</a>
        </c:if>

        <c:if test="${not empty cart}">
            <table>
                <thead>
                <tr>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Tạm tính</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart}" var="i">
                    <tr>
                        <td>
                            <img class="img"
                                 src="${pageContext.request.contextPath}/assets/uploaded-images/${i.image}"
                                 alt="${i.name}"/>
                            <strong style="margin-left:10px">${i.name}</strong>
                        </td>
                        <td><fmt:formatNumber value="${i.price}" pattern="#,###"/>đ</td>

                        <td>
                            <form action="${pageContext.request.contextPath}/update-cart" method="post">
                                <input type="hidden" name="id" value="${i.productId}"/>
                                <input class="qty" type="number" name="quantity" min="1" value="${i.quantity}"/>
                                <button class="btn btn-light" type="submit">Cập nhật</button>
                            </form>
                        </td>

                        <td><fmt:formatNumber value="${i.price * i.quantity}" pattern="#,###"/>đ</td>

                        <td>
                            <a class="danger"
                               href="${pageContext.request.contextPath}/remove-from-cart?id=${i.productId}">
                                Xóa
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="right">
                <div>
                    <strong>Tạm tính:</strong>
                    <fmt:formatNumber value="${subtotal}" pattern="#,###"/>đ
                </div>

                <a class="btn btn-light" href="${pageContext.request.contextPath}/clear-cart">Xóa giỏ</a>
                <a class="btn btn-dark" href="${pageContext.request.contextPath}/checkout">Thanh toán</a>
            </div>
        </c:if>
    </div>
</div>

<jsp:include page="/user-pages/footer.jsp"/>
</body>
</html>
