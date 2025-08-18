<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Staff - Pahana Education</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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

    .navbar-brand {
      font-weight: 600;
      color: var(--primary-purple) !important;
    }
    .card {
      box-shadow: 0 15px 35px var(--shadow-light);
      border: 2px solid var(--border-light);
      border-radius: 25px;
      overflow: hidden;
    }
    .form-label {
      font-weight: 600;
      color: var(--text-dark);
    }
    .text-danger {
      color: #dc3545 !important;
    }
    .form-control:focus, .form-select:focus {
      border-color: var(--primary-purple);
      box-shadow: 0 0 0 0.25rem var(--shadow-light);
      background-color: var(--subtle-purple);
    }
    .btn-primary {
      background: linear-gradient(135deg, var(--primary-purple) 0%, var(--accent-purple) 100%);
      border: none;
      border-radius: 20px;
      font-weight: 600;
    }
    .btn-primary:hover {
      background: linear-gradient(135deg, var(--dark-purple) 0%, var(--primary-purple) 100%);
      transform: translateY(-2px);
      box-shadow: 0 8px 25px var(--shadow-medium);
    }
    .btn-secondary {
      background: linear-gradient(135deg, var(--text-muted), #95a5a6);
      border: none;
      border-radius: 20px;
      font-weight: 600;
      color: white;
    }
    .btn-secondary:hover {
      background: linear-gradient(135deg, #6c757d, var(--text-muted));
      color: white;
      transform: translateY(-2px);
    }
    body {
      background: linear-gradient(135deg, var(--surface-light) 0%, var(--subtle-purple) 100%) !important;
      min-height: 100vh;
    }
    .navbar-dark.bg-dark {
      background: var(--surface-white) !important;
      border-bottom: 3px solid var(--primary-purple);
    }
    .navbar-text {
      background: var(--subtle-purple) !important;
      padding: 0.5rem 1rem !important;
      border-radius: 20px !important;
      color: var(--text-dark) !important;
    }
    .btn-outline-light {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      border: none;
      color: white;
      border-radius: 15px;
      font-weight: 600;
    }
    .btn-outline-light:hover {
      background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
      color: white;
    }
    .alert-danger {
      background: rgba(220, 53, 69, 0.1);
      border: 2px solid rgba(220, 53, 69, 0.2);
      border-radius: 15px;
      border-left: 5px solid #dc3545;
    }
    .alert-info {
      background: var(--subtle-purple);
      border: 2px solid var(--border-light);
      border-radius: 15px;
      border-left: 5px solid var(--primary-purple);
      color: var(--text-dark);
    }
    .card-header {
      background: linear-gradient(135deg, var(--primary-purple) 0%, var(--accent-purple) 100%);
      color: white;
      border-bottom: 2px solid var(--border-light);
      padding: 1.5rem;
    }
    .card-body {
      padding: 2rem;
    }
    .form-control {
      border: 2px solid var(--border-light);
      border-radius: 15px;
      padding: 0.75rem 1rem;
      font-weight: 500;
    }
    .form-control:disabled {
      background-color: var(--subtle-purple);
      border-color: var(--border-light);
    }
    .form-check-input:checked {
      background-color: var(--primary-purple);
      border-color: var(--primary-purple);
    }
    h4 {
      color: white !important;
    }
    .container {
      max-width: 1200px;
    }
    .form-text {
      color: var(--text-muted);
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
      <a href="${pageContext.request.contextPath}/staff" class="btn btn-outline-light me-2">
        <i class="fas fa-arrow-left"></i> Back to Staff
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
          <h4 class="mb-0"><i class="fas fa-user-edit"></i> Edit Staff Member</h4>
        </div>
        <div class="card-body">
          <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
              <i class="fas fa-exclamation-circle"></i> ${errorMessage}
            </div>
          </c:if>

          <div class="alert alert-info">
            <strong>Staff ID:</strong> ${staff.id} |
            <strong>Member Since:</strong>
            <fmt:formatDate value="${staff.createdDateAsDate}" pattern="MMM dd, yyyy"/>
          </div>

          <form method="POST" action="${pageContext.request.contextPath}/staff/edit">
            <input type="hidden" name="id" value="${staff.id}">
            <input type="hidden" name="username" value="${staff.username}">

            <div class="mb-3">
              <label for="username" class="form-label">Username</label>
              <input type="text" class="form-control" id="username" value="${staff.username}" disabled>
              <div class="form-text">Username cannot be changed</div>
            </div>

            <div class="mb-3">
              <label for="fullName" class="form-label">Full Name <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="fullName" name="fullName"
                     value="${staff.fullName}" required>
            </div>

            <div class="mb-3">
              <label for="email" class="form-label">Email Address <span class="text-danger">*</span></label>
              <input type="email" class="form-control" id="email" name="email"
                     value="${staff.email}" required>
            </div>

            <div class="mb-3">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="active" name="active"
                       value="true" ${staff.active ? 'checked' : ''}>
                <label class="form-check-label" for="active">
                  Active Staff
                </label>
                <div class="form-text">
                  <c:choose>
                    <c:when test="${staff.active}">
                      Staff member is currently active
                    </c:when>
                    <c:otherwise>
                      Staff member is inactive - check this box to reactivate
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>

            <div class="d-flex justify-content-between">
              <a href="${pageContext.request.contextPath}/staff" class="btn btn-secondary">
                <i class="fas fa-times"></i> Cancel
              </a>
              <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Update Staff
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