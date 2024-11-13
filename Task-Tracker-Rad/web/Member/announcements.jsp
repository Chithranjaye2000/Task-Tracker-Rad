<%-- 
    Document   : announcements
    Created on : Jul 28, 2024, 12:05:44 AM
    Author     : sasini
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="Classes.Announcement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Classes.User"%>
<%
    Connection con = DBConnector.getConnection();

    String id = String.valueOf(session.getAttribute("TaskTrackerID"));
    User user = new User();
    user.setId(Integer.parseInt(id));
    user.getAUser(con);
    String role = user.getRole();
    if (!role.equals("member")) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Announcements</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%@ include file="./memberNav.jsp" %>
        <div class="d-flex justify-content-start ms-5">
            <a href="./memberDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1>Announcements</h1>
            <%
                if (request.getParameter("ann") != null) {
                    String message = null;
                    String ann = request.getParameter("ann");
                    if (ann.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>Announcement added Successfully.</div>";
                    } else if (ann.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>Announcement adding Failed.</div>";
                    }
                    out.println(message);
                }
            %>
            

            <div class="row mt-5">
                <%
                    Announcement announcement = new Announcement();
                    List<Announcement> announcements = announcement.getAllAnnouncement(con);

                    for (Announcement ann : announcements) {
                %>
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%= ann.getAntitle()%></h5>
                            <p class="card-text"><%= ann.getAnmessage()%></p>
                            <p class="card-text">At: <%= ann.getAndate()%> | By : <%= ann.getAnby()%>-Project Manager</p>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
            
        </div>
   <div class="mt-auto">
         <%@ include file="Footer.jsp" %>
       </div>
    </body>
</html>
