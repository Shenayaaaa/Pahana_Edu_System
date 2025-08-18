<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bills - PahanaEdu POS</title>
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

        .sidebar {
            background: linear-gradient(180deg, var(--primary-purple) 0%, var(--dark-purple) 100%) !important;
            box-shadow: 4px 0 20px var(--shadow-light);
            border-radius: 0 20px 20px 0;
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.8) !important;
            padding: 15px 20px;
            border-radius: 12px;
            margin: 5px 15px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            font-weight: 500;
        }

        .nav-link:hover,
        .nav-link.active {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0.05)) !important;
            color: white !important;
            transform: translateX(8px);
        }

        .nav-link i {
            margin-right: 12px;
            width: 20px;
            text-align: center;
        }

        main {
            background: transparent;
            padding: 30px 40px;
        }

        .h2 {
            color: var(--text-dark);
            font-weight: 800;
            font-size: 2.5rem;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }

        .border-bottom {
            border-color: var(--border-light) !important;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
            border: none;
            border-radius: 12px;
            padding: 12px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px var(--shadow-light);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
            transform: translateY(-2px);
            box-shadow: 0 8px 25px var(--shadow-medium);
        }

        .alert {
            border: none;
            border-radius: 16px;
            padding: 18px 25px;
            box-shadow: 0 4px 15px var(--shadow-light);
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
            border-radius: 20px;
            box-shadow: 0 8px 25px var(--shadow-light);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, var(--subtle-purple), var(--surface-white));
            border-bottom: 1px solid var(--border-light);
            padding: 25px 30px;
        }

        .card-title {
            color: var(--text-dark);
            font-weight: 700;
            font-size: 1.3rem;
            margin-bottom: 0;
        }

        .card-body {
            padding: 0;
        }

        .table {
            margin: 0;
        }

        .table thead th {
            background: linear-gradient(135deg, var(--subtle-purple), var(--surface-white));
            border: none;
            padding: 20px 25px;
            color: var(--text-dark);
            font-weight: 700;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table tbody td {
            padding: 20px 25px;
            border-bottom: 1px solid var(--border-light);
            color: var(--text-dark);
            vertical-align: middle;
        }

        .table-striped > tbody > tr:nth-of-type(odd) > td {
            background: var(--subtle-purple);
        }

        .table-hover tbody tr:hover {
            background: linear-gradient(135deg, var(--subtle-purple), rgba(255, 255, 255, 0.8));
            transform: scale(1.002);
        }

        .badge {
            border-radius: 20px;
            padding: 6px 12px;
            font-weight: 600;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .bg-info {
            background: linear-gradient(135deg, var(--accent-purple), var(--light-purple)) !important;
        }

        .bg-success {
            background: linear-gradient(135deg, #10b981, #34d399) !important;
        }

        .bg-warning {
            background: linear-gradient(135deg, #f59e0b, #fbbf24) !important;
        }

        .bg-danger {
            background: linear-gradient(135deg, #ef4444, #f87171) !important;
        }

        .bg-secondary {
            background: linear-gradient(135deg, var(--text-muted), #9ca3af) !important;
        }

        .text-success {
            color: #10b981 !important;
        }

        .text-muted {
            color: var(--text-muted) !important;
        }

        .btn-group-sm .btn {
            border-radius: 8px;
            margin: 0 2px;
        }

        .btn-outline-primary {
            border-color: var(--primary-purple);
            color: var(--primary-purple);
        }

        .btn-outline-primary:hover {
            background: var(--primary-purple);
            border-color: var(--primary-purple);
        }

        .btn-outline-secondary {
            border-color: var(--text-muted);
            color: var(--text-muted);
        }

        .btn-outline-secondary:hover {
            background: var(--text-muted);
            border-color: var(--text-muted);
        }

        .text-center i.fa-3x {
            color: var(--light-purple) !important;
            margin-bottom: 20px;
            opacity: 0.7;
        }

        .text-center h5 {
            color: var(--text-dark) !important;
            font-weight: 600;
        }

        .text-center p {
            color: var(--text-muted) !important;
        }

        .py-4 {
            padding: 60px 40px !important;
        }

        strong {
            font-weight: 700;
            color: var(--text-dark);
        }

        small {
            font-size: 0.85em;
        }

        .table-responsive {
            border-radius: 0 0 20px 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-md-block bg-light sidebar">
            <div class="position-sticky pt-3">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/books">
                            <i class="fas fa-book"></i> Books
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/billing">
                            <i class="fas fa-receipt"></i> Billing
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/customers">
                            <i class="fas fa-users"></i> Customers
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main content -->
        <main class="col-md-10 ms-sm-auto col-lg-10 px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">Bills</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <a href="${pageContext.request.contextPath}/billing/pos" class="btn btn-primary">
                        <i class="fas fa-plus"></i> New Sale
                    </a>
                </div>
            </div>

            <!-- Alert Messages -->
            <c:if test="${param.message != null}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <c:choose>
                        <c:when test="${param.message == 'bill-created'}">Bill created successfully!</c:when>
                        <c:otherwise>Operation completed successfully!</c:otherwise>
                    </c:choose>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${param.error != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <c:choose>
                        <c:when test="${param.error == 'receipt-not-found'}">Receipt not found!</c:when>
                        <c:when test="${param.error == 'discount-failed'}">Failed to apply discount!</c:when>
                        <c:otherwise>An error occurred!</c:otherwise>
                    </c:choose>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <!-- Bills Table -->
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Recent Bills</h5>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${empty bills}">
                            <div class="text-center py-4">
                                <i class="fas fa-receipt fa-3x text-muted mb-3"></i>
                                <h5 class="text-muted">No bills found</h5>
                                <p class="text-muted">Start by creating your first sale.</p>
                                <a href="${pageContext.request.contextPath}/billing/pos" class="btn btn-primary">
                                    <i class="fas fa-plus"></i> Create New Sale
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                    <tr>
                                        <th>Bill #</th>
                                        <th>Customer</th>
                                        <th>Date</th>
                                        <th>Items</th>
                                        <th>Subtotal</th>
                                        <th>Tax</th>
                                        <th>Discount</th>
                                        <th>Total</th>
                                        <th>Payment</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="bill" items="${bills}">
                                        <tr>
                                            <td>
                                                <strong>${bill.billNumber}</strong>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty bill.customerName}">
                                                        ${bill.customerName}
                                                        <br><small class="text-muted">${bill.customerAccountNumber}</small>
                                                    </c:when>
                                                    <c:when test="${not empty bill.customerAccountNumber}">
                                                        ${bill.customerAccountNumber}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">Walk-in</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${bill.billDate}" pattern="MMM dd, yyyy"/>
                                                <br><small class="text-muted">
                                                <fmt:formatDate value="${bill.billDate}" pattern="HH:mm"/>
                                            </small>
                                            </td>
                                            <td>
                                                        <span class="badge bg-info">
                                                            ${not empty bill.billItems ? bill.billItems.size() : 0} items
                                                        </span>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${bill.subtotal}" type="currency" currencySymbol="$"/>
                                            </td>
                                            <td>
                                                <fmt:formatNumber value="${bill.taxAmount}" type="currency" currencySymbol="$"/>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${bill.discountAmount > 0}">
                                                                <span class="text-success">
                                                                    -<fmt:formatNumber value="${bill.discountAmount}" type="currency" currencySymbol="$"/>
                                                                </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <strong>
                                                    <fmt:formatNumber value="${bill.totalAmount}" type="currency" currencySymbol="$"/>
                                                </strong>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty bill.paymentMethod}">
                                                        <span class="badge bg-secondary">${bill.paymentMethod}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${bill.paymentStatus == 'PAID'}">
                                                        <span class="badge bg-success">Paid</span>
                                                    </c:when>
                                                    <c:when test="${bill.paymentStatus == 'PENDING'}">
                                                        <span class="badge bg-warning">Pending</span>
                                                    </c:when>
                                                    <c:when test="${bill.paymentStatus == 'CANCELLED'}">
                                                        <span class="badge bg-danger">Cancelled</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge bg-secondary">Unknown</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <div class="btn-group btn-group-sm">
                                                    <a href="${pageContext.request.contextPath}/billing/receipt?billId=${bill.billId}"
                                                       class="btn btn-outline-primary btn-sm" title="View Receipt">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/billing/receipt?billId=${bill.billId}&print=true"
                                                       class="btn btn-outline-secondary btn-sm" title="Print Receipt">
                                                        <i class="fas fa-print"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>