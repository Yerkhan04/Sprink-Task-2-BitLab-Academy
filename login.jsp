<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="db.DBConnector" %><%--
  Created by IntelliJ IDEA.
  User: Diana
  Date: 18.05.2023
  Time: 23:03
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
</head>
<body>


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

<div class="container">
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">

<h4 class="mb-4">
    Login to System
</h4>
<%
    String passError= request.getParameter("passwordError");
    if(passError!=null){
%>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        Incorrect password
        <button type="button" class="close" data-dismiss="alert" aria-label="close">
            <span aria-hidden="true"></span>
        </button>
    </div>
<%
    }
%>


<%
    String emailError= request.getParameter("emailError");
    if(emailError!=null){
%>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
    Incorrect email
    <button type="button" class="close" data-dismiss="alert" aria-label=close">
        <span aria-hidden="true"></span>
    </button>
</div>
<%
    }
%>



<form action="/auth" method="post" >
    <div class="row mb-3">
        <label for="email" class="col-sm-2 col-form-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" id="email" name="email">
        </div>
    </div>
    <div class="row mb-3">
        <label for="password" class="col-sm-2 col-form-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="password" name="password">
        </div>
    </div>
    <button type="submit" class="btn btn-success">Sign in</button>

</form>
        </div>
    </div>
</div>



</body>
</html>
