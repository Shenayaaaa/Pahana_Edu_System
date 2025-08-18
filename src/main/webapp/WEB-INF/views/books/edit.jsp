<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Books</title>
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

        .form-control[readonly] {
            background: var(--surface-light);
            color: var(--text-muted);
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

        .text-danger {
            color: #dc3545 !important;
        }

        .text-muted {
            color: var(--text-muted) !important;
        }

        .bg-dark {
            background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
        }

        .bg-light {
            background: var(--surface-light) !important;
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

        .img-fluid {
            border-radius: 10px;
            box-shadow: 0 4px 15px var(--shadow-light);
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
            <i class="fas fa-graduation-cap"></i> Pahana Edu Book Store
        </a>
        <div class="navbar-nav ms-auto">
            <a href="${pageContext.request.contextPath}/books" class="btn btn-outline-light me-2">
                <i class="fas fa-arrow-left"></i> Back
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
                    <h4 class="mb-0"><i class="fas fa-edit"></i> Edit Book</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                            <i class="fas fa-exclamation-circle"></i> ${errorMessage}
                        </div>
                    </c:if>

                    <!-- Book Preview -->
                    <div class="row mb-4">
                        <div class="col-md-3 text-center">
                            <c:choose>
                                <c:when test="${not empty book.imageUrl}">
                                    <img src="${book.imageUrl}" alt="${book.title}"
                                         class="img-fluid" style="max-height: 200px; max-width: 150px;">
                                </c:when>
                                <c:otherwise>
                                    <div class="d-flex align-items-center justify-content-center bg-light"
                                         style="height: 200px; width: 150px; margin: 0 auto;">
                                        <i class="fas fa-book fa-3x text-muted"></i>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-9">
                            <h5>${book.title}</h5>
                            <p class="text-muted mb-1">by ${book.author}</p>
                            <p class="text-muted mb-1">ISBN: ${book.isbn}</p>
                            <c:if test="${not empty book.publisher}">
                                <p class="text-muted">Publisher: ${book.publisher}</p>
                            </c:if>
                        </div>
                    </div>

                    <form method="POST" action="${pageContext.request.contextPath}/books/edit">
                        <input type="hidden" name="isbn" value="${book.isbn}">

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="isbn" class="form-label">ISBN <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="isbn" name="isbn"
                                           value="${book.isbn}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="categoryId" class="form-label">Category</label>
                                    <select class="form-select" id="categoryId" name="categoryId">
                                        <option value="">Select Category</option>
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.id}"
                                                ${category.id == book.categoryId ? 'selected' : ''}>
                                                    ${category.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="title" class="form-label">Title <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="title" name="title"
                                   value="${book.title}" required>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="author" class="form-label">Author <span class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="author" name="author"
                                           value="${book.author}" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="publisher" class="form-label">Publisher</label>
                                    <input type="text" class="form-control" id="publisher" name="publisher"
                                           value="${book.publisher}">
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3">${book.description}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="imageUrl" class="form-label">Book Cover Image URL</label>
                            <input type="url" class="form-control" id="imageUrl" name="imageUrl"
                                   value="${book.imageUrl}" placeholder="https://example.com/book-cover.jpg">
                            <div class="form-text">Optional: URL to book cover image</div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price ($) <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="price" name="price"
                                           step="0.01" min="0" value="${book.price}" required>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="quantity" class="form-label">Quantity <span class="text-danger">*</span></label>
                                    <input type="number" class="form-control" id="quantity" name="quantity"
                                           required min="0" value="${book.quantity}">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="minStockLevel" class="form-label">Min Stock Level</label>
                                    <input type="number" class="form-control" id="minStockLevel" name="minStockLevel"
                                           min="0" value="${book.minStockLevel}">
                                    <div class="form-text">Alert when stock falls below this level</div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="active" name="active"
                                       value="true" ${book.active ? 'checked' : ''}>
                                <label class="form-check-label" for="active">
                                    Active (available for circulation)
                                </label>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/books" class="btn btn-secondary">
                                <i class="fas fa-times"></i> Cancel
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save"></i> Update
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