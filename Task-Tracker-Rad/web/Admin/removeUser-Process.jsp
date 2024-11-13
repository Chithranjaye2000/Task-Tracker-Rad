<%-- 
    Document   : removeUser-Process
    Created on : Jul 28, 2024, 11:27:13 AM
    Author     : Pushpitha
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String id = request.getParameter("selectedUser");
    User user = new User();
    user.setId(Integer.parseInt(id));
    if(user.removeUser(con)){
        response.sendRedirect("./removeUser.jsp?ru=1");
    }else{
        response.sendRedirect("./removeUser.jsp?ru=2");
    }
%>