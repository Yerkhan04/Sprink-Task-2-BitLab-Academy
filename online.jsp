<%@ page import="model.User" %><%
    User currentUser=(User) request.getSession().getAttribute("CURRENT_USER");
    boolean online=false;
    if(currentUser!=null){
        online=true;
    }
%>