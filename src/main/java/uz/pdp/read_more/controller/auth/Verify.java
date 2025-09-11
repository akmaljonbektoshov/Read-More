package uz.pdp.read_more.controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import uz.pdp.read_more.dao.UserDAO;
import uz.pdp.read_more.dto.RegisterDto;
import uz.pdp.read_more.entity.User;

import java.io.IOException;


@WebServlet("/verify")
public class Verify extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.getRequestDispatcher().forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer code = Integer.parseInt(req.getParameter("code"));
        HttpSession session = req.getSession();
        Object object = session.getAttribute("registerDto");
        if (object == null) {
            resp.sendRedirect("/register");
            return;
        }

        RegisterDto registerDto = (RegisterDto) object;
        if (!registerDto.getOtp().equals(code)) {
            resp.sendRedirect("/login");
            return;
        }

        User user = User.builder()
                .fullName(registerDto.getFullName())
                .email(registerDto.getEmail())
                .password(registerDto.getPassword())

                .build();

        UserDAO.getInstance().save(user);
        resp.sendRedirect("/login");

    }
}