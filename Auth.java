package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet("/auth")
public class Auth extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email= req.getParameter("email");
        String password=req.getParameter("password");



        User user= DBConnector.getUser2(email);

        String redirect="/login?emailError";

        if(user!=null){
            redirect="/login?passwordError";

            if(user.getEmail().equals(email) && user.getPassword().equals(password)){
                req.getSession().setAttribute("CURRENT_USER", user);
                redirect="/home";
            }
        }
        resp.sendRedirect(redirect);
    }
}
