
<%-- 
    Document   : createTask
    Created on : Jul 27, 2024, 10:53:10 AM
    Author     : Chathura
--%>


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
    if (!role.equals("ProjectManager")) {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Tasks</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css">
        <style>
            .container {
                max-width: 600px;
                margin-top: 20px;
            }
            .form-label {
                font-weight: bold;
            }
            .form-control, .form-select {
                border-radius: 0.375rem;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }
            .form-control:focus, .form-select:focus {
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
            }
            .btn {
                border-radius: 0.375rem;
            }
            .alert {
                margin-bottom: 20px;
            }
             hr.gradient {
                 border: 0;
                height: 2px;
                background: linear-gradient(rgb(129, 201, 149), rgb(129, 201, 149));
                border-top: 5px double;
                margin: 10px 0;
                box-shadow: 0 2px 4px rgb(254, 27, 118);
            }
           
            
        </style>
    </head>
    <body>
        <%@ include file="./PMNav.jsp" %>
        
        <div class="d-flex justify-content-start ms-5">
            <a href="./PMDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
       
        <h1 class="mb-5 text-center">Create Task</h1>
        <hr class="gradient">
        
        <div class="container">
              
            <%
                if (request.getParameter("task") != null) {
                    String message = null;
                    String task = request.getParameter("task");
                    if (task.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>Task added Successfully.</div>";
                    } else if (task.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>Task adding Failed.</div>";
                    }
                    out.println(message);
                }
            %>
            <form action="createTask-process.jsp" method="POST">
                <div class="mb-4">
                    <label for="tname" class="form-label">Task Name <i class="fas fa-tasks"></i></label>
                    <input type="text" class="form-control" id="tname" name="tname" placeholder="Task Name">
                </div>

                <div class="mb-4">
                    <label for="tdis" class="form-label">Task Description <i class="fas fa-clipboard-list"></i></label>
                    <textarea class="form-control" id="tdis" name="tdis" placeholder="Task Description"></textarea>
                </div>

                <div class="mb-4">
                    <label for="startdate" class="form-label">Start Date <i class="fas fa-calendar-alt"></i></label>
                    <input type="date" class="form-control" id="startdate" name="startdate" min="">
                </div>   


                <div class="mb-4">
                    <label for="deadline" class="form-label">Deadline <i class="fas fa-calendar-times"></i></label>
                    <input type="date" class="form-control" id="deadline" name="deadline" min="">
                </div>
                

                <div class="mb-4 ">
                    <label for="priority" class="form-label">Priority Level <i class="fas fa-exclamation-triangle"></i></label>
                    <select class="form-select" id="priority" name="priority">
                        <option value="High">High</option>
                        <option value="Medium">Medium</option>
                        <option value="Low" selected>Low</option>
                    </select>
                </div>   

                <button type="submit" class="btn btn-primary mb-4 w-100">Create Task <i class="fas fa-plus"></i></button>
            </form>
        </div>
        <div class="mt-auto">
            <%@ include file="Footer.jsp" %>
        </div>
        
        <script>
    // Get today's date in the format 'YYYY-MM-DD'
    var today = new Date().toISOString().split('T')[0];
    
    
    document.getElementById('startdate').setAttribute('min', today);
    document.getElementById('deadline').setAttribute('min', today);
</script>

    </body>
</html>
