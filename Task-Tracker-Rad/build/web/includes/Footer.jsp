<%-- 
    Document   : Footer.jsp
    Created on : Jul 30, 2024, 9:49:33 AM
    Author     : Chithran Jayathunga
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                display: flex;
                flex-direction: column;
                min-height: 100vh;
             
            }
            .content {
                flex: 1;
            }
            
            footer.custom-footer {
                background-color: rgb(249, 239, 219);
                color: black; 
            }
            
        </style>
    </head>
    <body class="bg-dark text-center text-white">
       <footer class="custom-footer text-center py-3 mt-auto">
            <div class="container">
                <p class="mb-0">© 2024 Task Tracker. All Rights Reserved.</p>

            </div>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
