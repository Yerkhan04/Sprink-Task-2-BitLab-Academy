package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.Comment;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/readblog")
public class BlogDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id=Long.parseLong(req.getParameter("id"));
        Blog blog= DBConnector.getBlog(id);
        req.setAttribute("blog", blog);

        if(blog!=null){
            ArrayList<Comment> comments=DBConnector.getAllComments(blog.getId());
            req.setAttribute("comments", comments);
        }


        req.getRequestDispatcher("/blogdetails.jsp").forward(req,resp);

    }
}
