<%-- 
    Document   : deleteTask-Process
    Created on : Jul 27, 2024, 11:51:26 PM
    Author     : Chathura
--%>

<%@page import="Classes.Task"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String tid = request.getParameter("selectedTask");
    Task task = new Task();
    task.setTid(Integer.parseInt(tid));
    if (task.deleteTask(con)) {
        response.sendRedirect("./deleteTask.jsp?delete=1");
    } else {
        response.sendRedirect("./deleteTask.jsp?delete=2");
    }
%>
