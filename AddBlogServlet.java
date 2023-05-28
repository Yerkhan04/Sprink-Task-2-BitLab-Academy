package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.User;

import java.io.IOException;

@WebServlet("/addBlog")
public class AddBlogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect="/login";
        req.setCharacterEncoding("utf8");
        User currentUser=(User) req.getSession().getAttribute("CURRENT_USER");
        if(currentUser!=null) {
            redirect ="/addBlog?Error";

            String title = req.getParameter("title");
            String content = req.getParameter("content");

            Blog blog = new Blog();
            blog.setTitle(title);
            blog.setContent(content);
            blog.setUser(currentUser);
            if(DBConnector.addBlog(blog)){
                redirect="/addBlog?success";
            }
        }
        resp.sendRedirect(redirect);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser=(User) req.getSession().getAttribute("CURRENT_USER");
        if(currentUser!=null){
            req.getRequestDispatcher("/addBlog.jsp").forward(req,resp);
        }else{
            resp.sendRedirect("/login");
        }
    }
}
