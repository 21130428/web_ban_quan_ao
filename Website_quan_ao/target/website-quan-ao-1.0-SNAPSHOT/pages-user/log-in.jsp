<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        body {
            height: 100vh;
            background: linear-gradient(135deg, #111111, #d4af37);
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: 'Open Sans', sans-serif;
        }

        .login-container {
            width: 400px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 8px 24px rgba(0,0,0,0.2);
        }

        .login-container h2 {
            text-align: center;
            color: var(--primaryColor);
            margin-bottom: 1.5rem;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .login-container input {
            padding: 12px;
            border-radius: 8px;
            border: 1px solid var(--darkGreyColor);
            font-size: 16px;
            transition: 0.3s;
        }

        .login-container input:focus {
            border-color: var(--secondaryColor);
            box-shadow: 0 0 8px rgba(212,175,55,0.4);
        }

        .login-container .search-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: var(--secondaryColor);
            color: var(--whiteColor);
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-container .search-btn:hover {
            background-color: var(--primaryColor);
        }

        .login-container p {
            text-align: center;
            margin-top: 1rem;
        }

        .login-container a {
            color: var(--secondaryColor);
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Đăng nhập</h2>
        <form action="checkLogin.jsp" method="post">
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <button type="submit" class="search-btn">Đăng nhập</button>
        </form>
        <p>Bạn chưa có tài khoản? <a href="sign-up.jsp">Đăng ký ngay</a></p>
    </div>
</body>
</html>
