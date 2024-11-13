<%-- 
    Document   : announcement-process
    Created on : Jul 28, 2024, 12:56:57 AM
    Author     : Chathura
--%>

<%@page import="Classes.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Announcement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    User user = new User();
    int id = Integer.parseInt(String.valueOf(session.getAttribute("TaskTrackerID")));
    user.setId(id);
    user.getAUser(con);
    String uname = user.getUname();
    out.print(uname);

    String antitle = request.getParameter("title");
    String anmessage = request.getParameter("msj");

    Announcement ann = new Announcement(antitle, anmessage);
    boolean a = ann.saveAnnouncement(con, uname);
    if (a) {
        response.sendRedirect("./announcements.jsp?ann=1");
    } else {
        response.sendRedirect("./announcements.jsp?ann=2");
    }
%>