<%-- 
    Document   : assignTask-process
    Created on : Jul 27, 2024, 7:39:26 PM
    Author     : Chathura
--%>

<%@page import="Classes.Task"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%
    Connection con = DBConnector.getConnection();

    String assign = request.getParameter("assign");
    String tid = request.getParameter("tid");
    out.println(tid);
    out.println(assign);
    Task task = new Task();
    task.setTid(Integer.parseInt(tid));
    task.getATask(con);
    task.setAssignedTo(assign);
    if (task.assignTask(con)) {
        response.sendRedirect("./assignTask.jsp?assign=1");
    } else {
        response.sendRedirect("./assignTask.jsp?assign=2");
    }
%>
