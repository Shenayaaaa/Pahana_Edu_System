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
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --primary-purple: #6a4c93;
      --dark-purple: #4a306d;
      --light-purple: #8e7cc3;
      --accent-purple: #9d8df1;
      --subtle-purple: #f0ecff;
      --gradient-start: #6a4c93;
      --gradient-end: #8e7cc3;
      --gradient-bg-start: #667eea;
      --gradient-bg-end: #764ba2;
      --surface-white: #ffffff;
      --surface-light: #f8f9fe;
      --text-dark: #2d1b4e;
      --text-muted: #6c757d;
      --shadow-light: rgba(106, 76, 147, 0.1);
      --shadow-medium: rgba(106, 76, 147, 0.3);
      --shadow-card: rgba(31, 38, 135, 0.37);
      --border-light: #e5e1f7;
      --card-shadow: 0 15px 35px var(--shadow-medium);
      --border-radius: 20px;
      --blur-effect: blur(15px);
    }

    * {
      font-family: 'Inter', sans-serif;
    }

    body {
      background: linear-gradient(135deg, var(--primary-purple) 0%, var(--light-purple) 50%, var(--accent-purple) 100%);
      background-attachment: fixed;
      min-height: 100vh;
      display: flex;
      align-items: center;
      position: relative;
      overflow-x: hidden;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background-image:
              radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
              radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
              radial-gradient(circle at 40% 40%, rgba(157, 141, 241, 0.2) 0%, transparent 50%);
      pointer-events: none;
    }

    .login-card {
      backdrop-filter: var(--blur-effect);
      background: rgba(255, 255, 255, 0.95);
      border-radius: var(--border-radius);
      box-shadow: var(--card-shadow);
      border: 1px solid rgba(255, 255, 255, 0.2);
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .login-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, var(--primary-purple), var(--light-purple), var(--accent-purple));
    }

    .login-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px var(--shadow-medium);
    }

    .brand-logo {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      font-size: 3.5rem;
      margin-bottom: 1rem;
      text-shadow: 0 4px 8px var(--shadow-light);
    }

    h2 {
      background: linear-gradient(135deg, var(--text-dark), var(--primary-purple));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      font-weight: 700;
      letter-spacing: -0.5px;
    }

    .text-primary {
      color: var(--primary-purple) !important;
    }

    .text-muted {
      color: var(--text-muted) !important;
      font-weight: 500;
    }

    .form-control {
      border-radius: 12px;
      border: 2px solid var(--border-light);
      padding: 0.75rem 1rem;
      font-weight: 500;
      transition: all 0.3s ease;
      background: var(--surface-white);
    }

    .form-control:focus {
      border-color: var(--primary-purple);
      box-shadow: 0 0 0 4px rgba(106, 76, 147, 0.1);
      background: var(--surface-white);
    }

    .form-control::placeholder {
      color: var(--text-muted);
      font-weight: 400;
    }

    .form-label {
      font-weight: 600;
      color: var(--text-dark);
      margin-bottom: 0.5rem;
    }

    .btn {
      border-radius: 12px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      transition: all 0.3s ease;
      border: none;
    }

    .btn-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      padding: 0.75rem;
      box-shadow: 0 4px 15px var(--shadow-light);
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px var(--shadow-medium);
      background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
    }

    .btn-outline-secondary {
      border: 2px solid var(--border-light);
      color: var(--text-dark);
      background: transparent;
      backdrop-filter: var(--blur-effect);
    }

    .btn-outline-secondary:hover {
      background: var(--primary-purple);
      border-color: var(--primary-purple);
      color: white;
      transform: translateY(-2px);
    }

    .alert {
      border: none;
      border-radius: 12px;
      font-weight: 500;
      backdrop-filter: var(--blur-effect);
    }

    .alert-info {
      background: linear-gradient(135deg, rgba(23, 162, 184, 0.1) 0%, rgba(32, 201, 151, 0.1) 100%);
      color: #0c5460;
      border-left: 4px solid #17a2b8;
    }

    .alert-danger {
      background: linear-gradient(135deg, rgba(220, 53, 69, 0.1) 0%, rgba(231, 76, 60, 0.1) 100%);
      color: #b91c1c;
      border-left: 4px solid #dc3545;
    }

    .card-body {
      padding: 3rem !important;
    }

    hr {
      border-color: var(--border-light);
      opacity: 0.3;
    }

    .fas {
      margin-right: 0.5rem;
    }

    /* Animation for smooth entrance */
    .login-card {
      animation: slideInUp 0.6s ease-out;
    }

    @keyframes slideInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Mobile responsiveness */
    @media (max-width: 768px) {
      .card-body {
        padding: 2rem !important;
      }

      .brand-logo {
        font-size: 2.5rem;
      }

      body {
        padding: 1rem;
      }
    }

    /* Focus states for better accessibility */
    .btn:focus,
    .form-control:focus {
      outline: none;
    }

    /* Improve text readability */
    p {
      line-height: 1.6;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-6 col-lg-4">
      <div class="card login-card">
        <div class="card-body p-5">
          <div class="text-center mb-4">
            <i class="fas fa-gem brand-logo"></i>
            <h2 class="fw-bold text-primary">Pahana Edu Book Store</h2>
            <p class="text-muted">Login Here</p>
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
                <i class="fas fa-id-card"></i> Username
              </label>
              <input type="text" class="form-control" id="username" name="username"
                     required autofocus placeholder="Enter your username">
            </div>

            <div class="mb-4">
              <label for="password" class="form-label">
                <i class="fas fa-key"></i> Password
              </label>
              <input type="password" class="form-control" id="password" name="password"
                     required placeholder="Enter your password">
            </div>

            <div class="d-grid">
              <button type="submit" class="btn btn-primary btn-lg">
                <i class="fas fa-rocket"></i> Login
              </button>
            </div>
          </form>

          <div class="text-center mt-3">
            <p class="text-muted">Don't have an account?</p>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-secondary">
              <i class="fas fa-user-check"></i> Create Account
            </a>
          </div>

          <hr class="my-4">

        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>