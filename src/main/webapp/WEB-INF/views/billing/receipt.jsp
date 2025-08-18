<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt - PahanaEdu POS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
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

        .nav-link {
            color: rgba(255, 255, 255, 0.9) !important;
            font-weight: 500;
            border-radius: 20px;
            padding: 0.5rem 1rem !important;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.2);
            color: white !important;
        }

        .receipt-wrapper {
            max-width: 800px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .receipt-container {
            background: var(--surface-white);
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            overflow: hidden;
            position: relative;
        }

        .receipt-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, var(--accent-purple), var(--light-purple));
        }

        .receipt-header {
            background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple));
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .receipt-body {
            padding: 2rem;
        }

        .company-info {
            text-align: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 2px solid var(--border-light);
            position: relative;
        }

        .company-info::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 2px;
            background: linear-gradient(135deg, var(--accent-purple), var(--light-purple));
        }

        .company-info h4 {
            color: var(--primary-purple);
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .bill-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
            padding: 1.5rem;
            background: linear-gradient(145deg, var(--surface-light), var(--subtle-purple));
            border-radius: 12px;
            box-shadow: 0 4px 15px var(--shadow-light);
        }

        .bill-info strong {
            color: var(--primary-purple);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
        }

        .items-table {
            margin: 2rem 0;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px var(--shadow-light);
        }

        .items-table table {
            margin: 0;
        }

        .items-table th {
            background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
            color: white;
            font-weight: 600;
            border: none;
            padding: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.9rem;
        }

        .items-table td {
            border: none;
            padding: 1rem;
            border-bottom: 1px solid var(--border-light);
        }

        .items-table tbody tr {
            background: var(--surface-white);
            transition: all 0.3s ease;
        }

        .items-table tbody tr:nth-child(even) {
            background: var(--surface-light);
        }

        .items-table tbody tr:hover {
            background: var(--subtle-purple);
            transform: translateX(2px);
        }

        .totals-section {
            background: linear-gradient(145deg, var(--surface-light), var(--subtle-purple));
            padding: 2rem;
            border-radius: 12px;
            margin-top: 2rem;
            box-shadow: 0 8px 25px var(--shadow-light);
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0.75rem 0;
            padding: 0.5rem 0;
            border-bottom: 1px solid var(--border-light);
        }

        .total-row:last-child {
            border-bottom: none;
        }

        .total-row.final {
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--primary-purple);
            border-top: 2px solid var(--primary-purple);
            padding-top: 1rem;
            margin-top: 1rem;
            border-bottom: none;
        }

        .footer-info {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 2px dashed var(--border-light);
            color: var(--text-muted);
        }

        .action-buttons {
            text-align: center;
            margin: 2rem 0;
            padding: 2rem 0;
        }

        .btn {
            border-radius: 25px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            margin: 0 0.5rem;
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

        .btn-secondary {
            background: linear-gradient(135deg, var(--text-muted), #5a6268);
        }

        .btn-secondary:hover {
            transform: translateY(-2px);
        }

        .btn-success {
            background: linear-gradient(135deg, #10b981, #34d399);
        }

        .btn-success:hover {
            transform: translateY(-2px);
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

        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-paid {
            background: linear-gradient(135deg, #10b981, #34d399);
            color: white;
        }

        .status-pending {
            background: linear-gradient(135deg, #f59e0b, #fbbf24);
            color: white;
        }

        .card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--card-shadow);
            background: var(--surface-white);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-purple), var(--light-purple));
            color: white;
            border: none;
            font-weight: 600;
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

        .btn-warning {
            background: linear-gradient(135deg, #f59e0b, #fbbf24);
            border: none;
            color: white;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(245, 158, 11, 0.3);
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

        .no-print {
            display: block;
        }

        @media print {
            .no-print {
                display: none !important;
            }

            .receipt-container {
                box-shadow: none;
                border: none;
                margin: 0;
                max-width: none;
            }

            body {
                background: white;
                margin: 0;
                padding: 0;
            }

            .receipt-wrapper {
                margin: 0;
                padding: 0;
            }
        }

        @media (max-width: 768px) {
            .bill-info {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .receipt-body {
                padding: 1rem;
            }

            .items-table th,
            .items-table td {
                padding: 0.75rem 0.5rem;
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
<div class="container-fluid">
    <nav class="navbar navbar-expand-lg navbar-dark no-print">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <i class="fas fa-book-open"></i> Pahana Edu Book Shop
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/billing">
                    <i class="fas fa-arrow-left"></i> Back to Billing
                </a>
            </div>
        </div>
    </nav>

    <c:if test="${param.success eq 'discount-applied'}">
        <div class="alert alert-success alert-dismissible fade show no-print" role="alert">
            <i class="fas fa-check-circle"></i> Discount applied successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>

    <div class="receipt-wrapper">
        <div class="receipt-container">
            <div class="receipt-header">
                <h2><i class="fas fa-receipt"></i> RECEIPT</h2>
                <p class="mb-0">Thank you for your purchase!</p>
            </div>

            <div class="receipt-body">
                <div class="company-info">
                    <h4>PahanaEdu Bookstore</h4>
                    <p class="mb-1">12/A Amster Street, Soul Society</p>
                    <p class="mb-1">Phone: (+94) 701234567 | Email: info@pahanaedu.com</p>
                    <p class="mb-0">Website: www.pahanaedu.com</p>
                </div>

                <div class="bill-info">
                    <div>
                        <strong>Bill Number:</strong><br>
                        <span class="text-primary">${bill.billNumber}</span>
                    </div>
                    <div>
                        <strong>Date:</strong><br>
                        <fmt:formatDate value="${bill.createdAt}" pattern="MMM dd, yyyy HH:mm"/>
                    </div>
                    <div>
                        <strong>Customer:</strong><br>
                        <c:choose>
                            <c:when test="${not empty customer}">
                                ${customer.name}<br>
                                <small>Acc: ${customer.accountNumber}</small>
                            </c:when>
                            <c:otherwise>
                                Walk-in Customer
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <strong>Payment Status:</strong><br>
                        <span class="status-badge ${bill.paymentStatus eq 'PAID' ? 'status-paid' : 'status-pending'}">
                            <i class="fas ${bill.paymentStatus eq 'PAID' ? 'fa-check-circle' : 'fa-clock'}"></i>
                            ${bill.paymentStatus}
                        </span>
                    </div>
                </div>

                <div class="items-table">
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Book Details</th>
                            <th class="text-center">Qty</th>
                            <th class="text-end">Unit Price</th>
                            <th class="text-end">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${bill.billItems}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td>
                                    <strong>${item.bookTitle}</strong><br>
                                    <small class="text-muted">ISBN: ${item.isbn}</small>
                                </td>
                                <td class="text-center">${item.quantity}</td>
                                <td class="text-end">
                                    <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="$"/>
                                </td>
                                <td class="text-end">
                                    <fmt:formatNumber value="${item.totalPrice}" type="currency" currencySymbol="$"/>
                                    <c:if test="${item.discountAmount gt 0}">
                                        <br><small class="text-success">
                                        -<fmt:formatNumber value="${item.discountAmount}" type="currency" currencySymbol="$"/>
                                    </small>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="totals-section">
                    <div class="total-row">
                        <span>Subtotal:</span>
                        <span><fmt:formatNumber value="${bill.subtotal}" type="currency" currencySymbol="$"/></span>
                    </div>

                    <c:if test="${bill.discountAmount gt 0}">
                        <div class="total-row text-success">
                            <span>Discount:</span>
                            <span>-<fmt:formatNumber value="${bill.discountAmount}" type="currency" currencySymbol="$"/></span>
                        </div>
                    </c:if>

                    <div class="total-row">
                        <span>Tax (10%):</span>
                        <span><fmt:formatNumber value="${bill.taxAmount}" type="currency" currencySymbol="$"/></span>
                    </div>

                    <div class="total-row final">
                        <span>TOTAL AMOUNT:</span>
                        <span><fmt:formatNumber value="${bill.totalAmount}" type="currency" currencySymbol="$"/></span>
                    </div>

                    <c:if test="${not empty bill.paymentMethod}">
                        <div class="total-row" style="margin-top: 10px;">
                            <span>Payment Method:</span>
                            <span class="text-capitalize">${bill.paymentMethod}</span>
                        </div>
                    </c:if>
                </div>

                <c:if test="${not empty bill.notes}">
                    <div class="mt-3">
                        <strong>Notes:</strong>
                        <p class="mb-0 text-muted">${bill.notes}</p>
                    </div>
                </c:if>

                <div class="footer-info">
                    <p><strong>Thank you for shopping with PahanaEdu!</strong></p>
                    <p class="mb-1">
                        <i class="fas fa-undo"></i> Return Policy: Items can be returned within 30 days with receipt
                    </p>
                    <p class="mb-1">
                        <i class="fas fa-phone"></i> Customer Service: (+94) 701122526
                    </p>
                    <p class="mb-0">
                        <i class="fas fa-globe"></i> Visit us online: www.pahanaedu.com
                    </p>
                </div>
            </div>
        </div>

        <div class="action-buttons no-print">
            <button onclick="window.print()" class="btn btn-primary btn-lg me-2">
                <i class="fas fa-print"></i> Print Receipt
            </button>
            <button onclick="downloadPDF()" class="btn btn-secondary btn-lg me-2">
                <i class="fas fa-download"></i> Download PDF
            </button>
            <a href="${pageContext.request.contextPath}/billing/pos" class="btn btn-success btn-lg me-2">
                <i class="fas fa-plus"></i> New Sale
            </a>
            <a href="${pageContext.request.contextPath}/billing" class="btn btn-outline-primary btn-lg">
                <i class="fas fa-list"></i> View All Bills
            </a>
        </div>

        <c:if test="${bill.paymentStatus eq 'PAID'}">
            <div class="card mt-4 no-print">
                <div class="card-header">
                    <h5><i class="fas fa-percent"></i> Apply Additional Discount</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/billing/apply-discount" method="post">
                        <input type="hidden" name="billId" value="${bill.billNumber}">

                        <div class="row">
                            <div class="col-md-4">
                                <label for="discountType" class="form-label">Discount Type</label>
                                <select class="form-select" id="discountType" name="discountType" required>
                                    <option value="">Select Type</option>
                                    <option value="percentage">Percentage (%)</option>
                                    <option value="fixed">Fixed Amount ($)</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="discountValue" class="form-label">Discount Value</label>
                                <input type="number" class="form-control" id="discountValue" name="discountValue"
                                       step="0.01" min="0" max="100" required>
                            </div>
                            <div class="col-md-4 d-flex align-items-end">
                                <button type="submit" class="btn btn-warning w-100">
                                    <i class="fas fa-percent"></i> Apply Discount
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

<script>
    setTimeout(function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            const bsAlert = new bootstrap.Alert(alert);
            bsAlert.close();
        });
    }, 5000);

    function downloadPDF() {
        const { jsPDF } = window.jspdf;
        const receipt = document.querySelector('.receipt-container');

        html2canvas(receipt, {
            scale: 2,
            useCORS: true,
            allowTaint: true
        }).then(canvas => {
            const imgData = canvas.toDataURL('image/png');
            const pdf = new jsPDF('p', 'mm', 'a4');

            const imgWidth = 210;
            const pageHeight = 295;
            const imgHeight = (canvas.height * imgWidth) / canvas.width;
            let heightLeft = imgHeight;

            let position = 0;

            pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;

            while (heightLeft >= 0) {
                position = heightLeft - imgHeight;
                pdf.addPage();
                pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
            }

            pdf.save('receipt-${bill.billNumber}.pdf');
        }).catch(error => {
            console.error('Error generating PDF:', error);
            alert('Error generating PDF. Please try printing instead.');
        });
    }

    document.getElementById('discountType')?.addEventListener('change', function() {
        const valueInput = document.getElementById('discountValue');
        const type = this.value;

        if (type === 'percentage') {
            valueInput.max = '100';
            valueInput.placeholder = 'Enter percentage (0-100)';
        } else if (type === 'fixed') {
            valueInput.max = '${bill.subtotal}';
            valueInput.placeholder = 'Enter amount';
        }
    });

    window.addEventListener('beforeprint', function() {
        document.body.style.margin = '0';
        document.body.style.padding = '0';
    });

    window.addEventListener('afterprint', function() {
        document.body.style.margin = '';
        document.body.style.padding = '';
    });
</script>
</body>
</html>