package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet("/toRegister")
public class toRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email= req.getParameter("email");
        String password=req.getParameter("password");
        String rePassword=req.getParameter("rePassword");
        String fullName=req.getParameter("fullName");

        String redirect = "/register?passwordError";

        if(password.equals(rePassword)){
            redirect="/register?emailError";

            User user= DBConnector.getUser2(email);
            if(user==null){
                User newUser=new User(null,email,password,fullName);


                if(DBConnector.adduser(newUser)) {


                    redirect = "/register?success";
                }
            }

        }
        resp.sendRedirect(redirect);
    }
}
