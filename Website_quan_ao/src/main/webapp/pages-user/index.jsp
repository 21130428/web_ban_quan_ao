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
<title>Luxury clothes store</title>
</head>
<body>
	<!-- sidebar -->
	<div class="sidebar">
		<!-- Logo -->
		<h1 class="logo">Clothes Website</h1>

		<!-- List of menus -->
		<div class="sidebar-menu">
			<a href="index.jsp" class="active"><ion-icon name="home-outline"></ion-icon>Home</a>
			<a href="clothe.jsp"><ion-icon name="shirt-outline"></ion-icon>Clothes</a>
			<a href="jewelry.jsp"><ion-icon name="diamond-outline"></ion-icon>Jewelry</a>
			<a href="bill.jsp"><ion-icon name="receipt-outline"></ion-icon>Bills</a> 
			<a href="bookmark.jsp"><ion-icon name="bookmark-outline"></ion-icon>Bookmarks</a> 
			<a href="notification.jsp"><ion-icon name="notifications-outline"></ion-icon>Notifications</a>
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact Us</a>
		</div>

		<!-- Logout  -->
		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- main -->
	<div class="main">
		<!-- main navbar -->
		<div class="main-navbar">
			<!-- menu appear when mobile version -->
			<ion-icon class="menu-toggle" name="menu-outline"></ion-icon>
			<!-- search bar -->
			<div class="search">
				<input type="text" placeholder="Search for your favourite clothes">
				<button class="search-btn">Search</button>
			</div>
			<!-- profile icon on left side of navbar -->
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>
		<!-- main highlight -->
		<div class="main-highlight">
			<!-- title section and arrow -->
			<div class="main-header">
				<h2 class="main-title">Recommendations</h2>
				<div class="main-arrow">
					<ion-icon class="back" name="chevron-back-circle-outline"></ion-icon>
					<ion-icon class="next" name="chevron-forward-circle-outline"></ion-icon>
				</div>
			</div>
			<!-- highlight menu -->
			<div class="highlight-wrapper">
				<div class="highlight-card">
					<img class="highlight-img"
						src="../assets/images/Female/Female_adult/ao-2-day.jpg">
					<div class="highlight-desc">
						<h4>Áo 2 dây</h4>
						<p>300.000VNĐ</p>
					</div>
				</div>
				<div class="highlight-card">
					<img class="highlight-img"
						src="../assets/images/Female/Female_adult/ao-kieu-2.jpg">
					<div class="highlight-desc">
						<h4>Áo kiểu</h4>
						<p>250.000VNĐ</p>
					</div>
				</div>
				<div class="highlight-card">
					<img class="highlight-img"
						src="../assets/images/Female/Female_adult/dam-du-tiec-2.jpg">
					<div class="highlight-desc">
						<h4>Đầm dự tiệc</h4>
						<p>1.500.000VNĐ</p>
					</div>
				</div>
				<div class="highlight-card">
					<img class="highlight-img"
						src="../assets/images/Male/Male_adult/ao-cardigan.jpg">
					<div class="highlight-desc">
						<h4>Áo cardigan</h4>
						<p>250.000VNĐ</p>
					</div>
				</div>
			</div>
		</div>
		<!-- main menus / order -->
		<div class="main-menu">
			<!-- filter section -->
		</div>
		<hr class="divider">
		<!-- list of clothes menus -->
		<div class="main-detail">
			<h2 class="main-title">Choose your favourite one</h2>
			<div class="detail-wrapper">
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Female/Female_kid/ao-so-mi-2.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Áo sơ mi</h4>
							<p class="detail-sub">Áo sơ mi xinh xắn, chỉnh chu cho các bé
								gái</p>
							<p class="price">220.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Female/Female_kid/dam-cong-chua.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Đầm công chúa</h4>
							<p class="detail-sub">Chiếc đầm tuyệt đẹp, lộng lẫy như các
								nàng công chúa trong truyện cổ tích.</p>
							<p class="price">450.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Male/Male_teenager/ao-khoac-2.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Áo khoác</h4>
							<p class="detail-sub">Áo khoác đen phong cách dành cho các
								bạn trai tuổi teen</p>
							<p class="price">250.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Male/Male_adult/ao-cardigan.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Áo cardigan</h4>
							<p class="detail-sub">Áo cardigan tinh tế, chỉnh chu thích
								hợp cho cả công việc và mặc thường</p>
							<p class="price">680.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Male/Male_adult/ao-vest-2.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Bộ đồ vest</h4>
							<p class="detail-sub">Bộ đồ vest nghiêm trang khoác lên cho
								mình sự đẳng cấp và tự tin</p>
							<p class="price">2.500.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Female/Female_adult/ao-kieu.webp">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Áo kiểu</h4>
							<p class="detail-sub">Áo kiểu xinh xắn, tao nhã</p>
							<p class="price">350.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Female/Female_adult/dam-du-tiec.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Đầm dự tiệc</h4>
							<p class="detail-sub">Bộ đầm lộng lẫy thích hợp cho các dịp
								dạ hội</p>
							<p class="price">1.500.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>
				<div class="detail-card">
					<img class="detail-img"
						src="../assets/images/Male/Male_kid/ao-polo-2.jpg">
					<div class="detail-desc">
						<div class="detail-name">
							<h4>Áo polo</h4>
							<p class="detail-sub">Áo polo xinh xắn, dễ thương cho các bé
								trai dưới 3 tuổi</p>
							<p class="price">220.000VNĐ</p>
						</div>
						<ion-icon class="detail-favourite" name="bookmark-outline"></ion-icon>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
<!--adding javascript  -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.querySelector(".search input");
    const searchBtn = document.querySelector(".search-btn");
    const detailWrapper = document.querySelector(".detail-wrapper"); // nơi chứa các sản phẩm
    const detailCards = Array.from(document.querySelectorAll(".detail-card"));

    function filterItems() {
      const keyword = searchInput.value.toLowerCase().trim();

      if (keyword === "") {
        // Nếu không nhập gì → hiển thị tất cả, giữ nguyên thứ tự
        detailCards.forEach(card => card.style.display = "block");
        return;
      }

      const matched = [];
      const unmatched = [];

      // Phân loại sản phẩm
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

      // Dồn sản phẩm khớp lên đầu
      detailWrapper.innerHTML = ""; // Xóa danh sách cũ
      matched.forEach(card => detailWrapper.appendChild(card));
      unmatched.forEach(card => detailWrapper.appendChild(card));
    }

    // Khi nhấn nút Search hoặc Enter
    searchBtn.addEventListener("click", filterItems);
    searchInput.addEventListener("keyup", e => {
      if (e.key === "Enter") filterItems();
      // Hoặc lọc ngay khi đang gõ:
      // filterItems();
    });
  });
</script>

<script src="../assets/js/app.js"></script>
</html>