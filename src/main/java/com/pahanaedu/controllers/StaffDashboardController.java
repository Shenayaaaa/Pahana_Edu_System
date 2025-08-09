package com.pahanaedu.controllers;

import com.pahanaedu.entities.Book;
import com.pahanaedu.services.BookService;
import com.pahanaedu.services.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/staff/dashboard")
public class StaffDashboardController extends HttpServlet {
    private BookService bookService;

    @Override
    public void init() throws ServletException {
        bookService = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String userRole = (String) session.getAttribute("userRole");
        if (!"STAFF".equals(userRole)) {
            response.sendRedirect(request.getContextPath() + "/dashboard");
            return;
        }

        try {
            List<Book> allBooks = bookService.findAll();
            List<Book> lowStockBooks = bookService.findLowStockBooks();

            long totalBooks = allBooks.size();
            long activeBooks = allBooks.stream()
                    .mapToLong(book -> book.isActive() ? 1 : 0)
                    .sum();
            long lowStockCount = lowStockBooks.size();

            List<Book> recentBooks = allBooks.size() > 5 ?
                    allBooks.subList(Math.max(0, allBooks.size() - 5), allBooks.size()) :
                    allBooks;


            List<Book> lowStockAlerts = lowStockBooks.size() > 10 ?
                    lowStockBooks.subList(0, 10) :
                    lowStockBooks;

            request.setAttribute("totalBooks", totalBooks);
            request.setAttribute("activeBooks", activeBooks);
            request.setAttribute("lowStockBooks", lowStockCount);
            request.setAttribute("recentBooks", recentBooks);
            request.setAttribute("lowStockAlerts", lowStockAlerts);

            request.getRequestDispatcher("/WEB-INF/views/staff/dashboard.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("totalBooks", 0L);
            request.setAttribute("activeBooks", 0L);
            request.setAttribute("lowStockBooks", 0L);
            request.getRequestDispatcher("/WEB-INF/views/staff/dashboard.jsp").forward(request, response);
        }
    }
}