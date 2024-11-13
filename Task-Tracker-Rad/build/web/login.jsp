<%-- 
    Document   : login
    Created on : Jul 26, 2024, 1:27:06 PM
    Author     : Chithran Jayathunga
--%>

<%@page import="Classes.User"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String uname = request.getParameter("uname");
    String psw = request.getParameter("psw");

    User user = new User(uname, psw);
    int id = user.login(con, psw);

    if (id != -1 && id != -2) {
        out.print(id);
        session.setAttribute("TaskTrackerID", id);
        if (request.getParameter("remember") != null) {
            Cookie ck = new Cookie("TaskTracker", String.valueOf(id));
            ck.setMaxAge(30*24*60*60);
        }
        if (user.getRole().equals("member")) {
            response.sendRedirect("./Member/memberDashboard.jsp");
        } else if (user.getRole().equals("ProjectManager")) {
            response.sendRedirect("./PM/PMDashboard.jsp");
        }else if (user.getRole().equals("Admin")) {
            response.sendRedirect("./Admin/adminDashboard.jsp");
        }
    }else if(id == -1){
        response.sendRedirect("./index.jsp?status=0");
    }
%>