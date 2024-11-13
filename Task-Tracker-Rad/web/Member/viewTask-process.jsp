<%-- 
    Document   : viewTask-process
    Created on : Jul 28, 2024, 10:16:55 AM
    Author     : sasini
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String status = request.getParameter("status");
    String tid = request.getParameter("tid");
    
    out.print(status);
    out.print(tid);

    Task task = new Task();
    task.setTid(Integer.parseInt(tid));
    task.setStatus(status);
    if (task.updateStatus(con)) {
        response.sendRedirect("./viewTask.jsp?edit=1");
    }else{
        response.sendRedirect("./viewTask.jsp?edit=2");
    }
%>
