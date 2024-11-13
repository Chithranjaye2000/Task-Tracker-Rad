package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/includes/navbar.jsp");
    _jspx_dependants.add("/includes/Footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            html, body {\n");
      out.write("                height: 100%;\n");
      out.write("                margin: 0;\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("            .container-fluid {\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            .row {\n");
      out.write("                height: 100%;\n");
      out.write("                display: flex;\n");
      out.write("            }\n");
      out.write("            .left-section {\n");
      out.write("                background-color: rgb(6, 40, 61); \n");
      out.write("                color: white;\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                justify-content: center;\n");
      out.write("            }\n");
      out.write("            .right-section {\n");
      out.write("                background-color: rgb(223, 224, 228); \n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                justify-content: center;\n");
      out.write("                color: black;\n");
      out.write("            }\n");
      out.write("            .form-container {\n");
      out.write("                max-width: 400px;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            hr.gradient {\n");
      out.write("                border: 0;\n");
      out.write("                height: 2px;\n");
      out.write("                background: linear-gradient(rgb(129, 201, 149), rgb(129, 201, 149));\n");
      out.write("                border-top: 5px double;\n");
      out.write("                margin: 20px 0;\n");
      out.write("                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("<nav class=\"navbar navbar-expand-lg navbar-light\" style=\"background-color:rgb(252, 209, 209);\"  >\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <a class=\"navbar-brand\" href=\"#\">Task Tracker</a>\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("<!--        <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n");
      out.write("            <ul class=\"navbar-nav ms-auto\">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">Home</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">About</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">Contact</a>\n");
      out.write("                </li>\n");
      out.write("             \n");
      out.write("            </ul>\n");
      out.write("        </div>-->\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("        \n");
      out.write("        </body>\n");
      out.write("</html>");
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-md-6 left-section\">\n");
      out.write("                    <div>\n");
      out.write("                        <hr class=\"gradient\">\n");
      out.write("                        <h1>Welcome To Task Tracker</h1>\n");
      out.write("                        <hr class=\"gradient\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-md-6 right-section\">\n");
      out.write("                    <div class=\"form-container\">\n");
      out.write("                        <h2 class=\"h2\">Login to the System</h2>\n");
      out.write("\n");
      out.write("                        <form action=\"./login.jsp\" method=\"POST\">\n");
      out.write("                            <div class=\"mb-3 mt-3\">\n");
      out.write("                                <label for=\"uname\" class=\"form-label\"></label>\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <span class=\"input-group-text\"><i class=\"fas fa-user\"></i></span>\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"uname\" placeholder=\"Enter Username\" name=\"uname\" required>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"mb-3\">\n");
      out.write("                                <label for=\"pwd\" class=\"form-label mt-3\"></label>\n");
      out.write("                                <div class=\"input-group\">\n");
      out.write("                                    <span class=\"input-group-text\"><i class=\"fas fa-lock\"></i></span>\n");
      out.write("                                    <input type=\"password\" class=\"form-control\" id=\"pwd\" placeholder=\"Enter password\" name=\"psw\" required>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-check mb-3\">\n");
      out.write("                                <label class=\"form-check-label mt-4\">\n");
      out.write("                                    <input class=\"form-check-input\" type=\"checkbox\" name=\"remember\" value=\"RememberMe\"> Remember me\n");
      out.write("                                </label>\n");
      out.write("                            </div>\n");
      out.write("                            ");
 if (request.getParameter("status") != null) { 
      out.write("\n");
      out.write("                                ");
      out.print( message );
      out.write(";\n");
      out.write("                               ");
}
      out.write("\n");
      out.write("\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary mb-5 w-100\">Login</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                min-height: 100vh;\n");
      out.write("             \n");
      out.write("            }\n");
      out.write("            .content {\n");
      out.write("                flex: 1;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            footer.custom-footer {\n");
      out.write("                background-color: rgb(249, 239, 219);\n");
      out.write("                color: black; /* Text color to contrast the background */\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-dark text-center text-white\">\n");
      out.write("       <footer class=\"custom-footer text-center py-3 mt-auto\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <p class=\"mb-0\">© 2024 Task Tracker. All rights reserved.</p>\n");
      out.write("<!--                <a href=\"#\" class=\"text-dark\">Privacy Policy</a> | \n");
      out.write("                <a href=\"#\" class=\"text-dark\">Terms of Service</a> | \n");
      out.write("                <a href=\"#\" class=\"text-dark\">Contact Us</a>-->\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
