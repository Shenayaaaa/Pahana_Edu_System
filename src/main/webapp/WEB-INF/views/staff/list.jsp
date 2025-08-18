<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Staff Management</title>
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
      background: linear-gradient(90deg, var(--primary-purple) 0%, var(--dark-purple) 100%) !important;
      box-shadow: 0 8px 32px var(--shadow-light);
      backdrop-filter: blur(10px);
      border-bottom: 1px solid var(--border-light);
    }

    .navbar-brand {
      font-weight: 700;
      color: var(--surface-white) !important;
      text-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }

    .navbar-text {
      color: rgba(255,255,255,0.9) !important;
    }

    .main-wrapper {
      max-width: 1400px;
      margin: 0 auto;
      padding: 2rem 1rem;
    }

    .page-header {
      background: var(--surface-white);
      border-radius: 24px;
      padding: 2rem;
      margin-bottom: 2rem;
      box-shadow: 0 10px 40px var(--shadow-light);
      border: 1px solid var(--border-light);
    }

    .page-title {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      font-weight: 800;
      font-size: 2.5rem;
      margin: 0;
    }

    .page-subtitle {
      color: var(--text-muted);
      font-size: 1.1rem;
      margin-top: 0.5rem;
    }

    .stats-card {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      color: white;
      border-radius: 20px;
      padding: 1.5rem;
      text-align: center;
      box-shadow: 0 15px 35px var(--shadow-medium);
    }

    .stats-number {
      font-size: 3rem;
      font-weight: 800;
      margin: 0;
    }

    .stats-label {
      font-size: 1rem;
      opacity: 0.9;
      margin-top: 0.5rem;
    }

    .action-buttons {
      display: flex;
      gap: 1rem;
      flex-wrap: wrap;
    }

    .btn {
      border-radius: 16px;
      font-weight: 600;
      padding: 0.75rem 1.5rem;
      transition: all 0.3s ease;
      border: none;
      text-transform: none;
    }

    .btn-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--accent-purple));
      box-shadow: 0 8px 25px var(--shadow-light);
    }

    .btn-primary:hover {
      transform: translateY(-3px);
      box-shadow: 0 15px 40px var(--shadow-medium);
    }

    .btn-outline-secondary {
      border: 2px solid var(--border-light);
      color: var(--text-dark);
      background: var(--surface-white);
    }

    .btn-outline-secondary:hover {
      background: var(--primary-purple);
      border-color: var(--primary-purple);
      color: white;
      transform: translateY(-2px);
    }

    .btn-outline-light {
      border: 2px solid rgba(255,255,255,0.3);
      color: white;
    }

    .btn-outline-light:hover {
      background: rgba(255,255,255,0.2);
      transform: translateY(-2px);
    }

    .alerts-section {
      margin-bottom: 2rem;
    }

    .alert {
      border: none;
      border-radius: 16px;
      padding: 1.25rem 1.5rem;
      font-weight: 500;
      border-left: 5px solid;
    }

    .alert-success {
      background: linear-gradient(135deg, rgba(40, 167, 69, 0.1), rgba(34, 139, 34, 0.05));
      color: #155724;
      border-left-color: #28a745;
    }

    .alert-danger {
      background: linear-gradient(135deg, rgba(220, 53, 69, 0.1), rgba(231, 76, 60, 0.05));
      color: #721c24;
      border-left-color: #dc3545;
    }

    .staff-container {
      background: var(--surface-white);
      border-radius: 32px;
      overflow: hidden;
      box-shadow: 0 20px 60px var(--shadow-light);
      border: 1px solid var(--border-light);
    }

    .staff-header {
      background: linear-gradient(135deg, var(--subtle-purple), var(--surface-white));
      padding: 2rem;
      border-bottom: 3px solid var(--border-light);
    }

    .staff-title {
      color: var(--text-dark);
      font-weight: 700;
      font-size: 1.5rem;
      margin: 0;
    }

    .staff-count {
      background: linear-gradient(135deg, var(--accent-purple), var(--light-purple));
      color: white;
      font-weight: 700;
      font-size: 1.1rem;
      padding: 0.5rem 1rem;
      border-radius: 12px;
    }

    .table-wrapper {
      padding: 0;
      overflow: hidden;
    }

    .table {
      margin: 0;
      background: transparent;
    }

    .table thead {
      background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
    }

    .table thead th {
      color: white;
      font-weight: 700;
      padding: 1.5rem 1rem;
      border: none;
      text-transform: uppercase;
      font-size: 0.85rem;
      letter-spacing: 0.5px;
    }

    .table tbody tr {
      transition: all 0.3s ease;
      border-bottom: 1px solid var(--border-light);
    }

    .table tbody tr:hover {
      background: linear-gradient(135deg, var(--subtle-purple), rgba(255,255,255,0.8));
      transform: scale(1.005);
      box-shadow: 0 10px 30px var(--shadow-light);
    }

    .table tbody td {
      padding: 1.5rem 1rem;
      vertical-align: middle;
      border: none;
    }

    .user-avatar {
      width: 45px;
      height: 45px;
      background: linear-gradient(135deg, var(--primary-purple), var(--accent-purple));
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      font-weight: 700;
      font-size: 1.2rem;
      border: 3px solid var(--border-light);
    }

    .username-code {
      background: var(--subtle-purple);
      color: var(--primary-purple);
      padding: 0.5rem 0.75rem;
      border-radius: 10px;
      font-family: 'Courier New', monospace;
      font-weight: 600;
      font-size: 0.9rem;
    }

    .status-badge {
      padding: 0.6rem 1rem;
      border-radius: 12px;
      font-weight: 600;
      font-size: 0.85rem;
    }

    .status-active {
      background: linear-gradient(135deg, #28a745, #20c997);
      color: white;
    }

    .status-inactive {
      background: linear-gradient(135deg, #6c757d, #adb5bd);
      color: white;
    }

    .action-buttons-group {
      display: flex;
      gap: 0.5rem;
    }

    .btn-sm {
      padding: 0.5rem 0.75rem;
      border-radius: 10px;
    }

    .btn-outline-primary {
      border: 2px solid var(--primary-purple);
      color: var(--primary-purple);
      background: rgba(255,255,255,0.9);
    }

    .btn-outline-primary:hover {
      background: var(--primary-purple);
      color: white;
      transform: scale(1.1);
    }

    .btn-outline-danger {
      border: 2px solid #dc3545;
      color: #dc3545;
      background: rgba(255,255,255,0.9);
    }

    .btn-outline-danger:hover {
      background: #dc3545;
      color: white;
      transform: scale(1.1);
    }

    .empty-state-container {
      text-align: center;
      padding: 5rem 2rem;
      background: linear-gradient(135deg, var(--subtle-purple), rgba(255,255,255,0.5));
    }

    .empty-state-icon {
      font-size: 5rem;
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
      margin-bottom: 2rem;
    }

    .empty-state-title {
      color: var(--text-dark);
      font-weight: 700;
      font-size: 2rem;
      margin-bottom: 1rem;
    }

    .empty-state-text {
      color: var(--text-muted);
      font-size: 1.1rem;
      margin-bottom: 2rem;
    }

    .footer-info {
      background: linear-gradient(135deg, var(--subtle-purple), rgba(255,255,255,0.8));
      padding: 1.5rem 2rem;
      text-align: center;
      color: var(--text-muted);
      font-weight: 500;
    }

    @media (max-width: 768px) {
      .main-wrapper {
        padding: 1rem;
      }

      .page-header {
        padding: 1.5rem;
        text-align: center;
      }

      .page-title {
        font-size: 2rem;
      }

      .action-buttons {
        justify-content: center;
        margin-top: 1rem;
      }

      .staff-container {
        border-radius: 20px;
      }

      .table-wrapper {
        overflow-x: auto;
      }
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">
      </i><i class="fas fa-gem me-1"></i>Pahana Edu Book Store
    </a>
    <div class="navbar-nav ms-auto">
      <span class="navbar-text me-3">
        <i class="fas fa-user-astronaut me-2"></i>
        Hello, <strong>${sessionScope.currentUser.fullName}</strong>!
        <span class="badge bg-light text-dark ms-2">${sessionScope.userRole}</span>
      </span>
      <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-sm">
        <i class="fas fa-rocket me-1"></i>Logout
      </a>
    </div>
  </div>
</nav>

<div class="main-wrapper">
  <!-- Page Header -->
  <div class="page-header">
    <div class="row align-items-center">
      <div class="col-lg-8">
        <h1 class="page-title">
          <i class="fas fa-users-crown me-3"></i>Staff Management Hub
        </h1>
        <p class="page-subtitle">Manage your team members and their access privileges</p>
      </div>
      <div class="col-lg-4">
        <div class="stats-card">
          <h2 class="stats-number">${staffList.size()}</h2>
          <p class="stats-label">
            <i class="fas fa-users me-1"></i>Team Members
          </p>
        </div>
      </div>
    </div>
    <div class="row mt-4">
      <div class="col-12">
        <div class="action-buttons">
          <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-outline-secondary">
            <i class="fas fa-dashboard me-2"></i>Back to Dashboard
          </a>
          <a href="${pageContext.request.contextPath}/staff/add" class="btn btn-primary">
            <i class="fas fa-user-plus me-2"></i>Add New Staff Member
          </a>
        </div>
      </div>
    </div>
  </div>

  <!-- Alerts Section -->
  <div class="alerts-section">
    <c:if test="${param.message == 'staff-added'}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-party-horn me-2"></i>
        <strong>Fantastic!</strong> New staff member has joined the team successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>
    <c:if test="${param.message == 'staff-updated'}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-magic me-2"></i>
        <strong>Updated!</strong> Staff member information has been updated successfully!
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>
    <c:if test="${param.message == 'staff-deleted'}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <i class="fas fa-broom me-2"></i>
        <strong>Removed!</strong> Staff member has been successfully removed from the system!
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>
    <c:if test="${param.error != null}">
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <i class="fas fa-exclamation-diamond me-2"></i>
        <strong>Oops!</strong> ${param.error}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
      </div>
    </c:if>
  </div>

  <!-- Staff List Section -->
  <div class="staff-container">
    <div class="staff-header">
      <div class="d-flex justify-content-between align-items-center">
        <h3 class="staff-title">
          <i class="fas fa-address-book me-2"></i>Active Team Members
        </h3>
        <div class="staff-count">
          <i class="fas fa-hashtag me-1"></i>${staffList.size()} Members
        </div>
      </div>
    </div>

    <div class="table-wrapper">
      <c:choose>
        <c:when test="${not empty staffList}">
          <table class="table">
            <thead>
            <tr>
              <th><i class="fas fa-fingerprint me-2"></i>ID</th>
              <th><i class="fas fa-user-tie me-2"></i>Profile</th>
              <th><i class="fas fa-id-card me-2"></i>Full Name</th>
              <th><i class="fas fa-at me-2"></i>Email</th>
              <th><i class="fas fa-toggle-on me-2"></i>Status</th>
              <th><i class="fas fa-calendar-star me-2"></i>Joined</th>
              <th><i class="fas fa-history me-2"></i>Last Login</th>
              <th><i class="fas fa-toolbox me-2"></i>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="staff" items="${staffList}" varStatus="status">
              <tr>
                <td>
                  <span class="fw-bold text-primary">#${staff.id}</span>
                </td>
                <td>
                  <div class="d-flex align-items-center gap-3">
                    <div class="user-avatar">
                        ${staff.username.substring(0,1).toUpperCase()}
                    </div>
                    <span class="username-code">${staff.username}</span>
                  </div>
                </td>
                <td>
                  <span class="fw-semibold">${staff.fullName}</span>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${not empty staff.email}">
                      <a href="mailto:${staff.email}" class="text-decoration-none text-primary">
                        <i class="fas fa-envelope-circle-check me-1"></i>${staff.email}
                      </a>
                    </c:when>
                    <c:otherwise>
                      <span class="text-muted fst-italic">
                        <i class="fas fa-ghost me-1"></i>Not provided
                      </span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${staff.active}">
                      <span class="status-badge status-active">
                        <i class="fas fa-check-circle me-1"></i>Active
                      </span>
                    </c:when>
                    <c:otherwise>
                      <span class="status-badge status-inactive">
                        <i class="fas fa-pause-circle me-1"></i>Inactive
                      </span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <div class="text-muted">
                    <i class="fas fa-calendar-check me-1"></i>
                    <fmt:formatDate value="${staff.createdDateAsDate}" pattern="MMM dd, yyyy"/>
                  </div>
                </td>
                <td>
                  <c:choose>
                    <c:when test="${not empty staff.lastLoginAsDate}">
                      <div class="text-success">
                        <i class="fas fa-clock-rotate-left me-1"></i>
                        <fmt:formatDate value="${staff.lastLoginAsDate}" pattern="MMM dd, HH:mm"/>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <span class="text-muted fst-italic">
                        <i class="fas fa-hourglass-start me-1"></i>Never signed in
                      </span>
                    </c:otherwise>
                  </c:choose>
                </td>
                <td>
                  <div class="action-buttons-group">
                    <a href="${pageContext.request.contextPath}/staff/edit?username=${staff.username}"
                       class="btn btn-sm btn-outline-primary"
                       title="Edit staff member"
                       data-bs-toggle="tooltip">
                      <i class="fas fa-user-pen"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/staff/delete?username=${staff.username}"
                       class="btn btn-sm btn-outline-danger"
                       title="Delete staff member"
                       data-bs-toggle="tooltip"
                       onclick="return confirm('Are you sure you want to delete ${staff.fullName}? This action cannot be undone.')">
                      <i class="fas fa-user-slash"></i>
                    </a>
                  </div>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </c:when>
        <c:otherwise>
          <div class="empty-state-container">
            <i class="fas fa-users-viewfinder empty-state-icon"></i>
            <h4 class="empty-state-title">No Team Members Yet</h4>
            <p class="empty-state-text">Start building your team by adding your first staff member!</p>
            <a href="${pageContext.request.contextPath}/staff/add" class="btn btn-primary btn-lg">
              <i class="fas fa-user-plus me-2"></i>Add Your First Team Member
            </a>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <c:if test="${not empty staffList && staffList.size() > 10}">
      <div class="footer-info">
        <i class="fas fa-info-circle me-1"></i>
        Displaying all ${staffList.size()} team members
      </div>
    </c:if>
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