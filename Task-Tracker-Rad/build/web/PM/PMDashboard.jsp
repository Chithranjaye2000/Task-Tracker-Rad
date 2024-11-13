<%-- 
    Document   : PMDashboard
    Created on : Jul 27, 2024, 12:11:27 AM
    Author     : Chathura
--%>

<%@page import="java.util.List"%>
<%@page import="Classes.Task"%>
<%@page import="Classes.User"%>
<%@page import="Classes.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection con = DBConnector.getConnection();

    String id = String.valueOf(session.getAttribute("TaskTrackerID"));
    User user = new User();
    user.setId(Integer.parseInt(id));
    user.getAUser(con);
    String uname = user.getUname();
    String role = user.getRole();
    if (!role.equals("ProjectManager")) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Dashboard</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>
    <body>
        <%@ include file="./PMNav.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <a href="./createTask.jsp" class="btn btn-primary d-block mb-3">Create Task</a>
                    <a href="./assignTask.jsp" class="btn btn-success d-block mb-3">Assign Tasks</a>

                    <div class="dropdown d-block w-100 mb-3">
                        <button class="btn btn-warning dropdown-toggle w-100" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Manage Task
                        </button>
                        <ul class="dropdown-menu dropdown-menu-full-width">
                            <li><a class="dropdown-item" href="./editTask.jsp">Edit Task</a></li>
                            <li><a class="dropdown-item" href="./deleteTask.jsp">Delete Task</a></li>
                        </ul>
                    </div>
                    <a href="./announcements.jsp" class="btn btn-secondary d-block mb-3">Announcements</a>
                    <a href="./removeAnnouncement.jsp" class="btn btn-danger d-block mb-3">Remove Announcements</a>

                </div>




                <div class="col-lg-9">
                    <h1>Welcome <%=user.getFname()%> <%=user.getLname()%></h1>
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

                            
                            setInterval(displayDateTime, 1000);
                        </script>

                        <table class="table table-dark mt-5">
                            <thead>
                                <tr>
                                    <th>Task ID</th>
                                    <th>Task Name</th>
                                    <th>Task Start Date</th>
                                    <th>Task Deadline</th>
                                    <th>Task Priority</th>
                                    <th>Task Assigned To</th>
                                    <th>Task Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Task task = new Task();
                                    List<Task> tasks = task.getAllTasks(con, user.getUname());
                                    for (Task t : tasks) {
                                %>
                                <tr>
                                    <td><%=t.getTid()%></td>
                                    <td><%=t.getTname()%></td>
                                    <td><%=t.getStartDate()%></td>
                                    <td><%=t.getDeadline()%></td>
                                    <td><%=t.getPriority()%></td>
                                    <td><%=t.getAssignedTo()%></td>
                                    <td><%=t.getStatus()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>

        <!--add card--> 


        <div class="container mt-5 mt-3">

            <%
                int memberCount = User.getAllMemberCount(con); 
                int CompletedTaskCount = Task.getCompletedTaskCount(con);
                int PendingTaskCount = Task.getPendingTaskCount(con);
             

            %>
      
            
            <div class="row justify-content-center">
                <!-- Card 1: User Statistics -->
                <div class="col-md-4 mb-4">
                    <div class="card text-white bg-primary">
                        <div class="card-body">
                            <h5 class="card-title">Team Members</h5>
                            <p class="card-text">Total : <%=memberCount%></p>
                            <p><i class="fas fa-users"></i></p>
                            <!--<a href="#" class="btn btn-light">View Details</a>-->
                        </div>
                    </div>
                </div>

                <!-- Card 2: Recent Activities -->
                <div class="col-md-4 mb-4 ">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title">Completed Tasks</h5>
                            <p class="card-text"><%=CompletedTaskCount%> Tasks Completed</p>
                            <p><i class="fas fa-check-circle"></i></p>
                         
                        </div>
                    </div>
                </div>

                <!--Card 3: System Alerts--> 
                <div class="col-md-4 mb-4 ">
                    <div class="card text-white bg-danger">
                        <div class="card-body">
                            <h5 class="card-title">Pending Tasks</h5>
                            <p class="card-text"><%=PendingTaskCount%> Tasks Pending</p>
<!--                            <p><i class="bi bi-hourglass-split"></i></p>-->
                            <p><i class="fas fa-sync fa-spin"></i></p>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--end card-->
    </body>

    <%@ include file="Footer.jsp" %>

</html>
