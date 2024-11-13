<%-- 
    Document   : index
    Created on : Jul 26, 2024, 1:16:58 PM
    Author     : Chithran Jayathunga
--%>
<%
    String statusParam = request.getParameter("status");
    int status = (statusParam != null) ? Integer.parseInt(statusParam) : 0;
    String message = "";

    switch (status) {
        case 0:
            message = "<div style='text-align: center;'><h6 class='text-danger'>Please check your Username and Password !</h6></div>";
            break;

        default:
            message = "";
            break;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            html, body {
                height: 100%;
                margin: 0;
                overflow: hidden;
            }
            .container-fluid {
                height: 100%;
            }
            .row {
                height: 100%;
                display: flex;
            }
            .left-section {
                background-color: rgb(6, 40, 61); 
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .right-section {
                background-color: rgb(223, 224, 228); 
                display: flex;
                align-items: center;
                justify-content: center;
                color: black;
            }
            .form-container {
                max-width: 400px;
                width: 100%;
            }
            hr.gradient {
                border: 0;
                height: 2px;
                background: linear-gradient(rgb(129, 201, 149), rgb(129, 201, 149));
                border-top: 5px double;
                margin: 20px 0;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }
        </style>
    </head>
    <body>

        <%@ include file="/includes/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 left-section">
                    <div>
                        <hr class="gradient">
                        <h1>Welcome To Task Tracker</h1>
                        <hr class="gradient">
                    </div>
                </div>
                <div class="col-md-6 right-section">
                    <div class="form-container">
                        <h2 class="h2">Login to the System</h2>

                        <form action="./login.jsp" method="POST">
                            <div class="mb-3 mt-3">
                                <label for="uname" class="form-label"></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" id="uname" placeholder="Enter Username" name="uname" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="pwd" class="form-label mt-3"></label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="psw" required>
                                </div>
                            </div>
                            <div class="form-check mb-3">
                                <label class="form-check-label mt-4">
                                    <input class="form-check-input" type="checkbox" name="remember" value="RememberMe"> Remember me
                                </label>
                            </div>
                            <% if (request.getParameter("status") != null) { %>
                                <%= message %>;
                               <%}%>

                            <button type="submit" class="btn btn-primary mb-5 w-100">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="includes/Footer.jsp" %>
    </body>
</html>
