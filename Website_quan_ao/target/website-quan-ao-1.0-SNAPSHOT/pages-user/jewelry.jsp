<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap"
	rel="stylesheet">
<title>Jewelry - Luxury Collection</title>
<style>
.jewelry-theme {
	background: var(--softGreenColor);
}

.jewelry-theme .main-title {
	color: #b2955c; /* màu vàng kim nhẹ */
}

.jewelry-theme .detail-card {
	border: 1px solid #e0d6b9;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Nền trắng cho toàn bộ khu vực sản phẩm Jewelry */
.jewelry-theme .main-detail {
	background-color: var(--whiteColor);
	padding: 2rem;
	border-radius: 12px;
	box-shadow: rgba(0, 0, 0, 0.05) 0 4px 12px;
}
</style>
</head>
<body>
	<!-- sidebar -->
	<div class="sidebar">
		<h1 class="logo">Clothes Website</h1>
		<div class="sidebar-menu">
			<a href="index.jsp"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="clothe.jsp"><ion-icon name="shirt-outline"></ion-icon>Clothes</a>
			<a href="jewelry.jsp"><ion-icon name="diamond-outline"></ion-icon>Jewelry</a>
			<a href="bill.jsp"><ion-icon name="receipt-outline"></ion-icon>Bills</a>
			<a href="bookmark.jsp"><ion-icon name="bookmark-outline"></ion-icon>Bookmarks</a>
			<a href="notification.jsp"><ion-icon name="notifications-outline"></ion-icon>Notifications</a>
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact
				Us</a>
		</div>
		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- main -->
	<div class="main jewelry-theme">
		<!-- main navbar -->
		<div class="main-navbar">
			<ion-icon class="menu-toggle" name="menu-outline"></ion-icon>
			<div class="search">
				<input type="text" placeholder="Search for jewelry pieces">
				<button class="search-btn">Search</button>
			</div>
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>

		<!-- main highlight -->
		<div class="main-highlight">
			<hr class="divider">

			<!-- list of jewelry items -->
			<div class="main-detail">
				<h2 class="main-title">Explore Our Elegant Jewelry</h2>

				<!-- NỀN TRẮNG CHO DANH SÁCH -->
				<div class="detail-container">
					<div class="detail-wrapper">

						<div class="detail-card">
							<img class="detail-img"
								src="../assets/images/Female/Trang_suc_nu/bong-tai.jpeg">
							<div class="detail-desc">
								<div class="detail-name">
									<h4>Bông tai</h4>
									<p class="detail-sub">Vẻ đẹp sang trọng, tinh tế cho mọi
										dịp đặc biệt.</p>
									<p class="price">3.200.000VNĐ</p>
								</div>
								<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
							</div>
						</div>

						<div class="detail-card">
							<img class="detail-img"
								src="../assets/images/Female/Trang_suc_nu/nhan-2.jpg">
							<div class="detail-desc">
								<div class="detail-name">
									<h4>Nhẫn kim cương</h4>
									<p class="detail-sub">Tinh xảo, lấp lánh — biểu tượng của
										sự vĩnh cửu.</p>
									<p class="price">12.000.000VNĐ</p>
								</div>
								<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
							</div>
						</div>

						<div class="detail-card">
							<img class="detail-img"
								src="../assets/images/Female/Trang_suc_nu/bong-tai-2.jpg">
							<div class="detail-desc">
								<div class="detail-name">
									<h4>Bông tai vàng lấp lánh</h4>
									<p class="detail-sub">Thanh lịch và nhẹ nhàng, tôn lên nét
										đẹp tự nhiên.</p>
									<p class="price">4.800.000VNĐ</p>
								</div>
								<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
							</div>
						</div>

						<div class="detail-card">
							<img class="detail-img"
								src="../assets/images/Male/Trang_suc_nam/dong-ho.jpg">
							<div class="detail-desc">
								<div class="detail-name">
									<h4>Đồng hồ cao cấp</h4>
									<p class="detail-sub">Kết hợp giữa công nghệ và thời trang
										hiện đại.</p>
									<p class="price">5.600.000VNĐ</p>
								</div>
								<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
							</div>
						</div>

						<div class="detail-card">
							<img class="detail-img"
								src="../assets/images/Male/Trang_suc_nam/day-chuyen.jpg">
							<div class="detail-desc">
								<div class="detail-name">
									<h4>Lắc tay bạc Ý</h4>
									<p class="detail-sub">Thiết kế tinh tế, phù hợp với mọi
										phong cách.</p>
									<p class="price">1.200.000VNĐ</p>
								</div>
								<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
							</div>
						</div>

						<div class="detail-card">
							<img class="detail-img"
								src="../assets/images/Male/Trang_suc_nam/kep-ca-vat.jpg">
							<div class="detail-desc">
								<div class="detail-name">
									<h4>Kẹp cà vạt</h4>
									<p class="detail-sub">Sự lựa chọn hoàn hảo cho những buổi
										tiệc sang trọng.</p>
									<p class="price">9.800.000VNĐ</p>
								</div>
								<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
							</div>
						</div>

					</div>
				</div>
				<!-- end detail-wrapper -->
			</div>
			<!-- end detail-container -->
		</div>
		<!-- end main-detail -->

		<script type="module"
			src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
		<script nomodule
			src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

		<script>
  document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.querySelector(".search input");
    const searchBtn = document.querySelector(".search-btn");
    const detailWrapper = document.querySelector(".detail-wrapper"); // nơi chứa các thẻ sản phẩm
    const detailCards = Array.from(document.querySelectorAll(".detail-card"));

    function filterItems() {
      const keyword = searchInput.value.toLowerCase().trim();

      if (keyword === "") {
        // Nếu không nhập gì → hiện lại tất cả sản phẩm, đúng thứ tự ban đầu
        detailWrapper.innerHTML = "";
        detailCards.forEach(card => {
          card.style.display = "block";
          detailWrapper.appendChild(card);
        });
        return;
      }

      const matched = [];
      const unmatched = [];

      // Phân loại các sản phẩm
      detailCards.forEach(card => {
        const title = card.querySelector("h4").textContent.toLowerCase();
        const desc = card.querySelector(".detail-sub").textContent.toLowerCase();

        if (title.includes(keyword) || desc.includes(keyword)) {
          card.style.display = "block";
          matched.push(card);
        } else {
          card.style.display = "none";
          unmatched.push(card);
        }
      });

      // Dồn sản phẩm trùng lên trên
      detailWrapper.innerHTML = "";
      matched.forEach(card => detailWrapper.appendChild(card));
      unmatched.forEach(card => detailWrapper.appendChild(card));
    }

    // Khi nhấn Search hoặc Enter
    searchBtn.addEventListener("click", filterItems);
    searchInput.addEventListener("keyup", e => {
      if (e.key === "Enter") filterItems();
      // Hoặc lọc ngay khi đang gõ thì bỏ comment dòng dưới:
      // filterItems();
    });
  });
</script>
</body>
</html>
