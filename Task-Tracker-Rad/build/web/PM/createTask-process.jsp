<%-- 
    Document   : createTask-process
    Created on : Jul 27, 2024, 11:07:55 AM
    Author     : Chathura
--%>

<%@page import="Classes.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();
    User user = new User();
    user.setId(Integer.parseInt(String.valueOf(session.getAttribute("TaskTrackerID"))));
    user.getAUser(con);
    out.print(user.getUname());

    String tname = request.getParameter("tname");
    String tdis = request.getParameter("tdis");
    String startDate = request.getParameter("startdate");
    String deadline = request.getParameter("deadline");
    String priority = request.getParameter("priority");

//    out.println("Task Name: " + tname);
//    out.println("Task Description: " + tdis);
//    out.println("Start Date: " + startDate);
//    out.println("Deadline: " + deadline);
//    out.println("Priority: " + priority);
    Task task = new Task(tname, tdis, startDate, deadline, priority);
    if (task.saveTask(con, user.getUname())) {
//        out.print("OK");
        response.sendRedirect("./createTask.jsp?task=1");
    } else {
//        out.print("error");
        response.sendRedirect("./createTask.jsp?task=2");
    }
%>