<%-- 
    Document   : editTask-process
    Created on : Jul 27, 2024, 8:13:21 PM
    Author     : Chathura
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();
    
    String tid = request.getParameter("tid");
    String tname = request.getParameter("tname");
    String tdis = request.getParameter("tdis");
    String startDate = request.getParameter("startdate");
    String deadline = request.getParameter("deadline");
    String priority = request.getParameter("priority");
    
    Task task = new Task(tname, tdis, startDate, deadline, priority);
    task.setTid(Integer.valueOf(tid));
    if(task.editTask(con)){
        response.sendRedirect("./editTask.jsp?edit=1");
    }else{
        response.sendRedirect("./editTask.jsp?edit=2");
    }
%>