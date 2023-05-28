<%@ page import="model.Blog" %>
<%@ page import="model.Comment" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Diana
  Date: 28.05.2023
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
  <%@include file="online.jsp"%>
</head>
<body>


<%
  if(online!=true){
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">BITLAB SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link enable" href="/home" tabindex="-1" aria-disabled="true">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link enable" href="/login" tabindex="-1" aria-disabled="true">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link enable" href="/register" tabindex="-1" aria-disabled="true">Register</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<%
}else{
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">BITLAB SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent2">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link enable" href="/profile" tabindex="-1" aria-disabled="true"><%=currentUser.getFullName()%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link enable" href="/home" tabindex="-1" aria-disabled="true">Home</a>
        </li>

        <li class="nav-item">
          <a class="nav-link enable" href="/addBlog" tabindex="-1" aria-disabled="true">AddBlog</a>
        </li>

      </ul>
      <ul class="navbar-nav me-right mb-3 mb-lg-2">
        <li class="nav-item">
          <a class="nav-link enable" href="/logout" tabindex="-1" aria-disabled="true">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<%
  }
%>




<div class="container" style="min-height: 500px;">
  <div class="row mt-3">
    <div class="col-12">
      <%
        Blog blog = (Blog) request.getAttribute("blog");
        if(blog!=null){
      %>
      <div class="row mt-3">
        <div class="col-11 mx-auto p-3" style="background-color: lightgrey;">
          <h2><%=blog.getTitle()%></h2>
          <p class="mt-2"><%=blog.getContent()%></p>
          <p class="mt-2">
            Posted by <strong><%=blog.getUser().getFullName()%></strong>
            at <strong><%=blog.getPostDate()%></strong>
          </p>

          <%
            if(currentUser!=null){
          %>
          <div class="row mt-2">
            <div class="col-12">
              <form action="/addcomment" method="post">
                <input type="hidden" name="blog_id" value="<%=blog.getId()%>">
                <textarea class="form-control" name="comment" placeholder="Write a comment"></textarea>
                <button class="btn btn-success mt-3">ADD COMMENT</button>
              </form>
            </div>
          </div>
          <%
            }
          %>
          <hr>
          <%
            ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("comments");
            if(comments!=null){
              for(Comment comment : comments){
          %>
          <div class="row mt-2">
            <div class="col-12">
              <h5><%=comment.getUser().getFullName()%></h5>
              <p><%=comment.getComment()%></p>
              <p>At <strong><%=comment.getPostDate()%></strong></p>
            </div>
          </div>
          <%
              }
            }
          %>
        </div>
      </div>
      <%
        }
      %>
    </div>
  </div>
</div>





</body>
</html>
