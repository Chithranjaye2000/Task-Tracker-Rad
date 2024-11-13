<%-- 
    Document   : register-process
    Created on : Jul 26, 2024, 2:39:35 PM
    Author     : Pushpitha
--%>

<%@page import="Classes.MD5"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String role = request.getParameter("role");
    String uname = request.getParameter("uname");
    String psw = request.getParameter("psw");
    String conPsw = request.getParameter("conPsw");

    if (psw.equals(conPsw)) {
        User user = new User(fname, lname, uname, MD5.getMd5(psw), email, role);

        if (user.register(con)) {
            response.sendRedirect("./register.jsp?reg=1");
        } else {
            response.sendRedirect("./register.jsp?reg=3");
        }
    } else {
        response.sendRedirect("./register.jsp?reg=2");
    }
%>