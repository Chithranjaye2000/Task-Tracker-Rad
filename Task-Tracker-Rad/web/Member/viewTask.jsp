<%-- 
    Document   : viewTask
    Created on : Jul 28, 2024, 10:01:41 AM
    Author     : sasini
--%>

<%@page import="java.sql.Connection"%>
<%@page import="Classes.DBConnector"%>
<%@page import="Classes.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Task</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <%@ include file="./memberNav.jsp" %>
        <div class="d-flex justify-content-start ms-5">
            <a href="./memberDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1>View Task</h1>
            <%
                if (request.getParameter("edit") != null) {
                    String message = null;
                    String edit = request.getParameter("edit");
                    if (edit.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>Status Changes Successfully.</div>";
                    } else if (edit.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>Status Changing Failed.</div>";
                    }
                    out.println(message);
                }
            %>
            <div>
                <%
                    Connection con = DBConnector.getConnection();

                    if (request.getParameter("tid") != null) {
                        String tid = request.getParameter("tid");
                        Task task = new Task();
                        task.setTid(Integer.parseInt(tid));
                        task.getATask(con);
                %>

                <div class="row mb-3 mt-5">
                    <div class="col-md-6">
                        <label for="tid">Task ID</label>
                        <input type="text" class="form-control" value="<%= task.getTid()%>" disabled>
                    </div>
                    <div class="col-md-6">
                        <label for="tname">Task Name</label>
                        <input type="text" class="form-control" value="<%= task.getTname()%>" name="tname"  disabled>
                    </div>                    
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="startdate">Start Date</label>
                        <input type="text" class="form-control" value="<%= task.getStartDate()%>" name="startdate" disabled>
                    </div>
                    <div class="col-md-6">
                        <label for="deadline">Deadline</label>
                        <input type="text" class="form-control" value="<%= task.getDeadline()%>" name="deadline" disabled>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label for="tdis">Task Description</label>
                        <textarea class="form-control" id="tdis"name="tdis"  disabled><%= task.getTdis()%></textarea>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="priority" class="form-label">Priority Level</label>
                    <select class="form-select" id="priority" name="priority" disabled>
                        <option value="High" <%= task.getPriority().equals("High") ? "selected" : ""%>>High</option>
                        <option value="Medium" <%= task.getPriority().equals("Medium") ? "selected" : ""%>>Medium</option>
                        <option value="Low" <%= task.getPriority().equals("Low") ? "selected" : ""%>>Low</option>
                    </select>
                </div>
                <form action="viewTask-process.jsp" method="POST">
                    <div  class="col-md-12 mt-3">
                        <label for="status" class="form-label">Status</label>
                        <select class="form-select" id="priority" name="status">
                             <%= task.getStatus().equals("Assigned") ? "selected" : ""%>
                            <option value="Pending" <%= task.getStatus().equals("Pending") ? "selected" : ""%>>Pending</option> 

                            <option value="Completed" <%= task.getStatus().equals("Completed") ? "selected" : ""%>>Completed</option>
                        </select>
                        <input type="hidden" value="<%= task.getTid()%>" name="tid">
                        <input class="btn btn-primary mt-3 mb-5 d-flex w-100" type="submit" value="Save">
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
