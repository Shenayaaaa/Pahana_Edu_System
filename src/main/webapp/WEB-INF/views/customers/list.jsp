<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Management</title>
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

    .search-card {
      background: linear-gradient(145deg, var(--surface-light), var(--subtle-purple));
      border: 2px solid var(--border-light);
    }

    .search-card .card-header {
      background: linear-gradient(135deg, var(--accent-purple), var(--light-purple));
    }

    .table {
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 15px var(--shadow-light);
    }

    .table th {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      color: white;
      font-weight: 600;
      border: none;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      font-size: 0.9rem;
    }

    .table td {
      border: none;
      border-bottom: 1px solid var(--border-light);
      vertical-align: middle;
    }

    .table tbody tr {
      background: var(--surface-white);
      transition: all 0.3s ease;
    }

    .table tbody tr:nth-child(even) {
      background: var(--surface-light);
    }

    .table tbody tr:hover {
      background: var(--subtle-purple);
      transform: translateX(2px);
    }

    .btn {
      border-radius: 25px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      transition: all 0.3s ease;
      border: none;
    }

    .btn-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      box-shadow: 0 4px 15px var(--shadow-light);
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px var(--shadow-medium);
    }

    .btn-outline-primary {
      border: 2px solid var(--primary-purple);
      color: var(--primary-purple);
      background: transparent;
    }

    .btn-outline-primary:hover {
      background: var(--primary-purple);
      color: white;
      transform: translateY(-2px);
    }

    .btn-outline-secondary {
      border: 2px solid var(--text-muted);
      color: var(--text-muted);
      background: transparent;
    }

    .btn-outline-secondary:hover {
      background: var(--text-muted);
      color: white;
      transform: translateY(-2px);
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

    .btn-info {
      background: linear-gradient(135deg, #17a2b8, #20c997);
    }

    .btn-info:hover {
      transform: translateY(-2px);
    }

    .btn-warning {
      background: linear-gradient(135deg, #f59e0b, #fbbf24);
      color: white;
    }

    .btn-warning:hover {
      transform: translateY(-2px);
    }

    .btn-danger {
      background: linear-gradient(135deg, #dc3545, #e74c3c);
    }

    .btn-danger:hover {
      transform: translateY(-2px);
    }

    .btn-group .btn {
      border-radius: 20px;
      margin-right: 0.25rem;
    }

    .btn-group .btn:last-child {
      margin-right: 0;
    }

    .form-control, .form-select {
      border-radius: 10px;
      border: 2px solid var(--border-light);
      transition: all 0.3s ease;
      color: var(--text-dark);
    }

    .form-control:focus, .form-select:focus {
      border-color: var(--primary-purple);
      box-shadow: 0 0 0 3px rgba(106, 76, 147, 0.1);
    }

    .input-group-text {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      color: white;
      border: none;
      border-radius: 10px 0 0 10px;
    }

    .badge {
      font-size: 0.75em;
      border-radius: 15px;
      padding: 0.5rem 1rem;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .badge.bg-success {
      background: linear-gradient(135deg, #10b981, #34d399) !important;
    }

    .badge.bg-warning {
      background: linear-gradient(135deg, #f59e0b, #fbbf24) !important;
    }

    .badge.bg-danger {
      background: linear-gradient(135deg, #dc3545, #e74c3c) !important;
    }

    .badge.bg-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple)) !important;
    }

    .badge.bg-info {
      background: linear-gradient(135deg, #17a2b8, #20c997) !important;
    }

    .badge.bg-secondary {
      background: linear-gradient(135deg, var(--text-muted), #5a6268) !important;
    }

    .empty-state {
      padding: 4rem 2rem;
      text-align: center;
      color: var(--text-muted);
    }

    .empty-state i {
      opacity: 0.5;
      color: var(--primary-purple);
      margin-bottom: 1rem;
    }

    .customer-avatar {
      width: 32px;
      height: 32px;
      font-size: 12px;
      background: linear-gradient(135deg, var(--accent-purple), var(--light-purple));
      color: white;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 600;
    }

    .account-number {
      font-family: 'Courier New', monospace;
      font-weight: 600;
      color: var(--primary-purple);
      background: var(--subtle-purple);
      padding: 0.25rem 0.5rem;
      border-radius: 8px;
      font-size: 0.9rem;
    }

    .alert {
      border: none;
      border-radius: var(--border-radius);
      box-shadow: var(--card-shadow);
    }

    .alert-success {
      background: linear-gradient(135deg, rgba(16, 185, 129, 0.1) 0%, rgba(52, 211, 153, 0.1) 100%);
      border-left: 4px solid #10b981;
      color: #059669;
    }

    .alert-danger {
      background: linear-gradient(135deg, rgba(220, 53, 69, 0.1) 0%, rgba(231, 76, 60, 0.1) 100%);
      border-left: 4px solid #dc3545;
      color: #b91c1c;
    }

    .card-footer {
      background: linear-gradient(145deg, var(--surface-light), var(--subtle-purple));
      border-top: 1px solid var(--border-light);
    }

    .text-primary {
      color: var(--primary-purple) !important;
    }

    .bg-dark {
      background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
    }

    @media (max-width: 768px) {
      .card {
        margin-bottom: 1rem;
      }

      .table-responsive {
        border-radius: var(--border-radius);
      }

      .btn-group {
        flex-direction: column;
        gap: 0.25rem;
      }

      .btn-group .btn {
        margin-right: 0;
        margin-bottom: 0.25rem;
      }
    }
  </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">
      <i class="fas fa-graduation-cap me-2"></i>Pahana Edu Book Store
    </a>
    <div class="navbar-nav ms-auto">
      <span class="navbar-text me-3">
        <i class="fas fa-user-circle me-1"></i>
        Hii, <strong>${sessionScope.currentUser.fullName}</strong>!
        <span class="badge bg-primary ms-2">${sessionScope.userRole}</span>
      </span>
      <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">
        <i class="fas fa-sign-out-alt me-1"></i>Logout
      </a>
    </div>
  </div>
</nav>

<div class="container-fluid py-4">
  <!-- Header Section -->
  <div class="row mb-4">
    <div class="col-12">
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <h1 class="h3 mb-1">
            <i class="fas fa-users text-primary me-2"></i>Customer Management
          </h1>
          <p class="text-muted mb-0">Manage your customers Here!!!!</p>
        </div>
        <div class="d-flex gap-2">
          <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-secondary">
            <i class="fas fa-tachometer-alt me-1"></i>Dashboard
          </a>
          <c:if test="${sessionScope.userRole == 'ADMIN' || sessionScope.userRole == 'STAFF'}">
            <a href="${pageContext.request.contextPath}/customers/add" class="btn btn-primary">
              <i class="fas fa-plus me-1"></i>Add Customer
            </a>
          </c:if>
        </div>
      </div>
    </div>
  </div>

  <!-- Alerts Section -->
  <div class="row mb-4">
    <div class="col-12">
      <c:if test="${param.message == 'customer-added'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="fas fa-check-circle me-2"></i>
          <strong>Success!</strong> Customer added successfully!
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </c:if>
      <c:if test="${param.message == 'customer-updated'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="fas fa-check-circle me-2"></i>
          <strong>Success!</strong> Customer updated successfully!
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </c:if>
      <c:if test="${param.message == 'customer-deleted'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="fas fa-check-circle me-2"></i>
          <strong>Success!</strong> Customer deactivated successfully!
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </c:if>
      <c:if test="${param.message == 'quick-customer-created'}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="fas fa-bolt me-2"></i>
          <strong>Success!</strong> Quick customer created successfully!
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </c:if>
      <c:if test="${param.error != null}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
          <i class="fas fa-exclamation-triangle me-2"></i>
          <strong>Error:</strong> ${param.error}
          <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
      </c:if>
    </div>
  </div>

  <!-- Search Row -->
  <div class="row mb-4">
    <!-- Search Card -->
    <div class="col-12">
      <div class="card search-card border-0">
        <div class="card-header bg-transparent border-bottom">
          <h5 class="card-title mb-0">
            <i class="fas fa-search text-primary me-2"></i>Search Customers
          </h5>
        </div>
        <div class="card-body">
          <form method="get" action="${pageContext.request.contextPath}/customers/search">
            <div class="row g-2">
              <div class="col-md-8">
                <div class="input-group">
                  <span class="input-group-text bg-white border-end-0">
                    <i class="fas fa-search text-muted"></i>
                  </span>
                  <input type="text" class="form-control border-start-0" name="q"
                         placeholder="Search by customer name, account number, email..."
                         value="${searchQuery}">
                </div>
              </div>
              <div class="col-md-4">
                <div class="d-grid gap-2 d-md-flex">
                  <button type="submit" class="btn btn-primary flex-fill">
                    <i class="fas fa-search me-1"></i>Search
                  </button>
                  <a href="${pageContext.request.contextPath}/customers" class="btn btn-outline-secondary">
                    <i class="fas fa-times"></i>
                  </a>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Customer List Section -->
  <div class="row">
    <div class="col-12">
      <div class="card">
        <div class="card-header bg-white border-bottom">
          <div class="d-flex justify-content-between align-items-center">
            <h5 class="card-title mb-0">
              <i class="fas fa-list me-2 text-primary"></i>
              <c:choose>
                <c:when test="${not empty searchQuery}">
                  Search Results for "<em>${searchQuery}</em>"
                </c:when>
                <c:otherwise>
                  Customer Directory
                </c:otherwise>
              </c:choose>
            </h5>
            <div class="d-flex gap-2">
              <c:if test="${sessionScope.userRole == 'ADMIN' || sessionScope.userRole == 'STAFF'}">
                <a href="${pageContext.request.contextPath}/customers/quick" class="btn btn-outline-primary btn-sm">
                  <i class="fas fa-bolt me-1"></i>Quick Add
                </a>
              </c:if>
              <span class="badge bg-info fs-6">${customers.size()} found</span>
            </div>
          </div>
        </div>
        <div class="card-body p-0">
          <c:choose>
            <c:when test="${not empty customers}">
              <div class="table-responsive">
                <table class="table table-hover mb-0">
                  <thead class="table-dark">
                  <tr>
                    <th scope="col" class="ps-4">
                      <i class="fas fa-hashtag me-1"></i>Account
                    </th>
                    <th scope="col">
                      <i class="fas fa-user me-1"></i>Customer
                    </th>
                    <th scope="col">
                      <i class="fas fa-envelope me-1"></i>Email
                    </th>
                    <th scope="col">
                      <i class="fas fa-phone me-1"></i>Phone
                    </th>
                    <th scope="col">
                      <i class="fas fa-toggle-on me-1"></i>Status
                    </th>
                    <th scope="col">
                      <i class="fas fa-calendar-plus me-1"></i>Created
                    </th>
                    <th scope="col" class="pe-4">
                      <i class="fas fa-cogs me-1"></i>Actions
                    </th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="customer" items="${customers}" varStatus="status">
                    <tr>
                      <td class="ps-4">
                        <div class="account-number">${customer.accountNumber}</div>
                      </td>
                      <td>
                        <div class="d-flex align-items-center">
                          <div class="customer-avatar rounded-circle d-flex align-items-center justify-content-center text-white me-3">
                              ${customer.name.substring(0,1).toUpperCase()}
                          </div>
                          <div>
                            <div class="fw-medium">${customer.name}</div>
                            <c:if test="${not empty customer.address}">
                              <small class="text-muted">
                                <i class="fas fa-map-marker-alt me-1"></i>${customer.address}
                              </small>
                            </c:if>
                          </div>
                        </div>
                      </td>
                      <td>
                        <c:choose>
                          <c:when test="${not empty customer.email}">
                            <a href="mailto:${customer.email}" class="text-decoration-none">
                              <i class="fas fa-envelope-open-text me-1"></i>${customer.email}
                            </a>
                          </c:when>
                          <c:otherwise>
                            <span class="text-muted fst-italic">
                              <i class="fas fa-minus me-1"></i>Not provided
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>
                        <c:choose>
                          <c:when test="${not empty customer.phoneNumber}">
                            <a href="tel:${customer.phoneNumber}" class="text-decoration-none">
                              <i class="fas fa-phone me-1"></i>${customer.phoneNumber}
                            </a>
                          </c:when>
                          <c:otherwise>
                            <span class="text-muted fst-italic">
                              <i class="fas fa-minus me-1"></i>Not provided
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>
                        <c:choose>
                          <c:when test="${customer.active}">
                            <span class="badge bg-success">
                              <i class="fas fa-check me-1"></i>Active
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="badge bg-secondary">
                              <i class="fas fa-pause me-1"></i>Inactive
                            </span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>
                        <div class="text-muted small">
                          <i class="fas fa-calendar me-1"></i>
                          <fmt:formatDate value="${customer.createdDateAsDate}" pattern="MMM dd, yyyy"/>
                        </div>
                      </td>
                      <td class="pe-4">
                        <div class="btn-group" role="group">
                          <a href="${pageContext.request.contextPath}/customers/bills?accountNumber=${customer.accountNumber}"
                             class="btn btn-sm btn-outline-info"
                             title="View bills and payment history"
                             data-bs-toggle="tooltip">
                            <i class="fas fa-receipt"></i>
                          </a>

                          <c:if test="${sessionScope.userRole == 'ADMIN'}">
                            <a href="${pageContext.request.contextPath}/customers/edit?accountNumber=${customer.accountNumber}"
                               class="btn btn-sm btn-outline-primary"
                               title="Edit customer information"
                               data-bs-toggle="tooltip">
                              <i class="fas fa-edit"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/customers/delete?accountNumber=${customer.accountNumber}"
                               class="btn btn-sm btn-outline-danger"
                               title="Deactivate customer account"
                               data-bs-toggle="tooltip"
                               onclick="return confirm('Are you sure you want to deactivate ${customer.name}? This will hide them from the active customer list.')">
                              <i class="fas fa-user-times"></i>
                            </a>
                          </c:if>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center text-muted empty-state">
                <i class="fas fa-users fa-4x mb-3"></i>
                <h4 class="mb-3">
                  <c:choose>
                    <c:when test="${not empty searchQuery}">
                      No customers found matching "${searchQuery}"
                    </c:when>
                    <c:otherwise>
                      No customers found
                    </c:otherwise>
                  </c:choose>
                </h4>
                <p class="mb-4">
                  <c:choose>
                    <c:when test="${not empty searchQuery}">
                      Try adjusting your search criteria or browse all customers.
                    </c:when>
                    <c:otherwise>
                      Get started by adding your first customer to the system.
                    </c:otherwise>
                  </c:choose>
                </p>
                <div class="d-flex gap-2 justify-content-center">
                  <c:if test="${not empty searchQuery}">
                    <a href="${pageContext.request.contextPath}/customers" class="btn btn-outline-primary">
                      <i class="fas fa-list me-2"></i>View All Customers
                    </a>
                  </c:if>
                  <c:if test="${sessionScope.userRole == 'ADMIN' || sessionScope.userRole == 'STAFF'}">
                    <a href="${pageContext.request.contextPath}/customers/add" class="btn btn-primary btn-lg">
                      <i class="fas fa-plus me-2"></i>Add First Customer
                    </a>
                  </c:if>
                </div>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
        <c:if test="${not empty customers && customers.size() > 10}">
          <div class="card-footer bg-light text-center">
            <small class="text-muted">
              <i class="fas fa-info-circle me-1"></i>
              Showing ${customers.size()} customer${customers.size() != 1 ? 's' : ''}
            </small>
          </div>
        </c:if>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Initialize tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
</script>
</body>
</html>