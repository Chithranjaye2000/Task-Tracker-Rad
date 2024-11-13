<%-- 
    Document   : removeUser
    Created on : Jul 28, 2024, 10:59:35 AM
    Author     : Pushpitha
--%>

<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String id = String.valueOf(session.getAttribute("TaskTrackerID"));
    User user = new User();
    user.setId(Integer.parseInt(id));
    user.getAUser(con);
    String role = user.getRole();
    if (!role.equals("Admin")) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove User</title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="bg-dark text-center text-white">
        <%@ include file="./adminNav.jsp" %>
        <div class="d-flex justify-content-start ms-5">
            <a href="./adminDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1 class="h1">Remove A User</h1>
            <%
                if (request.getParameter("ru") != null) {
                    String message = null;
                    String ru = request.getParameter("ru");
                    if (ru.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>User Removed Successfully.</div>";
                    } else if (ru.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>User Removing Failed.</div>";
                    }
                    out.println(message);
                }
            %>
            <div>
                <form method="POST" action="removeUser-Process.jsp">
                    <div class="row">
                        <div class="col-lg-10">
                            <select class="form-select" name="selectedUser">
                                <%
                                    List<User> allusers = user.getAllUsersforAdmin(con);
                                %>
                                <option disabled selected>Choose a User</option>
                                <% for (User u : allusers) {%>
                                <option value="<%= u.getId()%>"><%= u.getId()%> - <%= u.getFname()%> <%= u.getLname()%>-<%=u.getRole()%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="col-lg-2">
                            <input class="btn btn-danger d-block w-100" type="submit" value="Remove User" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="mt-auto">
         <%@ include file="/includes/Footer.jsp" %>
       </div>
    </body>
</html>
