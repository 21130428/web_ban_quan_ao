<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap"
	rel="stylesheet">
<title>Admin - Add Products</title>
<style>
.admin-form {
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	max-width: 600px;
	margin: 20px auto;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.admin-form h2 {
	text-align: center;
	margin-bottom: 15px;
}

.admin-form input[type="text"], .admin-form input[type="number"],
	.admin-form select, .admin-form textarea {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border-radius: 6px;
	border: 1px solid #ccc;
}

.admin-form button {
	background-color: #3a86ff;
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 8px;
	cursor: pointer;
	transition: 0.2s;
}

.admin-form button:hover {
	background-color: #265dd6;
}

.table-container {
	margin-top: 30px;
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
}

table th, table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

table th {
	background-color: #f5f5f5;
}
</style>
</head>

<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h1 class="logo">Admin Panel</h1>
		<div class="sidebar-menu">
			<a href="../pages-user/index.jsp"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="admin.jsp" class="active"><ion-icon
					name="add-circle-outline"></ion-icon>Add Product</a> <a href="#"><ion-icon
					name="settings-outline"></ion-icon>Manage</a>
		</div>
		<div class="sidebar-logout">
			<a href="../log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main">
		<div class="main-navbar">
			<h2>Admin Dashboard</h2>
		</div>

		<!-- Form -->
		<div class="admin-form">
			<h2>Add New Product</h2>
			<form action="../AddProductServlet" method="post"
				enctype="multipart/form-data">
				<label>Product Name:</label> <input type="text" name="name" required>

				<label>Description:</label>
				<textarea name="description" rows="3" required></textarea>

				<label>Price (VNĐ):</label> <input type="number" name="price"
					required> <label>Category:</label> <select name="category">
					<option value="Female">Female</option>
					<option value="Male">Male</option>
					<option value="Jewelry">Jewelry</option>
				</select> <label>Image File:</label> <input type="file" name="image"
					accept="image/*" required>

				<button type="submit">Add Product</button>
			</form>
		</div>

		<!-- Product Table -->
		<div class="table-container">
			<h2 style="text-align: center;">Product List</h2>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Image</th>
						<th>Name</th>
						<th>Category</th>
						<th>Price</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<%-- Tạm thời hiển thị mẫu. Sau này sẽ lấy từ database --%>
					<tr>
						<td>1</td>
						<td><img
							src="../assets/images/Female/Female_adult/ao-kieu.webp"
							width="60"></td>
						<td>Áo kiểu</td>
						<td>Female</td>
						<td>350.000VNĐ</td>
						<td>Áo kiểu xinh xắn, tao nhã</td>
					</tr>
					<tr>
						<td>2</td>
						<td><img
							src="../assets/images/Male/Male_adult/ao-cardigan.jpg" width="60"></td>
						<td>Áo cardigan</td>
						<td>Male</td>
						<td>250.000VNĐ</td>
						<td>Áo cardigan tinh tế, chỉnh chu</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
