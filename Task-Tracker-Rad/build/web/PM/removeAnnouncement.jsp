<%-- 
    Document   : deleteTask
    Created on : Jul 27, 2024, 11:46:55 PM
    Author     : Chathura
--%>

<%@page import="Classes.Announcement"%>
<%@page import="Classes.User"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="Classes.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String id = String.valueOf(session.getAttribute("TaskTrackerID"));
    User user = new User();
    user.setId(Integer.parseInt(id));
    user.getAUser(con);
    String role = user.getRole();
    if (!role.equals("ProjectManager")) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Task</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%@ include file="./PMNav.jsp" %>
        <div class="d-flex justify-content-start ms-5">
            <a href="./PMDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1 class="mb-5">Published Announcements</h1>

            <%
                if (request.getParameter("delete") != null) {
                    String message = null;
                    String delete = request.getParameter("delete");
                    if (delete.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>Announcement Deleted Successfully.</div>";
                    } else if (delete.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>Announcement Deletion Failed.</div>";
                    }
                    out.println(message);
                }
            %>

           
            <div>
                <form method="POST" action="removeAnnouncement-process.jsp">
                    <div class="row">
                        <div class="col-lg-10">
                            <select class="form-select" name="selectedAnnouncement">
                                <%
                                    List<Announcement> announcementList = Announcement.getAllAnnouncement(con);
                                    
                                %>
                                <option disabled selected>Choose an Announcement</option>
                                <% for (Announcement t : announcementList) {%>
                                <option value="<%= t.getAnid()%>"><%= t.getAntitle()%>-<%= t.getAndate()%></option>
                                <% }%>

                            </select>
                        </div>
                        <div class="col-lg-2">
                            <input class="btn btn-danger d-block w-100" type="submit" value="Delete Announcement" />
                        </div>
                    </div>
                </form>
            </div>
                           

        </div>
        <div class="mt-auto">
            <%@ include file="Footer.jsp" %>
        </div>
    </body>
</html>
