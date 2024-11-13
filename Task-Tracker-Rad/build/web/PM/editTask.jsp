<%-- 
    Document   : editTask
    Created on : Jul 27, 2024, 8:03:02 PM
    Author     : Chathura
--%>

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
        <title>Edit Task</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%@ include file="./PMNav.jsp" %>
        <div class="d-flex justify-content-start ms-5">
            <a href="./PMDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1 class="mb-5">Edit Task</h1>
            <%
                if (request.getParameter("edit") != null) {
                    String message = null;
                    String edit = request.getParameter("edit");
                    if (edit.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>Task Edited Successfully.</div>";
                    } else if (edit.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>Task Edit Failed.</div>";
                    }
                    out.println(message);
                }
            %>
            <div>
                <form method="POST" action="editTask.jsp">
                    <div class="row">
                        <div class="col-lg-10">
                            <select class="form-select" name="selectedTask">
                                <%
                                    Task task = new Task();
                                    List<Task> tasks = task.getAllTasks(con, user.getUname());
                                %>
                                <option disabled selected>Choose a Task</option>
                                <% for (Task t : tasks) {%>
                                <option value="<%= t.getTid()%>"><%= t.getTid()%> - <%= t.getTname()%></option>
                                <% }%>
                            </select>
                        </div>
                        <div class="col-lg-2">
                            <input class="btn btn-success d-block w-100" type="submit" value="Get Task" />
                        </div>
                    </div>
                </form>
            </div>

            <div>
                <%
                    if (request.getParameter("selectedTask") != null) {
                        String selectedTask = request.getParameter("selectedTask");
                        task.setTid(Integer.parseInt(selectedTask));
                        task.getATask(con);
                %>
                <form action="editTask-process.jsp" method="POST">
                    <div class="row mb-3 mt-5">
                        <div class="col-md-6">
                            <label for="tid">Task ID</label>
                            <input type="text" class="form-control" value="<%= task.getTid()%>" disabled>
                        </div>
                        <div class="col-md-6">
                            <label for="tname">Task Name</label>
                            <input type="text" class="form-control" value="<%= task.getTname()%>" name="tname">
                        </div>                    
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="startdate">Start Date</label>
                            <input type="text" class="form-control" value="<%= task.getStartDate()%>" name="startdate">
                        </div>
                        <div class="col-md-6">
                            <label for="deadline">Deadline</label>
                            <input type="text" class="form-control" value="<%= task.getDeadline()%>" name="deadline">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label for="tdis">Task Description</label>
                            <textarea class="form-control" id="tdis"name="tdis"><%= task.getTdis()%></textarea>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="priority" class="form-label">Priority Level</label>
                        <select class="form-select" id="priority" name="priority">
                            <option value="High" <%= task.getPriority().equals("High") ? "selected" : ""%>>High</option>
                            <option value="Medium" <%= task.getPriority().equals("Medium") ? "selected" : ""%>>Medium</option>
                            <option value="Low" <%= task.getPriority().equals("Low") ? "selected" : ""%>>Low</option>
                        </select>
                    </div>

                    <div class="row mt-3">
                        <input type="hidden" name="tid" value="<%= task.getTid()%>">
                        <input class="btn btn-primary mt-3 d-flex w-100" type="submit" value="Save">
                    </div>
                </form>
                <%
                    }
                %>
            </div>
        </div>
            <div class="mt-auto">
         <%@ include file="Footer.jsp" %>
       </div>
    </body>
</html>
