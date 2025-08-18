<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Pahana Education</title>
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
            --shadow-medium: rgba(106, 76, 147, 0.2);
            --border-light: #e5e1f7;
            --card-shadow: 0 10px 30px var(--shadow-light);
            --card-hover-shadow: 0 20px 40px var(--shadow-medium);
            --border-radius: 15px;
        }

        * {
            font-family: 'Inter', sans-serif;
        }

        body {
            background: linear-gradient(135deg, var(--surface-light) 0%, var(--subtle-purple) 100%);
            min-height: 100vh;
            color: var(--text-dark);
        }

        .navbar {
            background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
            box-shadow: 0 4px 20px var(--shadow-light);
        }

        .navbar-brand {
            font-weight: 700;
            color: white !important;
        }

        .navbar-text {
            color: rgba(255, 255, 255, 0.9) !important;
        }

        .card {
            background: var(--surface-white);
            border-radius: var(--border-radius);
            border: none;
            box-shadow: var(--card-shadow);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-2px);
            box-shadow: var(--card-hover-shadow);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
            color: white;
            border: none;
            font-weight: 600;
            border-radius: var(--border-radius) var(--border-radius) 0 0 !important;
        }

        .card-body {
            padding: 2rem;
        }

        .form-control, .form-select {
            border-radius: 10px;
            border: 2px solid var(--border-light);
            transition: all 0.3s ease;
            color: var(--text-dark);
            padding: 0.75rem 1rem;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--primary-purple);
            box-shadow: 0 0 0 3px rgba(106, 76, 147, 0.1);
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .btn {
            border-radius: 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            border: none;
            padding: 0.75rem 1.5rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
            box-shadow: 0 4px 15px var(--shadow-light);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px var(--shadow-medium);
        }

        .btn-outline-light {
            border: 2px solid rgba(255, 255, 255, 0.7);
            color: rgba(255, 255, 255, 0.9);
            background: transparent;
        }

        .btn-outline-light:hover {
            background: white;
            color: var(--primary-purple);
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: linear-gradient(135deg, var(--text-muted), #5a6268);
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
        }

        .alert {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(220, 53, 69, 0.1) 0%, rgba(231, 76, 60, 0.1) 100%);
            border-left: 4px solid #dc3545;
            color: #b91c1c;
        }

        .alert-info {
            background: linear-gradient(135deg, rgba(23, 162, 184, 0.1) 0%, rgba(32, 201, 151, 0.1) 100%);
            border-left: 4px solid #17a2b8;
            color: #0c5460;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        .bg-dark {
            background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
        }

        .form-text {
            color: var(--text-muted);
            font-size: 0.875rem;
        }

        .form-check-input {
            border: 2px solid var(--border-light);
            border-radius: 5px;
        }

        .form-check-input:checked {
            background-color: var(--primary-purple);
            border-color: var(--primary-purple);
        }

        .form-check-input:focus {
            border-color: var(--primary-purple);
            box-shadow: 0 0 0 3px rgba(106, 76, 147, 0.1);
        }

        .form-check-label {
            font-weight: 600;
            color: var(--text-dark);
        }

        @media (max-width: 768px) {
            .card-body {
                padding: 1.5rem;
            }

            .btn {
                margin: 0.25rem;
                padding: 0.5rem 1rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">
            <i class="fas fa-graduation-cap"></i> Pahana Education
        </a>
        <div class="navbar-nav ms-auto">
            <span class="navbar-text me-3">
                Hello, ${sessionScope.currentUser.fullName}! (${sessionScope.userRole})
            </span>
            <a href="${pageContext.request.contextPath}/customers" class="btn btn-outline-light me-2">
                <i class="fas fa-arrow-left"></i> Back to Customers
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0"><i class="fas fa-user-plus"></i> Add New Customer</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                        </div>
                    </c:if>

                    <form method="POST" action="${pageContext.request.contextPath}/customers/add">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="name" name="name"
                                   value="${param.name}" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
                            <input type="email" class="form-control" id="email" name="email"
                                   value="${param.email}" required>
                            <div class="form-text">We'll use this for communication and receipts</div>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone"
                                   value="${param.phone}" placeholder="e.g., +1-555-123-4567">
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3"
                                      placeholder="Street address, city, state, postal code">${param.address}</textarea>
                        </div>

                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="active" name="active"
                                       value="true" checked>
                                <label class="form-check-label" for="active">
                                    Active Customer
                                </label>
                                <div class="form-text">Active customers can make purchases and receive services</div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/customers" class="btn btn-secondary">
                                <i class="fas fa-times"></i> Cancel
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Add Customer
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>