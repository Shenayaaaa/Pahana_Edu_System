<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Pahana Education Bookshop</title>
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
            --surface-white: #ffffff;
            --surface-light: #f8f9fe;
            --text-dark: #2d1b4e;
            --text-muted: #6c757d;
            --shadow-light: rgba(106, 76, 147, 0.1);
            --shadow-medium: rgba(106, 76, 147, 0.3);
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

        .register-card {
            backdrop-filter: var(--blur-effect);
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .register-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-purple), var(--light-purple), var(--accent-purple));
        }

        .register-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px var(--shadow-medium);
        }

        .brand-logo {
            background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 3rem;
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

        .form-control, .form-select {
            border-radius: 12px;
            border: 2px solid var(--border-light);
            padding: 0.75rem 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            background: var(--surface-white);
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-purple);
            box-shadow: 0 0 0 4px rgba(106, 76, 147, 0.1);
            background: var(--surface-white);
        }

        .form-control::placeholder {
            color: var(--text-muted);
            font-weight: 400;
        }

        .form-control.is-invalid {
            border-color: #dc3545;
            box-shadow: 0 0 0 4px rgba(220, 53, 69, 0.1);
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .form-text {
            color: var(--text-muted);
            font-size: 0.875rem;
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

        .btn-outline-primary {
            border: 2px solid var(--primary-purple);
            color: var(--primary-purple);
            background: transparent;
            backdrop-filter: var(--blur-effect);
        }

        .btn-outline-primary:hover {
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

        .alert-success {
            background: linear-gradient(135deg, rgba(40, 167, 69, 0.1) 0%, rgba(34, 139, 34, 0.1) 100%);
            color: #155724;
            border-left: 4px solid #28a745;
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(220, 53, 69, 0.1) 0%, rgba(231, 76, 60, 0.1) 100%);
            color: #b91c1c;
            border-left: 4px solid #dc3545;
        }

        .invalid-feedback {
            display: block;
            color: #dc3545;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .card-body {
            padding: 3rem !important;
        }

        .fas {
            margin-right: 0.5rem;
        }

        /* Animation for smooth entrance */
        .register-card {
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
        .form-control:focus,
        .form-select:focus {
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
        <div class="col-md-6 col-lg-5">
            <div class="card register-card">
                <div class="card-body p-5">
                    <div class="text-center mb-4">
                        <i class="fas fa-star brand-logo"></i>
                        <h2 class="fw-bold text-primary">Create Account</h2>
                        <p class="text-muted">Register Here!!</p>
                    </div>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                                ${errorMessage}
                        </div>
                    </c:if>

                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">
                                ${successMessage}
                        </div>
                    </c:if>

                    <form method="post" action="${pageContext.request.contextPath}/register" id="registerForm">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">
                                <i class="fas fa-address-card"></i> Full Name
                            </label>
                            <input type="text" class="form-control" id="fullName" name="fullName"
                                   required placeholder="Enter your full name" value="${param.fullName}">
                        </div>

                        <div class="mb-3">
                            <label for="username" class="form-label">
                                <i class="fas fa-at"></i> Username
                            </label>
                            <input type="text" class="form-control" id="username" name="username"
                                   required placeholder="Choose a username" value="${param.username}">
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">
                                <i class="fas fa-paper-plane"></i> Email
                            </label>
                            <input type="email" class="form-control" id="email" name="email"
                                   required placeholder="Enter your email" value="${param.email}">
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">
                                <i class="fas fa-crown"></i> Role
                            </label>
                            <select class="form-select" id="role" name="role" required>
                                <option value="">Select Role</option>
                                <option value="STAFF" ${param.role == 'STAFF' ? 'selected' : ''}>Staff Member</option>
                                <!-- Only show ADMIN option if current user is admin or during initial setup -->
                                <c:if test="${empty sessionScope.user or sessionScope.userRole == 'ADMIN'}">
                                    <option value="ADMIN" ${param.role == 'ADMIN' ? 'selected' : ''}>Administrator</option>
                                </c:if>
                            </select>
                            <small class="form-text text-muted">
                                Choose the appropriate role for this account
                            </small>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">
                                <i class="fas fa-shield-alt"></i> Password
                            </label>
                            <input type="password" class="form-control" id="password" name="password"
                                   required placeholder="Create a password" minlength="6">
                            <small class="form-text text-muted">Password must be at least 6 characters long</small>
                        </div>

                        <div class="mb-4">
                            <label for="confirmPassword" class="form-label">
                                <i class="fas fa-check-double"></i> Confirm Password
                            </label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                                   required placeholder="Confirm your password">
                            <div class="invalid-feedback">
                                <%--                                Passwords do not match--%>
                            </div>
                        </div>

                        <div class="d-grid mb-3">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="fas fa-magic"></i> Create Account
                            </button>
                        </div>
                    </form>

                    <div class="text-center">
                        <p class="text-muted">Already have an account?</p>
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary">
                            <i class="fas fa-door-open"></i> Login Here
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Password confirmation validation
    document.getElementById('registerForm').addEventListener('submit', function(e) {
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            e.preventDefault();
            document.getElementById('confirmPassword').classList.add('is-invalid');
        } else {
            document.getElementById('confirmPassword').classList.remove('is-invalid');
        }
    });

    // Real-time password matching feedback
    document.getElementById('confirmPassword').addEventListener('input', function() {
        const password = document.getElementById('password').value;
        const confirmPassword = this.value;

        if (confirmPassword && password !== confirmPassword) {
            this.classList.add('is-invalid');
        } else {
            this.classList.remove('is-invalid');
        }
    });
</script>
</body>
</html>