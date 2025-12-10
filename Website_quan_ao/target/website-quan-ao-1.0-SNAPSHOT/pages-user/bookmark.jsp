<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../assets/css/style.css">
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet">
<title>Bookmarks - Luxury Clothes Store</title>
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<h1 class="logo">Clothes Website</h1>

		<div class="sidebar-menu">
			<a href="index.jsp"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="clothe.jsp"><ion-icon name="shirt-outline"></ion-icon>Clothes</a>
			<a href="jewelry.jsp"><ion-icon name="diamond-outline"></ion-icon>Jewelry</a>
			<a href="bill.jsp"><ion-icon name="receipt-outline"></ion-icon>Bills</a>
			<a href="bookmark.jsp"><ion-icon name="bookmark-outline"></ion-icon>Bookmarks</a>
			<a href="notification.jsp"><ion-icon name="notifications-outline"></ion-icon>Notification</a>
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact
				Us</a>
		</div>

		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- Main -->
	<div class="main">
		<!-- Navbar -->
		<div class="main-navbar">
			<ion-icon class="menu-toggle" name="menu-outline"></ion-icon>
			<div class="search">
				<input type="text" placeholder="Search your bookmarks">
				<button class="search-btn">Search</button>
			</div>
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>

		<!-- Main Bookmarks -->
		<div class="main-highlight">
			<div class="main-header">
				<h2 class="main-title">Your Saved Clothes</h2>
				<p class="subtitle">Here are all the clothes you have marked as
					favourites.</p>
			</div>

			<!-- Bookmark grid -->
			<div class="detail-wrapper">
				<!-- Example product card -->
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Female/Female_adult/dam-du-tiec-2.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Đầm dự tiệc</h4>
							<p class="detail-sub">Bộ đầm lộng lẫy thích hợp cho các dịp
								dạ hội.</p>
							<p class="price">1.500.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark"></ion-icon>
					</div>
					<div class="bookmark-action">
						<button class="add-to-cart">Add to Cart</button>
						<button class="remove-bookmark">Remove</button>
					</div>
				</div>

				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Male/Male_adult/ao-cardigan.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Áo cardigan</h4>
							<p class="detail-sub">Áo cardigan tinh tế, thích hợp cho cả
								công việc và mặc thường.</p>
							<p class="price">680.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark"></ion-icon>
					</div>
					<div class="bookmark-action">
						<button class="add-to-cart">Add to Cart</button>
						<button class="remove-bookmark">Remove</button>
					</div>
				</div>

				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Female/Female_kid/dam-cong-chua.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Đầm công chúa</h4>
							<p class="detail-sub">Chiếc đầm tuyệt đẹp, lộng lẫy như công
								chúa.</p>
							<p class="price">450.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark"></ion-icon>
					</div>
					<div class="bookmark-action">
						<button class="add-to-cart">Add to Cart</button>
						<button class="remove-bookmark">Remove</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Icons and scripts -->
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
