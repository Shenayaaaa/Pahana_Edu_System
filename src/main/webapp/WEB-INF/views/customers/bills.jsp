<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Bills - ${customer.name} - Pahana Edu Book Store</title>
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

    .bg-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple)) !important;
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

    .table-dark th {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple)) !important;
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

    .table-striped tbody tr:nth-of-type(odd) {
      background: var(--surface-light);
    }

    .table-hover tbody tr:hover {
      background: var(--subtle-purple);
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

    .badge {
      font-size: 0.75em;
      border-radius: 15px;
      padding: 0.5rem 1rem;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .badge.bg-light {
      background: linear-gradient(135deg, var(--surface-light), var(--subtle-purple)) !important;
      color: var(--primary-purple) !important;
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

    .badge.bg-info {
      background: linear-gradient(135deg, #17a2b8, #20c997) !important;
    }

    .badge.bg-secondary {
      background: linear-gradient(135deg, var(--text-muted), #5a6268) !important;
    }

    .text-muted {
      color: var(--text-muted) !important;
    }

    .text-dark {
      color: var(--text-dark) !important;
    }

    .bg-light {
      background: linear-gradient(145deg, var(--surface-light), var(--subtle-purple)) !important;
    }

    .bg-dark {
      background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
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

    .text-center .fa-receipt {
      color: var(--primary-purple);
    }

    .card-title {
      color: var(--text-dark);
      font-weight: 700;
    }

    @media (max-width: 768px) {
      .card {
        margin-bottom: 1rem;
      }

      .table-responsive {
        border-radius: var(--border-radius);
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
      <i class="fas fa-graduation-cap"></i> Pahana Edu Book Store
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
  <!-- Customer Info Header -->
  <div class="card mb-4">
    <div class="card-header bg-primary text-white">
      <h4 class="mb-0">
        <i class="fas fa-user"></i> ${customer.name}
        <span class="badge bg-light text-dark ms-2">${customer.accountNumber}</span>
      </h4>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <p><strong>Email:</strong>
            <c:choose>
              <c:when test="${not empty customer.email}">
                <a href="mailto:${customer.email}">${customer.email}</a>
              </c:when>
              <c:otherwise>
                <span class="text-muted">Not provided</span>
              </c:otherwise>
            </c:choose>
          </p>
          <p><strong>Phone:</strong>
            <c:choose>
              <c:when test="${not empty customer.phoneNumber}">
                ${customer.phoneNumber}
              </c:when>
              <c:otherwise>
                <span class="text-muted">Not provided</span>
              </c:otherwise>
            </c:choose>
          </p>
        </div>
        <div class="col-md-6">
          <p><strong>Status:</strong>
            <c:choose>
              <c:when test="${customer.active}">
                <span class="badge bg-success">Active</span>
              </c:when>
              <c:otherwise>
                <span class="badge bg-secondary">Inactive</span>
              </c:otherwise>
            </c:choose>
          </p>
          <p><strong>Member Since:</strong>
            <fmt:formatDate value="${customer.createdDateAsDate}" pattern="MMM dd, yyyy"/>
          </p>
        </div>
      </div>
    </div>
  </div>

  <!-- Bills List -->
  <div class="card">
    <div class="card-header d-flex justify-content-between align-items-center">
      <h5 class="mb-0">
        <i class="fas fa-receipt"></i> Purchase History
      </h5>
      <span class="badge bg-info">${bills.size()} bills</span>
    </div>
    <div class="card-body">
      <c:choose>
        <c:when test="${not empty bills}">
          <div class="table-responsive">
            <table class="table table-striped table-hover">
              <thead class="table-dark">
              <tr>
                <th>Bill ID</th>
                <th>Date</th>
                <th>Total Amount</th>
                <th>Payment Method</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="bill" items="${bills}">
                <tr>
                  <td>
                    <strong>${bill.billId}</strong>
                  </td>
                  <td>
                    <fmt:formatDate value="${bill.billDateAsDate}" pattern="MMM dd, yyyy HH:mm"/>
                  </td>
                  <td>
                    <strong>$<fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/></strong>
                  </td>
                  <td>
                    <span class="badge bg-secondary">${bill.paymentMethod}</span>
                  </td>
                  <td>
                    <c:choose>
                      <c:when test="${bill.paymentStatus == 'PAID'}">
                        <span class="badge bg-success">Paid</span>
                      </c:when>
                      <c:when test="${bill.paymentStatus == 'PENDING'}">
                        <span class="badge bg-warning">Pending</span>
                      </c:when>
                      <c:otherwise>
                        <span class="badge bg-danger">Unpaid</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <a href="${pageContext.request.contextPath}/billing/receipt?billId=${bill.billId}"
                       class="btn btn-sm btn-outline-primary" title="View Receipt">
                      <i class="fas fa-eye"></i> View
                    </a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>

          <!-- Summary -->
          <div class="row mt-4">
            <div class="col-md-6 offset-md-6">
              <div class="card bg-light">
                <div class="card-body">
                  <h6 class="card-title">Summary</h6>
                  <p class="mb-1">Total Orders: <strong>${bills.size()}</strong></p>
                  <c:set var="totalAmount" value="0" />
                  <c:forEach var="bill" items="${bills}">
                    <c:set var="totalAmount" value="${totalAmount + bill.totalAmount}" />
                  </c:forEach>
                  <p class="mb-0">Total Spent: <strong>$<fmt:formatNumber value="${totalAmount}" pattern="#,##0.00"/></strong></p>
                </div>
              </div>
            </div>
          </div>
        </c:when>
        <c:otherwise>
          <div class="text-center text-muted py-5">
            <i class="fas fa-receipt fa-3x mb-3"></i>
            <h5>No Purchase History</h5>
            <p>This customer hasn't made any purchases yet.</p>
            <a href="${pageContext.request.contextPath}/billing" class="btn btn-primary">
              <i class="fas fa-plus"></i> Create New Bill
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>