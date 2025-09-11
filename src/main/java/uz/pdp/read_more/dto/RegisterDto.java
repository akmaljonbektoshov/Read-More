package uz.pdp.read_more.dto;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterDto {
    private String fullName;
    private String email;
    private String password;
    private Integer otp;

    public RegisterDto(HttpServletRequest request) {
        this.fullName = request.getParameter("fullName");
        this.email = request.getParameter("email");
        this.password = request.getParameter("password");
    }
}

