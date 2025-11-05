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
<title>Notifications - Luxury Clothes Store</title>
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
			<a href="notification.jsp"><ion-icon name="notifications-outline"></ion-icon>Notification</a>
			<a href="contact.jsp"><ion-icon name="chatbubbles-outline"></ion-icon>Contact
				Us</a>
		</div>

		<div class="sidebar-logout">
			<a href="log-in.jsp"><ion-icon name="log-out-outline"></ion-icon>Logout</a>
		</div>
	</div>

	<!-- main -->
	<div class="main">
		<!-- main navbar -->
		<div class="main-navbar">
			<ion-icon class="menu-toggle" name="menu-outline"></ion-icon>
			<div class="search">
				<input type="text" placeholder="Search notification...">
				<button class="search-btn">Search</button>
			</div>
			<div class="profile">
				<a class="cart" href="cart.jsp"><ion-icon name="cart-outline"></ion-icon></a>
				<a class="user" href="#"><ion-icon name="person-outline"></ion-icon></a>
			</div>
		</div>

		<!-- main content -->
		<div class="main-content">
			<h2 class="main-title">Thông báo của bạn</h2>
			<p class="notification-desc">Cập nhật mới nhất về đơn hàng,
				khuyến mãi, sự kiện và các thông báo mới nhất từ cửa hàng.</p>

			<div class="notification-container">

				<!-- Thông báo vận chuyển -->
				<div class="notification-card shipping">
					<ion-icon name="cube-outline" class="notify-icon"></ion-icon>
					<div class="notify-text">
						<h3>Đơn hàng #INV00123 đang được vận chuyển</h3>
						<p>
							Dự kiến giao vào ngày <strong>20/10/2025</strong>. Vui lòng giữ
							điện thoại để nhận hàng.
						</p>
					</div>
					<span class="notify-time">2 giờ trước</span>
				</div>

				<!-- Thông báo khuyến mãi -->
				<div class="notification-card promo">
					<ion-icon name="pricetags-outline" class="notify-icon"></ion-icon>
					<div class="notify-text">
						<h3>🔥 Giảm giá 40% cho toàn bộ áo khoác mùa đông!</h3>
						<p>
							Chương trình kéo dài đến hết ngày <strong>25/10/2025</strong>.
							Mua ngay để nhận ưu đãi.
						</p>
					</div>
					<span class="notify-time">Hôm nay</span>
				</div>

				<!-- Gợi ý sản phẩm -->
				<div class="notification-card suggestion">
					<ion-icon name="sparkles-outline" class="notify-icon"></ion-icon>
					<div class="notify-text">
						<h3>Gợi ý dành riêng cho bạn 💡</h3>
						<p>
							Dựa trên lịch sử mua hàng, bạn có thể thích <strong>áo
								thun basic</strong> mới ra mắt tuần này.
						</p>
					</div>
					<span class="notify-time">Hôm qua</span>
				</div>

				<!-- Sự cố hoặc thông tin -->
				<div class="notification-card alert">
					<ion-icon name="alert-circle-outline" class="notify-icon"></ion-icon>
					<div class="notify-text">
						<h3>Thông báo hệ thống</h3>
						<p>
							Cửa hàng sẽ tạm bảo trì vào lúc <strong>22:00 hôm nay</strong> để
							nâng cấp trải nghiệm.
						</p>
					</div>
					<span class="notify-time">3 giờ trước</span>
				</div>

				<!-- Sự cố hoặc thông tin -->
				<div class="notification-card alert">
					<ion-icon name="cube-outline" class="notify-icon"></ion-icon>
					<div class="notify-text">
						<h3>Đơn hàng #INV00123 đã đến nơi!</h3>
						<p>
							Đơn hàng đã được giao vào lúc <strong>13:30 hôm nay</strong> tại
							địa chỉ của bạn.
						</p>
					</div>
					<span class="notify-time">15 phút trước</span>
				</div>

			</div>
		</div>
	</div>

	<script type="module"
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

	<script>
  document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.querySelector(".search input");
    const searchBtn = document.querySelector(".search-btn");
    const notifyContainer = document.querySelector(".notification-container");
    const notifyCards = Array.from(document.querySelectorAll(".notification-card"));

    function filterNotifications() {
      const keyword = searchInput.value.toLowerCase().trim();

      if (keyword === "") {
        // Nếu không nhập gì -> hiển thị lại tất cả thông báo theo thứ tự ban đầu
        notifyContainer.innerHTML = "";
        notifyCards.forEach(card => {
          card.style.display = "flex";
          notifyContainer.appendChild(card);
        });
        return;
      }

      const matched = [];
      const unmatched = [];

      // Lọc và chia nhóm thông báo
      notifyCards.forEach(card => {
        const title = card.querySelector("h3").textContent.toLowerCase();
        const desc = card.querySelector("p").textContent.toLowerCase();

        if (title.includes(keyword) || desc.includes(keyword)) {
          card.style.display = "flex";
          matched.push(card);
        } else {
          card.style.display = "none";
          unmatched.push(card);
        }
      });

      // Dồn thông báo trùng khớp lên trên
      notifyContainer.innerHTML = "";
      matched.forEach(card => notifyContainer.appendChild(card));
      unmatched.forEach(card => notifyContainer.appendChild(card));
    }

    // Khi nhấn nút hoặc Enter
    searchBtn.addEventListener("click", filterNotifications);
    searchInput.addEventListener("keyup", e => {
      if (e.key === "Enter") filterNotifications();
      // Nếu muốn lọc ngay khi đang gõ, bật dòng dưới:
      // filterNotifications();
    });
  });
</script>

	<script src="../assets/js/app.js"></script>
</body>
</html>
