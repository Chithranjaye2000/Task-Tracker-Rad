<%-- 
    Document   : adminDashboard
    Created on : Jul 27, 2024, 12:20:04 AM
    Author     : Pushpitha 
--%>

<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
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
        <title>Admin Dashboard</title>
        
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>
    <body>
        <%@ include file="./adminNav.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <a href="./register.jsp" class="btn btn-success d-block mb-3">Add User</a>
                    <a href="./removeUser.jsp" class="btn btn-danger d-block mb-3">Remove User</a>
                </div>

                <div class="col-lg-9">
                    <h1>Welcome <%=user.getFname()%></h1>
                    <div class="mt-5">
                        <div id="date" class="display-6"></div>
                        <div id="time" class="display-6"></div>
                        <script>
                            function displayDateTime() {
                                var now = new Date();

                                // for Date formatting
                                var dateOptions = {year: 'numeric', month: 'long', day: 'numeric'};
                                var formattedDate = now.toLocaleDateString('en-US', dateOptions);

                                // for Time formatting
                                var timeOptions = {hour: 'numeric', minute: 'numeric', second: 'numeric'};
                                var formattedTime = now.toLocaleTimeString('en-US', timeOptions);

                                document.getElementById("date").textContent = formattedDate;
                                document.getElementById("time").textContent = formattedTime;   

                            }

                            
                            displayDateTime();

                            // Update every second
                            setInterval(displayDateTime, 1000);
                        </script>
                    </div>
                </div>
            </div>
        </div>

      
<%


 int memberCount = User.getAllMemberCount(con);
 int pmCount = User.getAllPMCount(con);


%>

        <div class="container mt-5 mt-3 ">


            <div class="row justify-content-center">
                <!-- Card 1: User Statistics -->
                <div class="col-md-4 mb-4 mt-5">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Project Managers</h5>
                            <p class="card-text">Total :<%=pmCount%> </p>
                            <p><i class="fas fa-user-tie"></i></p>
                            
                           
                        </div>
                    </div>
                </div>

                
                <div class="col-md-4 mb-4 mt-5">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title">Team Members</h5>
                            <p class="card-text">Total : <%=memberCount%></p>
                             <p><i class="fas fa-users"></i></p>
                           
                        </div>
                    </div>
                </div>


            </div>
        </div>

     

 <div class="mt-auto">
            <%@ include file="/includes/Footer.jsp" %>
        </div>
    </body> 
</html>




       
