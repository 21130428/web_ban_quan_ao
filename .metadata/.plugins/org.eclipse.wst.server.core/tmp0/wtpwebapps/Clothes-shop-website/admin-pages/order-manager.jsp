<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Quản lý đơn hàng - Admin</title>
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

.status-pending {
	color: #ffc107;
	fw-bold;
} /* Chờ xác nhận */
.status-shipping {
	color: #0dcaf0;
} /* Đang giao */
.status-completed {
	color: #198754;
} /* Thành công */
</style>
</head>
<body class="bg-light">

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/admin-pages/admin-navbar.jsp"></jsp:include>

			<main class="col-md-10 ms-sm-auto px-md-4 py-4">
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h2>
						<i class="bi bi-cart-check me-2"></i>Quản lý đơn hàng
					</h2>
					<div class="btn-group">
					    <%-- Nút Tất cả (status=0) --%>
					    <a href="admin-orders?status=0" 
					       class="btn btn-outline-dark ${currentStatus == 0 ? 'active' : ''}">Tất cả</a>
					    
					    <%-- Nút Chờ xác nhận (status=1) --%>
					    <a href="admin-orders?status=1" 
					       class="btn btn-outline-dark ${currentStatus == 1 ? 'active' : ''}">Chờ xác nhận</a>
					    
					     <%-- Nút Chờ xác nhận (status=1) --%>
					    <a href="admin-orders?status=2" 
					       class="btn btn-outline-dark ${currentStatus == 2 ? 'active' : ''}">Đã xác nhận</a>
					    
					    <%-- Nút Đang giao (status=3) --%>
					    <a href="admin-orders?status=3" 
					       class="btn btn-outline-dark ${currentStatus == 3 ? 'active' : ''}">Đang giao</a>
					       
					    <%-- Nút Đang giao (status=3) --%>
					    <a href="admin-orders?status=4" 
					       class="btn btn-outline-dark ${currentStatus == 4 ? 'active' : ''}">Đã giao thành công</a>
					       
					    <%-- Nút Đã hủy (status=5) --%>
					    <a href="admin-orders?status=5" 
					       class="btn btn-outline-dark ${currentStatus == 5 ? 'active' : ''}">Đã hủy</a>
					</div>
				</div>

				<div class="card shadow-sm">
					<div class="card-body p-0">
						<table class="table table-hover mb-0 align-middle">
							<thead class="table-dark">
								<tr>
									<th>Mã đơn</th>
									<th>Khách hàng</th>
									<th>Ngày đặt</th>
									<th>Tổng tiền</th>
									<th>Thanh toán</th>
									<th>Trạng thái</th>
									<th class="text-center">Thao tác</th>
								</tr>
							</thead>
							<tbody>
							<c:if test="${empty orderList}">
						        <tr>
						            <td colspan="7" class="text-center py-4 text-muted">Không có đơn hàng nào.</td>
						        </tr>
						    </c:if>
							    <c:forEach var="o" items="${orderList}">
							        <tr>
							            <td>#ORD-${o.orderId}</td>
							            <td><strong>${o.fullName}</strong><br> 
							                <small class="text-muted">${o.phone}</small></td>
							            <td><fmt:formatDate value="${o.createdAt}" pattern="dd/MM/yyyy HH:mm"/></td>
							            <td class="fw-bold text-danger">
							                <fmt:formatNumber value="${o.totalAmount}" pattern="#,###"/>đ
							            </td>
							            <td><span class="badge bg-secondary text-uppercase">${o.paymentMethod}</span></td>
							            <td>
							                <%-- Hiển thị màu sắc badge theo trạng thái --%>
							                <c:set var="badgeClass" value="${o.statusId == 1 ? 'bg-warning' : (o.statusId == 5 ? 'bg-danger' : 'bg-success')}" />
							                <span class="badge rounded-pill ${badgeClass}">${o.statusName}</span>
							            </td>
							            <td class="text-center">
								            <button class="btn btn-sm btn-info view-detail-btn" 
										            data-id="${o.orderId}" 
										            data-address="${o.address}">
										        <i class="bi bi-eye"></i>
										    </button>
							                <select class="form-select form-select-sm d-inline-block w-auto" 
							                        onchange="changeStatus(${o.orderId}, this.value)">
							                    <option value="0">Đổi trạng thái</option>
							                    <option value="1">Chờ xác nhận</option>
							                    <option value="2">Đã xác nhận</option>
							                    <option value="3">Đang giao hàng</option>
							                    <option value="4">Giao hàng thành công</option>
							                    <option value="5">Hủy đơn</option>
							                </select>
							            </td>
							        </tr>
							    </c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</main>
		</div>
	</div>

	<div class="modal fade" id="orderDetailModal" tabindex="-1">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title">Chi tiết đơn hàng <span id="md-order-id"></span></h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	            </div>
	            <div class="modal-body">
	                <h6>Thông tin giao hàng:</h6>
	                <p class="small text-muted" id="md-address"></p>
	                <hr>
	                <table class="table table-sm">
	                    <thead>
	                        <tr>
	                            <th>Sản phẩm</th>
	                            <th>Giá</th>
	                            <th>SL</th>
	                            <th>Thành tiền</th>
	                        </tr>
	                    </thead>
	                    <tbody id="order-items-body">
	                        </tbody>
	                </table>
	            </div>
	            </div>
	    </div>
	</div>
	
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
<script>
function changeStatus(orderId, statusId) {
    if(statusId !== "") {
        if(confirm("Xác nhận thay đổi trạng thái đơn hàng này?")) {
            window.location.href = "admin-orders?action=updateStatus&oid=" + orderId + "&sid=" + statusId;
        }
    }
}
</script>

<script>
$(document).ready(function() {
    $('.view-detail-btn').click(function() {
        var orderId = $(this).data('id');
        var address = $(this).data('address');
        
        // 1. Điền thông tin cơ bản vào Modal
        $('#md-order-id').text('#ORD-' + orderId);
        $('#md-address').text('Địa chỉ: ' + address);
        
        // 2. Gọi Ajax lấy chi tiết sản phẩm
        $.ajax({
            url: 'admin-order-detail',
            type: 'GET',
            data: { oid: orderId },
            success: function(items) {
                var html = '';
                var total = 0;
                items.forEach(function(item) {
                    var subtotal = item.price * item.quantity;
                    total += subtotal;
                    html += `<tr>
                                <td>\${item.productName}</td>
                                <td>\${item.price.toLocaleString()}đ</td>
                                <td>\${item.quantity}</td>
                                <td>\${subtotal.toLocaleString()}đ</td>
                             </tr>`;
                });
                $('#order-items-body').html(html);
                // Hiển thị Modal
                var myModal = new bootstrap.Modal(document.getElementById('orderDetailModal'));
                myModal.show();
            }
        });
    });
});
</script>
</body>
</html>