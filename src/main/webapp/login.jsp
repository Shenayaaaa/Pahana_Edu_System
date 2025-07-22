<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pahana Education Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(180deg, #0f2027, #203a43, #2c5364);
            color: #ffffff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            padding: 2.5rem 2rem;
            width: 100%;
            max-width: 400px;
            color: #fff;
        }

        .brand-logo {
            font-size: 2.5rem;
            color: #00bcd4;
        }

        .form-label {
            color: #ddd;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 10px;
            color: #fff;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            box-shadow: none;
        }

        .btn-primary {
            background-color: #00bcd4;
            border: none;
        }

        .btn-outline-secondary {
            color: #ccc;
            border-color: #555;
        }

        .btn-outline-secondary:hover {
            background-color: #555;
            color: #fff;
        }

        .alert {
            border-radius: 10px;
        }

        .text-muted {
            color: #aaa !important;
        }

        hr {
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        small {
            color: #ccc;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="text-center mb-4">
        <i class="fas fa-book brand-logo"></i>
        <h2 class="fw-bold mt-2">Pahana Education</h2>
        <p class="text-muted">Bookshop Management System</p>
    </div>

    <c:if test="${not empty param.message}">
        <div class="alert alert-info">
            <c:choose>
                <c:when test="${param.message == 'logged-out'}">You have been logged out successfully.</c:when>
                <c:when test="${param.message == 'registration-success'}">Account created successfully! Please login with your credentials.</c:when>
                <c:otherwise>${param.message}</c:otherwise>
            </c:choose>
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
                ${errorMessage}
        </div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="mb-3">
            <label for="username" class="form-label">
                <i class="fas fa-user"></i> Username
            </label>
            <input type="text" class="form-control" id="username" name="username"
                   required autofocus placeholder="Enter your username">
        </div>

        <div class="mb-4">
            <label for="password" class="form-label">
                <i class="fas fa-lock"></i> Password
            </label>
            <input type="password" class="form-control" id="password" name="password"
                   required placeholder="Enter your password">
        </div>

        <div class="d-grid mb-3">
            <button type="submit" class="btn btn-primary btn-lg">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
        </div>
    </form>

    <div class="text-center">
        <p class="text-muted mb-1">Don't have an account?</p>
        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-secondary btn-sm">
            <i class="fas fa-user-plus"></i> Create Account
        </a>
    </div>

    <hr class="my-4">

    <div class="text-center mt-3">
        <small>Demo: admin/admin123 or user/user123</small>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
