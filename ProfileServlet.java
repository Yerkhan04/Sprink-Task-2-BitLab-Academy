package Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser =(User) req.getSession().getAttribute("CURRENT_USER");
        if(currentUser!=null){
            req.getRequestDispatcher("/profile.jsp").forward(req,resp);
        }else{
            resp.sendRedirect("/login");
        }
    }
}
