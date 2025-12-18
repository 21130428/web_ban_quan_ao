<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<button class="btn btn-outline-dark active">Tất cả</button>
						<button class="btn btn-outline-dark">Chờ xác nhận</button>
						<button class="btn btn-outline-dark">Đang giao</button>
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
								<tr>
									<td>#ORD-1024</td>
									<td><strong>Nguyễn Văn A</strong><br> <small
										class="text-muted">0901234567</small></td>
									<td>15/12/2025</td>
									<td class="fw-bold text-danger">1.250.000đ</td>
									<td><span class="badge bg-secondary text-uppercase">COD</span></td>
									<td><span class="badge rounded-pill bg-warning text-dark">Chờ
											xác nhận</span></td>
									<td class="text-center"><select
										class="form-select form-select-sm d-inline-block w-auto ms-2">
											<option>Đổi trạng thái</option>
											<option>Đã xác nhận</option>
											<option>Đang giao hàng</option>
											<option>Đã hủy</option>
									</select></td>
								</tr>
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
					<h5 class="modal-title">Chi tiết đơn hàng #ORD-1024</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<h6>Thông tin giao hàng:</h6>
					<p class="small text-muted">Địa chỉ: 123 Đường ABC, Quận 1,
						TP.HCM</p>
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
						<tbody>
							<tr>
								<td>Áo thun Nam Men-01</td>
								<td>350.000đ</td>
								<td>2</td>
								<td>700.000đ</td>
							</tr>
							<tr>
								<td>Nhẫn Bạc Jewelry-05</td>
								<td>550.000đ</td>
								<td>1</td>
								<td>550.000đ</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="3" class="text-end">Phí ship:</th>
								<th>30.000đ</th>
							</tr>
							<tr>
								<th colspan="3" class="text-end">Tổng cộng:</th>
								<th class="text-danger">1.280.000đ</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-success">
						<i class="bi bi-printer"></i> In hóa đơn
					</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>