<%-- 
    Document   : register
    Created on : Jul 26, 2024, 2:06:19 PM
    Author     : Pushpitha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body class="bg-dark text-center text-white">
        <%@ include file="./adminNav.jsp" %>
        <div class="d-flex justify-content-start ms-5">
            <a href="./adminDashboard.jsp" class="btn btn-secondary"><i class="fas fa-chevron-left"></i></a>
        </div>
        <div class="container">
            <h1 class="h1">Register A User</h1>
            <%
                if (request.getParameter("reg") != null) {
                    String message = null;
                    String reg = request.getParameter("reg");
                    if (reg.equals("1")) {
                        message = "<div class='alert alert-success' role='alert'>User Added Successfully.</div>";
                    } else if (reg.equals("2")) {
                        message = "<div class='alert alert-danger' role='alert'>User adding Failed.</div>";
                    }
                    out.println(message);
                }
            %>
            <form action="register-process.jsp" method="POST" class="mt-5">
                <div class="row">
                    <div class="col-lg-6 mb-3">
                        <input type="text" class="form-control" placeholder="First name" name="fname" required>
                    </div>
                    <div class="col-lg-6">
                        <input type="text" class="form-control" placeholder="Last name" name="lname" required>
                    </div>
                </div>
                <div class="row">                    
                    <div class="col mt-3">
                        <input type="email" class="form-control" placeholder="Email" name="email" required>
                    </div>
                </div>
                <div class="row">                    
                    <div class="col mt-3">
                       
                        <select class="form-control" name="role">
                            <option disabled selected>Role</option>
                     
                            <option value="ProjectManager">Project Manager</option>
                            <option value="member">Member</option>
                        </select>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="Username" name="uname">
                    </div>                    
                </div>
                <div class="row mt-3">
                    <div class="col-lg-6 mb-3">
                        <input type="password" class="form-control" placeholder="Password" name="psw">
                    </div>                
                    <div class="col-lg-6">
                        <input type="password" class="form-control" placeholder="Confirm Password" name="conPsw">
                    </div>                
                </div>

                <div class="row">                    
                    <div class="col mt-3 mb-5">
                        <input type="submit" class="btn btn-primary d-block w-100" value="Register">
                    </div>
                </div>
            </form>
        </div>
       <div class="mt-auto">
         <%@ include file="/includes/Footer.jsp" %>
       </div>
    </body>
</html>
