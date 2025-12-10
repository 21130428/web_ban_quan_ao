<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin - Product Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
</head>
<body>
<h1><c:out value="${product != null ? 'Cập nhật sản phẩm' : 'Thêm sản phẩm mới'}"/></h1>

<form method="post" action="${pageContext.request.contextPath}/admin/products">
    <input type="hidden" name="id" value="${product != null ? product.id : ''}" />
    <div>
        <label>Tên:</label>
        <input type="text" name="name" value="${product != null ? product.name : ''}" required />
    </div>
    <div>
        <label>Mô tả:</label>
        <textarea name="description">${product != null ? product.description : ''}</textarea>
    </div>
    <div>
        <label>Giá:</label>
        <input type="text" name="price" value="${product != null ? product.price : ''}" />
    </div>
    <div>
        <label>Danh mục (ID):</label>
        <input type="text" name="category_id" value="${product != null ? product.categoryId : ''}" />
    </div>
    <div>
        <label>Ảnh (path):</label>
        <input type="text" name="image" value="${product != null ? product.image : ''}" />
    </div>
    <div>
        <label>Tồn kho:</label>
        <input type="number" name="stock" value="${product != null ? product.stock : 0}" />
    </div>
    <div>
        <label>Trạng thái (1=active):</label>
        <input type="number" name="status" value="${product != null ? product.status : 1}" />
    </div>
    <div>
        <button type="submit">Lưu</button>
        <a href="${pageContext.request.contextPath}/admin/products">Hủy</a>
    </div>
</form>
</body>
</html>
