package uz.pdp.read_more.controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.pdp.read_more.dto.RegisterDto;
import uz.pdp.read_more.service.MailService;

import java.io.IOException;
import java.util.Random;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RegisterDto registerDto = new RegisterDto(req);

        Random random = new Random();
        int randomCode = random.nextInt(1000, 9999);
        registerDto.setOtp(randomCode);
        req.getSession().setAttribute("registerDto", registerDto);

        Thread thread = new Thread(() ->
                MailService.sendCode(registerDto.getEmail(), registerDto.getOtp())
        );
        thread.start();

        req.getRequestDispatcher("/verify").forward(req, resp);
    }
}
