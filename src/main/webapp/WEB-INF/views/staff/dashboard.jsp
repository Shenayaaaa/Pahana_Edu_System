<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-purple: #6a4c93;
            --dark-purple: #4a306d;
            --light-purple: #8e7cc3;
            --accent-purple: #9d8df1;
            --subtle-purple: #f0ecff;
            --surface-white: #ffffff;
            --surface-light: #f8f9fe;
            --text-dark: #2d1b4e;
            --text-muted: #6c757d;
            --shadow-light: rgba(106, 76, 147, 0.1);
            --shadow-medium: rgba(106, 76, 147, 0.2);
            --border-light: #e5e1f7;
        }

        body {
            background: radial-gradient(ellipse at top, var(--subtle-purple), var(--surface-light)) !important;
            min-height: 100vh;
            font-family: 'Segoe UI', sans-serif;
        }

        .navbar-dark.bg-dark {
            background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple)) !important;
            border-bottom: none;
            box-shadow: 0 8px 32px var(--shadow-medium);
        }

        .navbar-brand {
            font-weight: 800;
            color: white !important;
            font-size: 1.5rem;
        }

        .navbar-text {
            background: rgba(255, 255, 255, 0.15);
            padding: 0.75rem 1.25rem !important;
            border-radius: 25px !important;
            color: white !important;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .btn-outline-light {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
            border-radius: 20px;
            font-weight: 600;
            backdrop-filter: blur(10px);
        }

        .btn-outline-light:hover {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border-color: rgba(255, 255, 255, 0.5);
        }

        .main-grid {
            display: grid;
            grid-template-columns: 1fr 300px;
            gap: 2rem;
            margin-top: 2rem;
        }

        .hero-welcome {
            background: linear-gradient(135deg, var(--primary-purple), var(--accent-purple));
            border-radius: 30px;
            padding: 3rem 2.5rem;
            color: white;
            position: relative;
            overflow: hidden;
            margin-bottom: 2rem;
            grid-column: 1 / -1;
        }

        .hero-welcome::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 900;
            margin-bottom: 0.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .hero-subtitle {
            font-size: 1.3rem;
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        .hero-date {
            background: rgba(255, 255, 255, 0.2);
            padding: 1rem 1.5rem;
            border-radius: 20px;
            display: inline-block;
            backdrop-filter: blur(10px);
            font-weight: 600;
        }

        .content-area {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .sidebar-area {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .pos-mega-section {
            background: linear-gradient(135deg, var(--dark-purple), var(--primary-purple));
            border-radius: 25px;
            padding: 2.5rem;
            color: white;
            position: relative;
        }

        .pos-mega-title {
            font-size: 2.2rem;
            font-weight: 800;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .pos-mega-desc {
            font-size: 1.1rem;
            opacity: 0.85;
            margin-bottom: 2.5rem;
        }

        .pos-action-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .pos-action-tile {
            background: rgba(255, 255, 255, 0.15);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2rem 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
            backdrop-filter: blur(15px);
        }

        .pos-action-tile:hover {
            background: rgba(255, 255, 255, 0.25);
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .pos-icon-large {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
        }

        .pos-tile-title {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .pos-tile-desc {
            opacity: 0.8;
            margin-bottom: 1.5rem;
            font-size: 0.9rem;
        }

        .btn-pos-action {
            background: rgba(255, 255, 255, 0.2);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
            border-radius: 15px;
            font-weight: 600;
            padding: 0.75rem 1.5rem;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-pos-action:hover {
            background: rgba(255, 255, 255, 0.35);
            color: white;
            transform: translateY(-2px);
        }

        .actions-mosaic {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        .action-tile {
            background: var(--surface-white);
            border: 3px solid var(--border-light);
            border-radius: 20px;
            padding: 2rem 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .action-tile::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-purple), var(--accent-purple));
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .action-tile:hover::before {
            transform: scaleX(1);
        }

        .action-tile:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px var(--shadow-medium);
            border-color: var(--primary-purple);
        }

        .action-icon-box {
            width: 75px;
            height: 75px;
            background: linear-gradient(135deg, var(--subtle-purple), var(--border-light));
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            transition: all 0.3s ease;
        }

        .action-tile:hover .action-icon-box {
            background: linear-gradient(135deg, var(--primary-purple), var(--accent-purple));
            color: white;
            transform: scale(1.15) rotate(5deg);
        }

        .action-tile-title {
            font-weight: 700;
            font-size: 1.1rem;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .action-tile-desc {
            color: var(--text-muted);
            font-size: 0.85rem;
        }

        .sidebar-widget {
            background: var(--surface-white);
            border: 2px solid var(--border-light);
            border-radius: 25px;
            overflow: hidden;
            box-shadow: 0 10px 30px var(--shadow-light);
        }

        .widget-header {
            background: linear-gradient(135deg, var(--light-purple), var(--accent-purple));
            color: white;
            padding: 1.5rem 2rem;
            border-bottom: none;
        }

        .widget-title {
            font-size: 1.2rem;
            font-weight: 700;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .widget-body {
            padding: 1.5rem 2rem;
            max-height: 300px;
            overflow-y: auto;
        }

        .recent-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid var(--border-light);
        }

        .recent-item:last-child {
            border-bottom: none;
        }

        .recent-main {
            flex: 1;
        }

        .recent-name {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.25rem;
        }

        .recent-meta {
            color: var(--text-muted);
            font-size: 0.85rem;
        }

        .recent-value {
            text-align: right;
        }

        .recent-amount {
            font-weight: 700;
            color: var(--primary-purple);
            margin-bottom: 0.25rem;
        }

        .recent-date {
            color: var(--text-muted);
            font-size: 0.8rem;
        }

        .empty-state {
            text-align: center;
            color: var(--text-muted);
            padding: 2rem 0;
            font-style: italic;
        }

        @media (max-width: 992px) {
            .main-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .hero-title {
                font-size: 2.2rem;
            }

            .pos-action-grid {
                grid-template-columns: 1fr;
            }

            .actions-mosaic {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .actions-mosaic {
                grid-template-columns: 1fr;
            }

            .hero-welcome {
                padding: 2rem 1.5rem;
            }

            .hero-title {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">
            <i class="fas fa-gem"></i> Pahana Edu Book Store
        </a>
        <div class="navbar-nav ms-auto">
            <span class="navbar-text me-3">
                Hiii, ${sessionScope.currentUser.fullName}! (${sessionScope.userRole})
            </span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light">
                <i class="fas fa-sign-out-alt"></i> Logout
            </a>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="main-grid">
        <!-- Hero Welcome Section -->
        <div class="hero-welcome">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <h1 class="hero-title">
                        <i class="fas fa-tachometer-alt"></i> Staff Dashboard
                    </h1>
                    <p class="hero-subtitle">Welcome back, ${sessionScope.currentUser.fullName}</p>
                </div>
                <div class="col-lg-4 text-end">
                </div>
            </div>
        </div>

        <!-- Main Content Area -->
        <div class="content-area">
            <!-- POS Mega Section -->
            <div class="pos-mega-section">
                <h2 class="pos-mega-title">
                    <i class="fas fa-cash-register"></i> Point of Sale System
                </h2>
                <p class="pos-mega-desc">
                    Generate bills, manage transactions, and process customer payments efficiently.
                </p>

                <div class="pos-action-grid">
                    <div class="pos-action-tile">
                        <div class="pos-icon-large">
                            <i class="fas fa-plus-circle"></i>
                        </div>
                        <h5 class="pos-tile-title">Cart is Here</h5>
                        <p class="pos-tile-desc">Start a new transaction</p>
                        <a href="${pageContext.request.contextPath}/billing/new" class="btn-pos-action">
                            <i class="fas fa-shopping-cart me-2"></i>Start Sale
                        </a>
                    </div>

                    <div class="pos-action-tile">
                        <div class="pos-icon-large">
                            <i class="fas fa-receipt"></i>
                        </div>
                        <h5 class="pos-tile-title">View Bills</h5>
                        <p class="pos-tile-desc">Browse transaction history</p>
                        <a href="${pageContext.request.contextPath}/billing" class="btn-pos-action">
                            <i class="fas fa-eye me-2"></i>View All
                        </a>
                    </div>
                </div>
            </div>

            <!-- Quick Actions Mosaic -->
            <div class="actions-mosaic">
                <div class="action-tile" onclick="window.location.href='${pageContext.request.contextPath}/customers/add'">
                    <div class="action-icon-box">
                        <i class="fas fa-user-plus text-primary"></i>
                    </div>
                    <h6 class="action-tile-title">Add Customer</h6>
                    <p class="action-tile-desc">Register new customer</p>
                </div>

                <div class="action-tile" onclick="window.location.href='${pageContext.request.contextPath}/books/add'">
                    <div class="action-icon-box">
                        <i class="fas fa-book-medical text-success"></i>
                    </div>
                    <h6 class="action-tile-title">Add Book</h6>
                    <p class="action-tile-desc">Add new book to inventory</p>
                </div>

                <div class="action-tile" onclick="window.location.href='${pageContext.request.contextPath}/customers'">
                    <div class="action-icon-box">
                        <i class="fas fa-users text-info"></i>
                    </div>
                    <h6 class="action-tile-title">Manage Customers</h6>
                    <p class="action-tile-desc">View and edit customers</p>
                </div>

                <div class="action-tile" onclick="window.location.href='${pageContext.request.contextPath}/books'">
                    <div class="action-icon-box">
                        <i class="fas fa-warehouse text-warning"></i>
                    </div>
                    <h6 class="action-tile-title">Manage Inventory</h6>
                    <p class="action-tile-desc">View and edit books</p>
                </div>
            </div>
        </div>

        <!-- Sidebar Area -->
        <div class="sidebar-area">
            <!-- Recent Customers Widget -->
            <div class="sidebar-widget">
                <div class="widget-header">
                    <h6 class="widget-title">
                        <i class="fas fa-clock"></i> Recent Customers
                    </h6>
                </div>
                <div class="widget-body">
                    <c:choose>
                        <c:when test="${not empty recentCustomers}">
                            <c:forEach var="customer" items="${recentCustomers}">
                                <div class="recent-item">
                                    <div class="recent-main">
                                        <div class="recent-name">${customer.name}</div>
                                        <div class="recent-meta">${customer.accountNumber}</div>
                                    </div>
                                    <div class="recent-value">
                                        <div class="recent-date">
                                            <fmt:formatDate value="${customer.createdDateAsDate}" pattern="MMM dd"/>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">No recent customers</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!-- Recent Bills Widget -->
            <div class="sidebar-widget">
                <div class="widget-header">
                    <h6 class="widget-title">
                        <i class="fas fa-chart-line"></i> Recent Bills
                    </h6>
                </div>
                <div class="widget-body">
                    <c:choose>
                        <c:when test="${not empty recentBills}">
                            <c:forEach var="bill" items="${recentBills}">
                                <div class="recent-item">
                                    <div class="recent-main">
                                        <div class="recent-name">${bill.billId}</div>
                                        <div class="recent-meta">${bill.customerName}</div>
                                    </div>
                                    <div class="recent-value">
                                        <div class="recent-amount">
                                            $<fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/>
                                        </div>
                                        <div class="recent-date">
                                            <fmt:formatDate value="${bill.billDateAsDate}" pattern="MMM dd"/>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="empty-state">No recent bills</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>