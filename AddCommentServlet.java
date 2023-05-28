package Servlet;

import db.DBConnector;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Blog;
import model.Comment;
import model.User;

import java.io.IOException;

@WebServlet("/addcomment")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String redirect = "/login";
        req.setCharacterEncoding("utf8");
        User currentUser=(User) req.getSession().getAttribute("CURRENT_USER");
        if(currentUser!=null) {

            String commentText = req.getParameter("comment");
            Long blogId = Long.parseLong(req.getParameter("blog_id"));
            Blog blog = DBConnector.getBlog(blogId);


            if(blog!=null){
                Comment comment = new Comment();
                comment.setComment(commentText);
                comment.setUser(currentUser);
                comment.setBlog(blog);
                if(DBConnector.addComment(comment)){

                    redirect = "/readblog?id="+blogId;

                }

            }
        }
        resp.sendRedirect(redirect);

    }
}
