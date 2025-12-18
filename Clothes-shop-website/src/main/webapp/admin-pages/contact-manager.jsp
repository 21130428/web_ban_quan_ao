<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Quản lý tin nhắn - Admin</title>
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

.msg-new {
	border-left: 4px solid #0d6efd;
	background-color: #f8f9fa;
	font-weight: bold;
}

.msg-read {
	border-left: 4px solid #6c757d;
}

.msg-replied {
	border-left: 4px solid #198754;
	opacity: 0.8;
}
</style>
</head>
<body class="bg-light">

	<div class="container-fluid">
		<div class="row">
			<jsp:include page="/admin-pages/admin-navbar.jsp"></jsp:include>

			<main class="col-md-10 ms-sm-auto px-md-4 py-4">
				<div class="d-flex justify-content-between align-items-center mb-4">
					<h2>
						<i class="bi bi-envelope-paper me-2"></i>Tin nhắn khách hàng
					</h2>
					<div>
						<span class="badge bg-primary">Mới: 5</span> <span
							class="badge bg-success">Đã trả lời: 12</span>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card shadow-sm">
							<div class="card-body p-0">
								<table class="table table-hover mb-0 align-middle">
									<thead class="table-light">
										<tr>
											<th>Trạng thái</th>
											<th>Khách hàng</th>
											<th>Nội dung tóm tắt</th>
											<th>Ngày gửi</th>
											<th class="text-center">Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<tr class="msg-new">
											<td><span class="badge bg-primary">MỚI</span></td>
											<td><strong>Nguyễn Văn B</strong><br> <small>vânb@gmail.com</small>
											</td>
											<td><span class="text-truncate d-inline-block"
												style="max-width: 300px;">Tôi muốn hỏi về chính sách
													đổi trả hàng...</span></td>
											<td>Vừa xong</td>
											<td class="text-center">
												<button class="btn btn-sm btn-dark" data-bs-toggle="modal"
													data-bs-target="#viewMessageModal">Xem & Phản hồi</button>
											</td>
										</tr>
										<tr class="msg-replied">
											<td><span class="badge bg-success">ĐÃ PHẢN HỒI</span></td>
											<td><strong>Trần Thị C</strong><br> <small>0988xxxxxx</small>
											</td>
											<td><span
												class="text-muted text-truncate d-inline-block"
												style="max-width: 300px;">Cảm ơn shop đã tư vấn size
													áo rất kỹ...</span></td>
											<td>1 ngày trước</td>
											<td class="text-center">
												<button class="btn btn-sm btn-outline-secondary"
													data-bs-toggle="modal" data-bs-target="#viewMessageModal">Xem
													lại</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<div class="modal fade" id="viewMessageModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Nội dung tin nhắn</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<label class="fw-bold">Từ:</label> <span>Nguyễn Văn B
							(vânb@gmail.com - 0901234567)</span>
					</div>
					<div class="mb-3 p-3 bg-light rounded border">
						<p class="mb-0">"Chào shop, mình mới mua một chiếc áo sơ mi
							nam size L nhưng mặc hơi chật. Shop cho mình hỏi có được hỗ trợ
							đổi sang size XL không ạ? Mình cảm ơn."</p>
					</div>
					<hr>
					<div class="mb-3">
						<label class="form-label fw-bold">Trả lời khách hàng:</label>
						<textarea class="form-control" rows="4"
							placeholder="Nhập nội dung phản hồi gửi đến email khách hàng..."></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary">
						<i class="bi bi-send me-1"></i> Gửi phản hồi
					</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>