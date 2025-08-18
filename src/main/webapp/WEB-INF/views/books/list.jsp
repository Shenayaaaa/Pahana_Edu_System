<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>All Books</title>
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

    body {
      background: linear-gradient(135deg, var(--surface-light) 0%, var(--subtle-purple) 100%);
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      color: var(--text-dark);
      min-height: 100vh;
    }

    .navbar {
      background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
      box-shadow: 0 4px 20px var(--shadow-light);
    }

    .navbar-brand {
      color: white !important;
      font-weight: 700;
    }

    .navbar-brand:hover {
      color: var(--accent-purple) !important;
    }

    .navbar-text {
      color: rgba(255, 255, 255, 0.9) !important;
      font-weight: 500;
    }

    .btn-outline-light {
      border-color: rgba(255, 255, 255, 0.3);
      color: white;
      font-weight: 600;
    }

    .btn-outline-light:hover {
      background: rgba(255, 255, 255, 0.1);
      border-color: white;
      color: white;
    }

    h2 {
      color: var(--text-dark);
      font-weight: 800;
      font-size: 2.2rem;
      letter-spacing: -0.5px;
    }

    .text-muted {
      color: var(--text-muted) !important;
    }

    .btn-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      border: none;
      border-radius: 10px;
      font-weight: 600;
      box-shadow: 0 4px 15px var(--shadow-light);
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
      transform: translateY(-2px);
      box-shadow: 0 6px 20px var(--shadow-medium);
    }

    .btn-success {
      background: linear-gradient(135deg, #10b981, #34d399);
      border: none;
      border-radius: 10px;
      font-weight: 600;
      box-shadow: 0 4px 15px rgba(16, 185, 129, 0.2);
      transition: all 0.3s ease;
    }

    .btn-success:hover {
      background: linear-gradient(135deg, #059669, #10b981);
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(16, 185, 129, 0.3);
    }

    .btn-outline-primary {
      border-color: var(--primary-purple);
      color: var(--primary-purple);
    }

    .btn-outline-primary:hover {
      background: var(--primary-purple);
      border-color: var(--primary-purple);
      color: white;
    }

    .btn-outline-secondary {
      border-color: var(--text-muted);
      color: var(--text-muted);
    }

    .btn-outline-secondary:hover {
      background: var(--text-muted);
      border-color: var(--text-muted);
      color: white;
    }

    .form-control {
      border: 1px solid var(--border-light);
      border-radius: 10px;
      background: var(--surface-white);
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: var(--primary-purple);
      box-shadow: 0 0 0 0.2rem rgba(106, 76, 147, 0.25);
      background: white;
    }

    .alert {
      border: none;
      border-radius: 12px;
      box-shadow: 0 4px 15px var(--shadow-light);
      font-weight: 500;
    }

    .alert-success {
      background: linear-gradient(135deg, #10b981, #34d399);
      color: white;
    }

    .alert-danger {
      background: linear-gradient(135deg, #ef4444, #f87171);
      color: white;
    }

    .btn-close {
      filter: brightness(0) invert(1);
    }

    .card {
      background: var(--surface-white);
      border: 1px solid var(--border-light);
      border-radius: 16px;
      box-shadow: 0 8px 25px var(--shadow-light);
      overflow: hidden;
      margin-bottom: 1.5rem;
    }

    .bg-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple)) !important;
    }

    .bg-success {
      background: linear-gradient(135deg, #10b981, #34d399) !important;
    }

    .bg-warning {
      background: linear-gradient(135deg, #f59e0b, #fbbf24) !important;
    }

    .card-header {
      background: linear-gradient(135deg, var(--subtle-purple), var(--surface-white));
      border-bottom: 1px solid var(--border-light);
    }

    .table-dark {
      background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
    }

    .table thead th {
      background: linear-gradient(135deg, var(--subtle-purple), var(--surface-white));
      border: none;
      color: var(--text-dark);
      font-weight: 700;
    }

    .table tbody td {
      border-bottom: 1px solid var(--border-light);
      color: var(--text-dark);
      vertical-align: middle;
    }

    .table-hover tbody tr:hover {
      background: linear-gradient(135deg, var(--subtle-purple), rgba(255, 255, 255, 0.8));
    }

    .badge.bg-danger {
      background: linear-gradient(135deg, #ef4444, #f87171) !important;
    }

    .badge.bg-success {
      background: linear-gradient(135deg, #10b981, #34d399) !important;
    }

    .badge.bg-secondary {
      background: linear-gradient(135deg, var(--text-muted), #9ca3af) !important;
    }

    .btn-outline-danger {
      border-color: #ef4444;
      color: #ef4444;
    }

    .btn-outline-danger:hover {
      background: #ef4444;
      border-color: #ef4444;
      color: white;
    }

    .border-warning {
      border-color: var(--accent-purple) !important;
    }

    .list-group-item:hover {
      background: var(--subtle-purple);
    }

    .modal-content {
      border: none;
      border-radius: 16px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    }

    .modal-header {
      background: linear-gradient(135deg, var(--subtle-purple), var(--surface-white));
      border-bottom: 1px solid var(--border-light);
      border-radius: 16px 16px 0 0;
    }

    .modal-title {
      color: var(--text-dark);
      font-weight: 700;
    }

    .modal-body {
      color: var(--text-dark);
    }

    .btn-danger {
      background: linear-gradient(135deg, #ef4444, #f87171);
      border: none;
      font-weight: 600;
    }

    .btn-danger:hover {
      background: linear-gradient(135deg, #dc2626, #ef4444);
    }

    .btn-secondary {
      background: linear-gradient(135deg, var(--text-muted), #9ca3af);
      border: none;
      font-weight: 600;
    }

    .btn-secondary:hover {
      background: linear-gradient(135deg, #6b7280, var(--text-muted));
    }

    .text-center i.fa-3x {
      color: var(--light-purple) !important;
      opacity: 0.7;
    }

    .btn-sm {
      border-radius: 8px;
      font-weight: 600;
    }

    strong {
      color: var(--text-dark);
    }

    .font-monospace {
      color: var(--text-dark);
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
                Hello, ${sessionScope.currentUser.fullName}!
            </span>
      <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light">
        <i class="fas fa-sign-out-alt"></i> Logout
      </a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <!-- Header -->
  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h2><i class="fas fa-book"></i> Books Management</h2>
      <p class="text-muted mb-0">Manage your library inventory</p>
    </div>
    <div>
      <a href="${pageContext.request.contextPath}/books/add" class="btn btn-primary me-2">
        <i class="fas fa-plus"></i> Add New Book
      </a>
    </div>
  </div>

  <!-- Search Form -->
  <div class="row mb-4">
    <div class="col-md-8">
      <form method="GET" action="${pageContext.request.contextPath}/books/search" class="d-flex">
        <input type="text" class="form-control me-2" name="q" placeholder="Search books by title, author...."
               value="${searchQuery}" id="searchInput" autocomplete="off">
        <button type="submit" class="btn btn-outline-primary">
          <i class="fas fa-search"></i> Search
        </button>
      </form>
      <div id="searchSuggestions" class="position-relative">
        <ul id="suggestionsList" class="list-group position-absolute w-100 d-none" style="z-index: 1000;"></ul>
      </div>
    </div>
    <div class="col-md-4 text-end">
      <c:if test="${not empty searchQuery}">
        <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-secondary">
          <i class="fas fa-times"></i> Clear Search
        </a>
      </c:if>
    </div>
  </div>

  <!-- Messages -->
  <c:if test="${param.message == 'book-added'}">
    <div class="alert alert-success alert-dismissible fade show">
      <i class="fas fa-check-circle"></i> Book added successfully!
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <c:if test="${param.message == 'book-updated'}">
    <div class="alert alert-success alert-dismissible fade show">
      <i class="fas fa-check-circle"></i> Book updated successfully!
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <c:if test="${param.message == 'book-deleted'}">
    <div class="alert alert-success alert-dismissible fade show">
      <i class="fas fa-check-circle"></i> Book deleted successfully!
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <c:if test="${param.message == 'book-imported'}">
    <div class="alert alert-success alert-dismissible fade show">
      <i class="fas fa-check-circle"></i> Book imported from Google Books successfully!
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <c:if test="${not empty param.error}">
    <div class="alert alert-danger alert-dismissible fade show">
      <i class="fas fa-exclamation-circle"></i> Error: ${param.error}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </c:if>

  <!-- Stats Cards -->
  <div class="row mb-4">
    <div class="col-md-4">
      <div class="card bg-primary text-white">
        <div class="card-body text-center">
          <h3><i class="fas fa-book"></i> ${books.size()}</h3>
          <p class="mb-0">Total Books</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card bg-success text-white">
        <div class="card-body text-center">
          <h3><i class="fas fa-check-circle"></i>
            <c:set var="activeCount" value="0" />
            <c:forEach items="${books}" var="book">
              <c:if test="${book.active}">
                <c:set var="activeCount" value="${activeCount + 1}" />
              </c:if>
            </c:forEach>
            ${activeCount}
          </h3>
          <p class="mb-0">Active Books</p>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card bg-warning text-white">
        <div class="card-body text-center">
          <h3><i class="fas fa-exclamation-triangle"></i> ${lowStockBooks.size()}</h3>
          <p class="mb-0">Low Stock</p>
        </div>
      </div>
    </div>
  </div>

  <!-- Books Table -->
  <div class="card">
    <div class="card-header">
      <h5 class="mb-0">
        <i class="fas fa-list"></i> Books Inventory
        <c:if test="${not empty searchQuery}">
          - Search Results for "${searchQuery}"
        </c:if>
      </h5>
    </div>
    <div class="card-body">
      <c:choose>
        <c:when test="${not empty books}">
          <div class="table-responsive">
            <table class="table table-hover">
              <thead class="table-dark">
              <tr>
                <th>ISBN</th>
                <th>Title</th>
                <th>Author</th>
                <th>Publisher</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="book" items="${books}">
                <tr>
                  <td class="font-monospace">${book.isbn}</td>
                  <td>
                    <div class="d-flex align-items-center">
                      <c:choose>
                        <c:when test="${not empty book.imageUrl}">
                          <img src="${book.imageUrl}" alt="${book.title}"
                               class="me-3 rounded" style="width: 50px; height: 60px; object-fit: cover;">
                        </c:when>
                        <c:otherwise>
                          <div class="me-3 d-flex align-items-center justify-content-center bg-light rounded"
                               style="width: 50px; height: 60px;">
                            <i class="fas fa-book text-muted"></i>
                          </div>
                        </c:otherwise>
                      </c:choose>
                      <div>
                        <strong>${book.title}</strong>
                        <c:if test="${not empty book.categoryName}">
                          <br><small class="text-muted">${book.categoryName}</small>
                        </c:if>
                      </div>
                    </div>
                  </td>
                  <td>${book.author}</td>
                  <td>${book.publisher}</td>
                  <td>
                    <c:if test="${not empty book.price and book.price > 0}">
                      <fmt:formatNumber value="${book.price}" type="currency"/>
                    </c:if>
                    <c:if test="${empty book.price or book.price <= 0}">
                      <span class="text-muted">Not set</span>
                    </c:if>
                  </td>
                  <td>
                    <span class="badge ${book.quantity <= book.minStockLevel ? 'bg-danger' : 'bg-success'}">${book.quantity}</span>
                    <c:if test="${book.quantity <= book.minStockLevel}">
                      <small class="text-danger d-block">Low Stock!</small>
                    </c:if>
                  </td>
                  <td>
        <span class="badge ${book.active ? 'bg-success' : 'bg-secondary'}">
            ${book.active ? 'Active' : 'Inactive'}
        </span>
                  </td>
                  <td>
                    <div class="btn-group btn-group-sm">
                      <a href="${pageContext.request.contextPath}/books/edit?isbn=${book.isbn}"
                         class="btn btn-outline-primary" title="Edit">
                        <i class="fas fa-edit"></i>
                      </a>
                      <a href="${pageContext.request.contextPath}/books/delete?isbn=${book.isbn}"
                         class="btn btn-outline-danger" title="Delete"
                         onclick="return confirm('Are you sure you want to delete this book?')">
                        <i class="fas fa-trash"></i>
                      </a>
                    </div>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </c:when>
        <c:otherwise>
          <div class="text-center py-5">
            <i class="fas fa-book fa-3x text-muted mb-3"></i>
            <h5>No books found</h5>
            <p class="text-muted">
              <c:choose>
                <c:when test="${not empty searchQuery}">
                  No books match your search criteria.
                </c:when>
                <c:otherwise>
                  Start by adding your first book to the library.
                </c:otherwise>
              </c:choose>
            </p>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <!-- Low Stock Section -->
  <c:if test="${not empty lowStockBooks}">
    <div class="row mt-4">
      <div class="col-12">
        <div class="card border-warning">
          <div class="card-header bg-warning text-dark">
            <h5 class="mb-0"><i class="fas fa-exclamation-triangle"></i> Low Stock Alert</h5>
          </div>
          <div class="card-body">
            <div class="row">
              <c:forEach var="book" items="${lowStockBooks}">
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card border-warning">
                    <div class="card-body">
                      <h6 class="card-title">${book.title}</h6>
                      <p class="card-text text-muted">${book.author}</p>
                      <p class="text-danger mb-2">
                        <strong>Only ${book.quantity} left!</strong>
                        <br><small>Min required: ${book.minStockLevel}</small>
                      </p>
                      <a href="${pageContext.request.contextPath}/books/edit?isbn=${book.isbn}"
                         class="btn btn-sm btn-warning">Update Stock</a>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
  </c:if>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirm Delete</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p>Are you sure you want to delete the book "<span id="bookTitle"></span>"?</p>
        <p class="text-muted">This action cannot be undone.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <a href="#" id="confirmDeleteBtn" class="btn btn-danger">Delete</a>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  function confirmDelete(isbn, title) {
    document.getElementById('bookTitle').textContent = title;
    document.getElementById('confirmDeleteBtn').href =
            '${pageContext.request.contextPath}/books/delete?isbn=' + encodeURIComponent(isbn);

    var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
    deleteModal.show();
  }

  // Search suggestions functionality
  document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('searchInput');
    const suggestionsList = document.getElementById('suggestionsList');
    let debounceTimer;

    searchInput.addEventListener('input', function() {
      clearTimeout(debounceTimer);
      const query = this.value.trim();

      if (query.length < 2) {
        suggestionsList.classList.add('d-none');
        return;
      }

      debounceTimer = setTimeout(() => {
        fetchSuggestions(query);
      }, 300);
    });

    function fetchSuggestions(query) {
      fetch(`${pageContext.request.contextPath}/books/suggestions?q=` + encodeURIComponent(query))
              .then(response => response.json())
              .then(data => {
                displaySuggestions(data);
              })
              .catch(error => {
                console.error('Error fetching suggestions:', error);
                suggestionsList.classList.add('d-none');
              });
    }

    function displaySuggestions(suggestions) {
      suggestionsList.innerHTML = '';

      if (suggestions.length === 0) {
        suggestionsList.classList.add('d-none');
        return;
      }

      suggestions.forEach(suggestion => {
        const li = document.createElement('li');
        li.className = 'list-group-item list-group-item-action';
        li.style.cursor = 'pointer';
        li.innerHTML = `
                <strong>${suggestion.title}</strong><br>
                <small class="text-muted">by ${suggestion.author}</small>
            `;

        li.addEventListener('click', function() {
          searchInput.value = suggestion.title;
          suggestionsList.classList.add('d-none');
          searchInput.form.submit();
        });

        suggestionsList.appendChild(li);
      });

      suggestionsList.classList.remove('d-none');
    }

    // Hide suggestions when clicking outside
    document.addEventListener('click', function(event) {
      if (!searchInput.contains(event.target) && !suggestionsList.contains(event.target)) {
        suggestionsList.classList.add('d-none');
      }
    });
  });

  // Auto-dismiss alerts after 5 seconds
  setTimeout(function() {
    var alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
      if (alert.classList.contains('show')) {
        var bsAlert = new bootstrap.Alert(alert);
        bsAlert.close();
      }
    });
  }, 5000);
</script>
</body>
</html>