<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý đánh giá - Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<style>
.sidebar {
	background: #212529;
	min-height: 100vh;
	color: white;
}

.card-form {
	position: sticky;
	top: 20px;
}
</style>
</head>
<body class="bg-light">
<div class="container-fluid">
<div class="row">
	<jsp:include page="/admin-pages/admin-navbar.jsp"></jsp:include>
		<main class="col-md-10 ms-sm-auto p-4">
			<h2 class="mb-4">Quản lý Đánh giá sản phẩm</h2>
	
			<div class="table-responsive bg-white p-3 shadow-sm rounded">
				<table class="table table-hover align-middle">
					<thead class="table-dark">
						<tr>
							<th>Người dùng</th>
							<th>Sản phẩm</th>
							<th>Số sao</th>
							<th>Nội dung</th>
							<th>Ngày gửi</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewList}" var="r">
							<tr>
								<td><strong>${r.username}</strong></td>
								<td><small>${r.productName}</small></td>
								<td><c:forEach begin="1" end="5" var="i">
										<i
											class="bi bi-star-fill ${i <= r.rating ? 'text-warning' : 'text-muted'}"></i>
									</c:forEach></td>
								<td style="max-width: 300px;"><c:out value="${r.comment}" />
								</td>
								<td><fmt:formatDate value="${r.createdAt}"
										pattern="dd/MM/yyyy HH:mm" /></td>
								<td><a href="manage-reviews?action=delete&id=${r.reviewId}"
									class="btn btn-sm btn-outline-danger"
									onclick="return confirm('Bạn có chắc chắn muốn xóa đánh giá này?')">
										<i class="bi bi-trash"></i> Xóa
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</div>
</div>
</body>
</html>