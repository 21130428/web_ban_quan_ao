<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý người dùng - Admin</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<style type="text/css">
.sidebar {
	background: #212529;
	min-height: 100vh;
	color: white;
}
</style>
</head>
<body class="bg-light">
<div class="container-fluid">
    <div class="row">
    <jsp:include page="/admin-pages/admin-navbar.jsp"></jsp:include>
		<main class="col-md-10 ms-sm-auto p-4">
            <h2 class="mb-4">Quản lý người dùng</h2>
            <div class="table-responsive bg-white p-3 shadow-sm rounded">
            <c:if test="${not empty sessionScope.errorMessage}">
			    <div class="alert alert-danger alert-dismissible fade show" role="alert">
			        <i class="bi bi-exclamation-triangle-fill me-2"></i> ${sessionScope.errorMessage}
			        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			    </div>
			    <c:remove var="errorMessage" scope="session"/>
			</c:if>
			
			<c:if test="${not empty sessionScope.successMessage}">
			    <div class="alert alert-success alert-dismissible fade show" role="alert">
			        <i class="bi bi-check-circle-fill me-2"></i> ${sessionScope.successMessage}
			        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			    </div>
			    <c:remove var="successMessage" scope="session"/>
			</c:if>
                <table class="table table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Tên đăng nhập</th>
                            <th>Email</th>
                            <th>Ngày đăng ký</th>
                            <th>Quyền hiện tại</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${userList}" var="u">
                            <tr>
                                <td>${u.userId}</td>
                                <td>${u.username}</td>
                                <td>${u.email}</td>
                                <td><fmt:formatDate value="${u.createdAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                                <td>
                                    <span class="badge ${u.role == 'ADMIN' ? 'bg-danger' : 'bg-primary'}">
                                        ${u.role}
                                    </span>
                                </td>
                                <td>
                                    <c:choose>
								        <c:when test="${u.role == 'USER'}">
								            <a href="manage-users?action=changeRole&uid=${u.userId}&role=ADMIN" 
								               class="btn btn-sm btn-outline-danger">
								               Cấp quyền ADMIN
								            </a>
								        </c:when>
								        <c:otherwise>
								            <c:if test="${sessionScope.user.userId == u.userId}">
								                <button class="btn btn-sm btn-secondary" disabled title="Bạn không thể tự hạ quyền">
								                    Hạ xuống USER
								                </button>
								            </c:if>
								            <c:if test="${sessionScope.user.userId != u.userId}">
								                <a href="manage-users?action=changeRole&uid=${u.userId}&role=USER" 
								                   class="btn btn-sm btn-outline-secondary"
								                   onclick="return confirm('Hạ quyền người dùng này?')">
								                    Hạ xuống USER
								                </a>
								            </c:if>
								        </c:otherwise>
								    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>