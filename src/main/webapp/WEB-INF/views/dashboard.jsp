<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Management Portal - PahanaEdu</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      background: linear-gradient(135deg, var(--surface-light) 0%, var(--subtle-purple) 100%);
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
      color: var(--text-dark);
      min-height: 100vh;
    }

    .main-layout {
      min-height: 100vh;
      display: flex;
    }

    .navigation-panel {
      width: 280px;
      background: linear-gradient(180deg, var(--primary-purple) 0%, var(--dark-purple) 100%);
      box-shadow: 4px 0 20px var(--shadow-light);
      position: fixed;
      height: 100vh;
      z-index: 1000;
    }

    .brand-section {
      padding: 30px 25px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      text-align: center;
    }

    .brand-title {
      color: white;
      font-size: 24px;
      font-weight: 700;
      margin: 0;
      letter-spacing: -0.5px;
    }

    .brand-subtitle {
      color: rgba(255, 255, 255, 0.7);
      font-size: 12px;
      margin-top: 5px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }

    .navigation-menu {
      padding: 20px 0;
    }

    .menu-section {
      margin-bottom: 30px;
    }

    .menu-section-title {
      color: rgba(255, 255, 255, 0.6);
      font-size: 11px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 1.5px;
      margin: 0 25px 15px;
    }

    .nav-item {
      margin: 3px 15px;
    }

    .nav-link {
      display: flex;
      align-items: center;
      padding: 14px 20px;
      color: rgba(255, 255, 255, 0.8);
      text-decoration: none;
      border-radius: 12px;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      font-weight: 500;
      font-size: 14px;
      position: relative;
      overflow: hidden;
    }

    .nav-link::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .nav-link:hover::before,
    .nav-link.active::before {
      opacity: 1;
    }

    .nav-link:hover,
    .nav-link.active {
      color: white;
      transform: translateX(5px);
      text-decoration: none;
    }

    .nav-icon {
      width: 20px;
      margin-right: 15px;
      text-align: center;
      font-size: 16px;
    }

    .content-area {
      flex: 1;
      margin-left: 280px;
      padding: 0;
    }

    .top-bar {
      background: var(--surface-white);
      border-bottom: 1px solid var(--border-light);
      padding: 25px 35px;
      box-shadow: 0 2px 10px var(--shadow-light);
    }

    .page-title {
      font-size: 28px;
      font-weight: 700;
      color: var(--text-dark);
      margin-bottom: 8px;
      letter-spacing: -0.5px;
    }

    .page-description {
      color: var(--text-muted);
      font-size: 15px;
      margin: 0;
    }

    .greeting-text {
      font-size: 16px;
      color: var(--primary-purple);
      font-weight: 600;
    }

    .main-content {
      padding: 35px;
    }

    .content-grid {
      display: grid;
      grid-template-columns: 1fr 400px;
      gap: 30px;
      margin-bottom: 30px;
    }

    .panel {
      background: var(--surface-white);
      border: 1px solid var(--border-light);
      border-radius: 20px;
      box-shadow: 0 8px 25px var(--shadow-light);
      overflow: hidden;
    }

    .panel-header {
      padding: 25px 30px;
      border-bottom: 1px solid var(--border-light);
      background: linear-gradient(135deg, var(--subtle-purple), white);
    }

    .panel-title {
      font-size: 18px;
      font-weight: 700;
      color: var(--text-dark);
      margin: 0;
    }

    .panel-body {
      padding: 0;
    }

    .action-list {
      padding: 20px;
    }

    .action-item {
      display: block;
      padding: 18px 20px;
      margin-bottom: 12px;
      background: var(--surface-light);
      border: 1px solid var(--border-light);
      border-radius: 12px;
      color: var(--text-dark);
      text-decoration: none;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .action-item::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      width: 4px;
      background: linear-gradient(180deg, var(--primary-purple), var(--accent-purple));
      transform: scaleY(0);
      transition: transform 0.3s ease;
    }

    .action-item:hover {
      background: white;
      border-color: var(--light-purple);
      color: var(--text-dark);
      text-decoration: none;
      transform: translateX(8px);
    }

    .action-item:hover::before {
      transform: scaleY(1);
    }

    .action-icon {
      margin-right: 15px;
      color: var(--primary-purple);
      width: 18px;
    }

    .data-table {
      width: 100%;
      margin: 0;
    }

    .data-table thead th {
      background: linear-gradient(135deg, var(--subtle-purple), white);
      border: none;
      padding: 20px 25px;
      color: var(--text-dark);
      font-weight: 700;
      font-size: 12px;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .data-table tbody td {
      padding: 20px 25px;
      border-bottom: 1px solid var(--border-light);
      color: var(--text-dark);
      vertical-align: middle;
    }

    .data-table tbody tr:hover {
      background: var(--subtle-purple);
    }

    .status-pill {
      display: inline-block;
      padding: 6px 14px;
      border-radius: 20px;
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .pill-primary {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      color: white;
    }

    .pill-success {
      background: linear-gradient(135deg, #10b981, #34d399);
      color: white;
    }

    .pill-warning {
      background: linear-gradient(135deg, #f59e0b, #fbbf24);
      color: white;
    }

    .pill-danger {
      background: linear-gradient(135deg, #ef4444, #f87171);
      color: white;
    }

    .empty-state {
      text-align: center;
      padding: 60px 30px;
      color: var(--text-muted);
    }

    .empty-icon {
      font-size: 64px;
      margin-bottom: 20px;
      color: var(--light-purple);
      opacity: 0.6;
    }

    .alert-panel {
      grid-column: 1 / -1;
    }

    .stock-list {
      max-height: 400px;
      overflow-y: auto;
      padding: 20px;
    }

    .stock-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 18px 0;
      border-bottom: 1px solid var(--border-light);
    }

    .stock-item:last-child {
      border-bottom: none;
    }

    .stock-details h6 {
      font-weight: 600;
      color: var(--text-dark);
      margin-bottom: 5px;
      font-size: 14px;
    }

    .stock-details small {
      color: var(--text-muted);
      font-size: 12px;
    }

    .stock-badge {
      padding: 8px 12px;
      border-radius: 8px;
      font-weight: 700;
      font-size: 12px;
    }

    .view-all-btn {
      background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
      color: white;
      border: none;
      padding: 8px 20px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.5px;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .view-all-btn:hover {
      color: white;
      text-decoration: none;
      transform: translateY(-2px);
      box-shadow: 0 4px 15px var(--shadow-medium);
    }

    @media (max-width: 768px) {
      .navigation-panel {
        transform: translateX(-100%);
      }
      .content-area {
        margin-left: 0;
      }
      .content-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>

<div class="main-layout">
  <!-- Navigation Panel -->
  <nav class="navigation-panel">
    <div class="brand-section">
      <h1 class="brand-title">
        <i class="fas fa-gem me-2"></i>
        Pahana Education System
      </h1>
      <div class="brand-subtitle">Management System</div>
    </div>

    <div class="navigation-menu">
      <div class="menu-section">
        <div class="menu-section-title">Main</div>
        <div class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/admin/dashboard">
            <i class="fas fa-tachometer-alt nav-icon"></i>
            Overview
          </a>
        </div>
        <div class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/books">
            <i class="fas fa-book nav-icon"></i>
            Book Catalog
          </a>
        </div>
        <div class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/customers">
            <i class="fas fa-users nav-icon"></i>
            Client Base
          </a>
        </div>
        <div class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/billing/pos">
            <i class="fas fa-cash-register nav-icon"></i>
            Sales Terminal
          </a>
        </div>
      </div>

      <div class="menu-section">
        <div class="menu-section-title">System</div>
        <div class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/logout">
            <i class="fas fa-sign-out-alt nav-icon"></i>
            Sign Out
          </a>
        </div>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <main class="content-area">
    <!-- Top Bar -->
    <header class="top-bar">
      <div class="d-flex justify-content-between align-items-center">
        <div>
          <h1 class="page-title">Management Overview</h1>
          <p class="page-description">Monitor your business performance and key metrics</p>
        </div>
        <div class="text-end">
          <div class="greeting-text" id="timeGreeting">
            Good Morning!
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <section class="main-content">
      <!-- Content Grid -->
      <div class="content-grid">
        <!-- Recent Transactions -->
        <div class="panel">
          <div class="panel-header">
            <div class="d-flex justify-content-between align-items-center">
              <h3 class="panel-title">Recent Transactions</h3>
              <a href="${pageContext.request.contextPath}/admin/reports/sales" class="view-all-btn">
                View All
              </a>
            </div>
          </div>
          <div class="panel-body">
            <c:choose>
              <c:when test="${not empty recentBills}">
                <table class="data-table">
                  <thead>
                  <tr>
                    <th>Transaction</th>
                    <th>Client</th>
                    <th>Amount</th>
                    <th>Time</th>
                    <th>Status</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="bill" items="${recentBills}">
                    <tr>
                      <td><span class="status-pill pill-primary">#${bill.billNumber}</span></td>
                      <td>${not empty bill.customerAccountNumber ? bill.customerAccountNumber : 'Walk-in Customer'}</td>
                      <td class="fw-bold">$<fmt:formatNumber value="${bill.totalAmount}" pattern="#,##0.00"/></td>
                      <td><fmt:formatDate value="${bill.createdAt}" pattern="MMM dd, HH:mm"/></td>
                      <td><span class="status-pill pill-success">Complete</span></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </c:when>
              <c:otherwise>
                <div class="empty-state">
                  <div class="empty-icon">
                    <i class="fas fa-receipt"></i>
                  </div>
                  <p>No recent transactions available</p>
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>

        <!-- Quick Actions Panel -->
        <div class="panel">
          <div class="panel-header">
            <h3 class="panel-title">Quick Actions</h3>
          </div>
          <div class="panel-body">
            <div class="action-list">
              <a href="${pageContext.request.contextPath}/books/add" class="action-item">
                <i class="fas fa-plus action-icon"></i>
                Add New Book
              </a>
              <a href="${pageContext.request.contextPath}/staff" class="action-item">
                <i class="fas fa-user-tie action-icon"></i>
                Staff Management
              </a>
              <a href="${pageContext.request.contextPath}/customers/add" class="action-item">
                <i class="fas fa-user-plus action-icon"></i>
                Register Client
              </a>
              <a href="${pageContext.request.contextPath}/billing/pos" class="action-item">
                <i class="fas fa-cash-register action-icon"></i>
                Process Sale
              </a>
            </div>
          </div>
        </div>
      </div>

      <!-- Stock Alert Panel -->
      <div class="panel alert-panel">
        <div class="panel-header">
          <div class="d-flex justify-content-between align-items-center">
            <h3 class="panel-title">
              <i class="fas fa-exclamation-triangle me-2" style="color: var(--primary-purple);"></i>
              Stock Alerts
            </h3>
            <span class="status-pill pill-warning">${stats.lowStockCount} items</span>
          </div>
        </div>
        <div class="panel-body">
          <c:choose>
            <c:when test="${not empty lowStockBooks}">
              <div class="stock-list">
                <c:forEach var="book" items="${lowStockBooks}">
                  <div class="stock-item">
                    <div class="stock-details">
                      <h6>${book.title}</h6>
                      <small>by ${book.author}</small>
                    </div>
                    <span class="stock-badge ${book.quantity == 0 ? 'pill-danger' : 'pill-warning'} status-pill">
                      ${book.quantity} left
                    </span>
                  </div>
                </c:forEach>
              </div>
            </c:when>
            <c:otherwise>
              <div class="empty-state">
                <div class="empty-icon">
                  <i class="fas fa-check-circle"></i>
                </div>
                <p>All items are adequately stocked!</p>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </section>
  </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Auto refresh every 5 minutes
  setInterval(function() {
    location.reload();
  }, 300000);

  // Sri Lankan time greeting
  function updateGreeting() {
    const now = new Date();
    // Convert to Sri Lanka time (UTC+5:30)
    const sriLankaTime = new Date(now.getTime() + (5.5 * 60 * 60 * 1000));
    const hour = sriLankaTime.getUTCHours();

    let greeting;
    if (hour >= 5 && hour < 12) {
      greeting = "Good Morning!";
    } else if (hour >= 12 && hour < 18) {
      greeting = "Good Afternoon!";
    } else if (hour >= 18 && hour < 22) {
      greeting = "Good Evening!";
    } else {
      greeting = "Good Night!";
    }

    document.getElementById('timeGreeting').textContent = greeting;
  }

  // Update greeting on page load
  document.addEventListener('DOMContentLoaded', function() {
    updateGreeting();
  });
</script>
</body>
</html>