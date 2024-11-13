<%-- 
    Document   : removeAnnouncement-process
    Created on : Aug 8, 2024, 10:12:00 PM
    Author     : Chathura
--%>

<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Announcement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String tid = request.getParameter("selectedAnnouncement");
    int announcementId=(tid!=null)? Integer.parseInt(tid):0;
    
    boolean result =Announcement.removeAnnouncement(con, announcementId);

    if (result) {
        response.sendRedirect("./removeAnnouncement.jsp?delete=1");
    } else {
        response.sendRedirect("./removeAnnouncement.jsp?delete=2");
    }
%>

