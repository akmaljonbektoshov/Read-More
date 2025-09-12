package uz.pdp.read_more.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.read_more.dao.BookDAO;
import uz.pdp.read_more.entity.Book;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet("/admin/books")
public class AdminController extends HttpServlet {

    private static final int DEFAULT_PAGE_SIZE = 6;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageParam = req.getParameter("page");
        String q = req.getParameter("q");
        int page = 1;
        int size = DEFAULT_PAGE_SIZE;

        try {
            if (pageParam != null) page = Math.max(1, Integer.parseInt(pageParam));
        } catch (NumberFormatException ignored) {
            page = 1;
        }

        BookDAO bookDAO = BookDAO.getInstance();
        List<Book> pageBooks = new ArrayList<>();
        int totalPages = 1;

        if (q != null && !q.trim().isEmpty()) {
            // Search mode: get matched books then paginate in-memory
            List<Book> matched = bookDAO.findAllByNameContaining(q.trim());
            int total = matched.size();
            totalPages = (int) Math.ceil((double) total / size);
            if (totalPages == 0) totalPages = 1;

            int from = (page - 1) * size;
            int to = Math.min(from + size, total);
            if (from < total) pageBooks = matched.subList(from, to);
            else pageBooks = new ArrayList<>();
        } else {
            // Normal DB-side pagination
            pageBooks = bookDAO.findAll(page, size);
            long total = bookDAO.count();
            totalPages = (int) Math.ceil((double) total / size);
            if (totalPages == 0) totalPages = 1;
        }

        req.setAttribute("books", pageBooks);
        req.setAttribute("currentPage", page);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("q", q == null ? "" : q.trim());

        req.getRequestDispatcher("/admin.jsp").forward(req, resp);
    }

    /**
     * Handles create / update / delete actions.
     * Expect parameter "action" with values: create | update | delete
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = safeTrim(req.getParameter("action"));
        if (action.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/admin/books");
            return;
        }

        BookDAO bookDAO = BookDAO.getInstance();

        try {
            switch (action) {
                case "create": {
                    Book newBook = readBookFromRequest(req, false);
                    bookDAO.save(newBook);
                    break;
                }

                case "update": {
                    Book updatedBook = readBookFromRequest(req, true);
                    bookDAO.update(updatedBook);
                    break;
                }

                case "delete": {
                    String idStr = req.getParameter("id");
                    if (idStr != null && !idStr.isEmpty()) {
                        try {
                            Long id = Long.parseLong(idStr);
                            bookDAO.delete(id);
                        } catch (NumberFormatException ignored) { /* ignore */ }
                    }
                    break;
                }

                default:
                    // unknown action
                    break;
            }
        } catch (Exception e) {
            // log and set error attribute so admin.jsp can show message if you want
            e.printStackTrace();
            req.setAttribute("error", "Server error: " + e.getMessage());
            // forward to admin page to show error (or you can redirect)
            req.getRequestDispatcher("/admin.jsp").forward(req, resp);
            return;
        }

        // redirect back to admin list; preserve page param if exists
        String currentPage = req.getParameter("currentPage");
        if (currentPage == null || currentPage.isEmpty()) currentPage = "1";
        resp.sendRedirect(req.getContextPath() + "/admin/books?page=" + currentPage);
    }

    /**
     * Build Book from request params. If forUpdate==true, tries to load existing entity by id and update it.
     */
    private Book readBookFromRequest(HttpServletRequest req, boolean forUpdate) {
        String idStr = req.getParameter("id");
        String title = safeTrim(req.getParameter("title"));
        String author = safeTrim(req.getParameter("author"));
        String genre = safeTrim(req.getParameter("genre"));
        String description = safeTrim(req.getParameter("description"));
        String priceStr = safeTrim(req.getParameter("price"));

        BigDecimal price = null;
        if (!priceStr.isEmpty()) {
            try {
                // normalize comma decimal separators if user used comma
                price = new BigDecimal(priceStr.replace(",", "."));
            } catch (NumberFormatException ignored) {
                price = null;
            }
        }

        Book book;
        if (forUpdate && idStr != null && !idStr.isEmpty()) {
            try {
                Long id = Long.parseLong(idStr);
                Optional<Book> opt = BookDAO.getInstance().findById(id);
                if (opt.isPresent()) {
                    book = opt.get();
                } else {
                    book = new Book();
                    book.setId(id); // set id so merge/update can work (depends on DAO impl)
                }
            } catch (NumberFormatException ex) {
                book = new Book();
            }
        } else {
            book = new Book();
        }

        // set fields
        book.setTitle(title);
        book.setAuthor(author);
        book.setGenre(genre);
        book.setDescription(description);
        if (price != null) book.setPrice(price);

        return book;
    }

    private String safeTrim(String s) {
        return s == null ? "" : s.trim();
    }
}
