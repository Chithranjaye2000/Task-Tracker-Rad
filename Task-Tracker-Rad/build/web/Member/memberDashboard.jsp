<%-- 
    Document   : dashboard
    Created on : Jul 26, 2024, 5:23:18 PM
    Author     : sasini
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
    String role = user.getRole();
    if (!role.equals("member")) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Dashboard</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%@ include file="./memberNav.jsp" %>
        <div class="container">
            <h1 class="mb-4">Assigned Tasks</h1>
            <a href="./announcements.jsp" class="btn btn-warning d-block mb-3 w-25">Announcements</a>
            <table class="table table-dark mt-5">
                <thead>
                    <tr>
                       
                        <th>Task ID <i class="fas fa-tag"></i></th>
                        <th>Task Name  <i class="fas fa-tasks"></i></th>
                        <th>Task Start Date  <i class="fas fa-calendar-day"></i></th>
                        <th>Task Deadline <i class="fas fa-clock"></i></th>
                        <th>Task Priority <i class="fas fa-exclamation-triangle"></i></th>
                        <th>Task Assigned To  <i class="fas fa-user-check"></i></th>
                        <th>Task Status  <i class="bi bi-check-circle-fill"></i> </th>

                        <th>Action</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Task task = new Task();
                        List<Task> tasks = task.getAllTasksForMember(con, user.getUname());
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
                        <td>
                            <form method="POST" action="./viewTask.jsp">
                                <input type="hidden" value="<%=t.getTid()%>" name="tid">
                                <button class="btn btn-primary"><i class="fas"></i>view</button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>


        <%

            int pmCount = User.getAllPMCount(con);
            int AllTasks = Task.getAllTaskTaskCount(con);

        %>

       

        <div class="row justify-content-center">


            <div class="col-md-4 mb-3 mt-5">
                <div class="card text-white bg-primary">
                    <div class="card-body">
                        <h5 class="card-title">Project Managers </h5>
                        <p class="card-text">Total :<%=pmCount%></p>
                        <p><i class="fas fa-users"></i></p>
                        
                    </div>
                </div>
            </div>

     <div class="col-md-4 mb-3 mt-5 ">
                    <div class="card text-white bg-success">
                        <div class="card-body">
                            <h5 class="card-title">Total Tasks</h5>
                            <p class="card-text"><%=AllTasks%> Tasks </p>
                            <p><i class="bi bi-clipboard-check"></i></i></p>
                            
                           
                        </div>
                    </div>
                </div>



        </div>




                    

        <div class="mt-auto">
            <%@ include file="Footer.jsp" %>
        </div>
    </body>
</html>
