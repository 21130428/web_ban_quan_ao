<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin - Products</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
</head>
<body>
<h1>Quản lý sản phẩm</h1>
<p><a href="${pageContext.request.contextPath}/admin/products?action=add">Thêm sản phẩm mới</a></p>

<table border="1" cellpadding="6" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Danh mục</th>
        <th>Ảnh</th>
        <th>Tồn kho</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.price}</td>
            <td>${p.categoryId}</td>
            <td><c:out value="${p.image}"/></td>
            <td>${p.stock}</td>
            <td>${p.status}</td>
            <td>
                <a href="${pageContext.request.contextPath}/admin/products?action=edit&id=${p.id}">Sửa</a>
                |
                <a href="${pageContext.request.contextPath}/admin/products?action=delete&id=${p.id}" onclick="return confirm('Xóa chứ?')">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
