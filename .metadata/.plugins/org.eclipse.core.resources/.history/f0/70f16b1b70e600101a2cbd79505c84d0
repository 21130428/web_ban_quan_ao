<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm - Admin</title>
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

			<main class="col-md-10 ms-sm-auto px-md-4 py-4">
				<div class="row">
					<div class="col-lg-8">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h2>Danh sách sản phẩm</h2>
							<div class="input-group w-50">
							    <input type="text" id="searchInput" class="form-control"
							           placeholder="Tìm tên sản phẩm (lọc nhanh)...">
							    <button class="btn btn-outline-secondary" type="button">
							        <i class="bi bi-search"></i>
							    </button>
							</div>
						</div>

						<div class="table-responsive bg-white rounded shadow-sm">
							<table class="table table-hover align-middle mb-0">
								<thead class="table-dark">
									<tr>
										<th>ID</th>
										<th>Ảnh</th>
										<th>Tên sản phẩm</th>
										<th>Danh mục</th>
										<th>Giá</th>
										<th>Màu sắc</th>
										<th class="text-center">Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listP}" var="p">
										<tr>
											<td>${p.id}</td>
											<td>
                                                <img src="${pageContext.request.contextPath}/assets/uploaded-images/${p.imageUrl}" 
                                                     alt="img" class="rounded" style="width: 50px; height: 50px; object-fit: cover;">
                                            </td>
											<td><strong>${p.name}</strong></td>
											<td><c:choose>
													<c:when test="${p.categoryId == 1}">
														<span class="badge bg-primary">NAM</span>
													</c:when>
													<c:when test="${p.categoryId == 2}">
														<span class="badge bg-info">NỮ</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-warning text-dark">TRANG SỨC</span>
													</c:otherwise>
												</c:choose></td>
											<td>${p.price}đ</td>
											<td>${p.color}</td>
											<td class="text-center">
												<button class="btn btn-sm btn-info text-white"
													onclick="editProduct('${p.id}', '${p.name}', '${p.price}', '${p.color}', '${p.categoryId}', '${p.typeId}', '${p.size}', '${p.target}', '${p.material}', '${p.imageUrl}', `${p.description}`)">
													<i class="bi bi-pencil"></i>
												</button> <a href="manage-product?action=delete&id=${p.id}"
												class="btn btn-sm btn-danger"
												onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">
													<i class="bi bi-trash"></i>
											</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="card shadow-sm card-form">
							<div class="card-header bg-dark text-white">
								<h5 class="mb-0" id="formTitle">Thêm sản phẩm mới</h5>
							</div>
							<div class="card-body">
                                <form action="${pageContext.request.contextPath}/admin/manage-product" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="productId" id="f_id" value="">
                                    
                                    <div class="mb-3">
                                        <label class="form-label small fw-bold">Ảnh sản phẩm</label>
                                        <input type="file" name="productImage" class="form-control" id="f_image" onchange="previewImg(this)">
                                        <div id="imgPreviewContainer" class="mt-2 text-center" style="display:none;">
                                            <img id="imgPreview" src="" class="img-thumbnail" style="max-height: 150px;">
                                            <p class="small text-muted mt-1">Ảnh hiện tại/mới</p>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label class="form-label small fw-bold">Tên sản phẩm</label> 
                                        <input type="text" name="productName" id="f_name" class="form-control" required>
                                    </div>

									<div class="row">
										<div class="col-md-6 mb-3">
											<label class="form-label small fw-bold">Danh mục
												chính</label> <select class="form-select" name="categoryId"
												id="f_categoryId" onchange="toggleFields(this.value)">
												<option value="1">NAM</option>
												<option value="2">NỮ</option>
												<option value="3">TRANG SỨC</option>
											</select>
										</div>
										<div class="col-md-6 mb-3">
											<label class="form-label small fw-bold">Giá (VNĐ)</label> <input
												type="number" name="price" id="f_price" class="form-control"
												required>
										</div>
									</div>

									<div class="mb-3">
										<label class="form-label small fw-bold">Màu sắc</label> <input
											type="text" name="color" id="f_color" class="form-control">
									</div>

									<div id="fashionFields">
										<div class="mb-3">
											<label class="form-label small fw-bold text-primary">Loại
												trang phục</label> <select class="form-select" name="typeId"
												id="f_typeId_fashion">
												<option value="1">Áo thun</option>
												<option value="2">Áo sơ mi</option>
												<option value="3">Áo khoác</option>
												<option value="4">Quần jean</option>
												<option value="5">Quần tây/Váy</option>
											</select>
										</div>
										<div class="mb-3">
											<label class="form-label small fw-bold text-primary">Kích
												cỡ (Size)</label> <select class="form-select" name="size"
												id="f_size">
												<option value="S">S</option>
												<option value="M">M</option>
												<option value="L">L</option>
												<option value="XL">XL</option>
											</select>
										</div>
									</div>

									<div id="jewelryFields" style="display: none;">
										<div class="mb-3">
											<label class="form-label small fw-bold text-success">Loại
												trang sức</label> <select class="form-select" name="typeId"
												id="f_typeId_jewelry" disabled>
												<option value="1">Nhẫn</option>
												<option value="2">Dây chuyền</option>
												<option value="3">Vòng tay</option>
												<option value="4">Lắc tay</option>
												<option value="5">Bông tai</option>
												<option value="6">Đồng hồ</option>
											</select>
										</div>
										<div class="row">
											<div class="col-6 mb-3">
												<label class="form-label small fw-bold text-success">Đối
													tượng</label> <select class="form-select" name="target"
													id="f_target">
													<option value="NAM">NAM</option>
													<option value="NU">NỮ</option>
													<option value="UNISEX">UNISEX</option>
												</select>
											</div>
											<div class="col-6 mb-3">
											    <label class="form-label small fw-bold text-success">Chất liệu</label>
											    <select name="material" id="f_material" class="form-select">
											        <option value="">-- Chọn chất liệu --</option>
											        <option value="Vàng">Vàng</option>
											        <option value="Bạc">Bạc</option>
											        <option value="Titan">Titan</option>
											        <option value="Thép không gỉ">Thép không gỉ</option>
											        <option value="Đá quý">Đá quý</option>
											    </select>
											</div>
										</div>
									</div>
									
									<div class="mb-3">
									    <label class="form-label small fw-bold">Mô tả sản phẩm</label>
									    <textarea name="description" id="f_description" class="form-control" 
									              rows="3" placeholder="Nhập mô tả ngắn về sản phẩm..."></textarea>
									</div>
									<hr>
									<div class="d-grid gap-2">
										<button type="submit" class="btn btn-primary" id="btnSubmit">Lưu
											sản phẩm</button>
										<button type="button" class="btn btn-light border"
											onclick="resetForm()">Làm mới</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>

	<script>
		// Hàm xem trước ảnh khi chọn file
	    function previewImg(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                document.getElementById('imgPreview').src = e.target.result;
	                document.getElementById('imgPreviewContainer').style.display = 'block';
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	
		// Hàm ẩn hiện các trường nhập liệu
		function toggleFields(categoryId) {
			const fashion = document.getElementById('fashionFields');
		    const jewelry = document.getElementById('jewelryFields');
		    const typeFashion = document.getElementById('f_typeId_fashion');
		    const typeJewelry = document.getElementById('f_typeId_jewelry');
		    if (categoryId == '3') { // TRANG SỨC
		        fashion.style.display = 'none';
		        jewelry.style.display = 'block';
		        typeFashion.disabled = true;  // Vô hiệu hóa để không gửi lên server
		        typeJewelry.disabled = false; // Kích hoạt ô trang sức
		    } else { // NAM hoặc NỮ
		        fashion.style.display = 'block';
		        jewelry.style.display = 'none';
		        typeFashion.disabled = false;
		        typeJewelry.disabled = true;
		    }
		}

		// Hàm điền dữ liệu vào form khi nhấn "Sửa"
		function editProduct(id, name, price, color, catId, typeId, size, target,
				material, imageUrl) {
			document.getElementById('formTitle').innerText = "Cập nhật sản phẩm #"
					+ id;
			document.getElementById('f_id').value = id;
			document.getElementById('f_name').value = name;
			document.getElementById('f_price').value = price;
			document.getElementById('f_color').value = color;
			document.getElementById('f_categoryId').value = catId;
			document.getElementById('f_description').value = desc !== 'undefined' ? desc : "";
			
			toggleFields(catId);
			// Điền typeId vào đúng ô đang hiển thị
		    if (catId == '3') {
		        document.getElementById('f_typeId_jewelry').value = typeId;
		    } else {
		        document.getElementById('f_typeId_fashion').value = typeId;
		    }
			
			document.getElementById('f_size').value = size;
			document.getElementById('f_target').value = target;
			const materialSelect = document.getElementById('f_material');
			materialSelect.value = material;
			
		 	// Hiển thị ảnh cũ để biết đang sửa sản phẩm nào
            if(imageUrl && imageUrl !== 'default.jpg') {
                document.getElementById('imgPreview').src = "${pageContext.request.contextPath}/assets/uploaded-images/" + imageUrl;
                document.getElementById('imgPreviewContainer').style.display = 'block';
            } else {
                document.getElementById('imgPreviewContainer').style.display = 'none';
            }

			document.getElementById('btnSubmit').className = "btn btn-warning";
			document.getElementById('btnSubmit').innerText = "Cập nhật sản phẩm";
		}

		// Hàm reset form về trạng thái "Thêm mới"
		function resetForm() {
			document.getElementById('formTitle').innerText = "Thêm sản phẩm mới";
			document.getElementById('f_id').value = "";
			document.querySelector('form').reset();
			document.getElementById('f_description').value = "";
			// Ẩn preview ảnh khi reset
		    document.getElementById('imgPreviewContainer').style.display = 'none';
		    document.getElementById('imgPreview').src = "";
		   
			toggleFields('1');
			document.getElementById('btnSubmit').className = "btn btn-primary";
			document.getElementById('btnSubmit').innerText = "Lưu sản phẩm";
		}
	</script>
	
	<script>
		document.addEventListener("DOMContentLoaded", function () {
		    const searchInput = document.getElementById("searchInput");
		    const tableRows = document.querySelectorAll("tbody tr");
	
		    searchInput.addEventListener("keyup", function () {
		        const query = searchInput.value.toLowerCase().trim();
	
		        tableRows.forEach((row) => {
		            // Lấy tên sản phẩm ở cột thứ 3 (index 2) hoặc tùy chỉnh theo thứ tự cột của bạn
		            const text = row.innerText.toLowerCase();
	
		            if (text.includes(query)) {
		                row.style.display = ""; // Hiện dòng
		            } else {
		                row.style.display = "none"; // Ẩn dòng
		            }
		        });
		    });
		});
	</script>
</body>
</html>