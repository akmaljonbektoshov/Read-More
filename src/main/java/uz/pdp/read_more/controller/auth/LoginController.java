package uz.pdp.read_more.controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.read_more.dao.UserDAO;
import uz.pdp.read_more.entity.User;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Optional<User> userOptional = UserDAO.getInstance().findByEmail(email);
        if (!userOptional.isPresent()) {
            resp.sendRedirect("/login");
        }
        User user = userOptional.get();
        if (!password.equals(user.getPassword())) {
            resp.sendRedirect("/login");
            return;
        }
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        resp.sendRedirect("/cabinet");
    }
}
