package uz.pdp.read_more.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

@WebFilter("/*")
public class MyFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        String path = req.getServletPath();

        if (path.endsWith(".jsp")) {
            req.setAttribute("message", "You can't open .jsp pages directly from browser.");
            req.getRequestDispatcher("index.jsp").forward(req, servletResponse);
            return;
        }


        filterChain.doFilter(servletRequest, servletResponse);
    }
}
