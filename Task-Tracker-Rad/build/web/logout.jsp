<%-- 
    Document   : logout
    Created on : Jul 27, 2024, 12:21:17 AM
    Author     : Chithran Jayathunga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate();
    }

    // Clear any persistent cookies (if applicable)
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0); // Set expiration to past to delete cookie
            response.addCookie(cookie);
        }
    }
    
    response.sendRedirect("./index.jsp");
%>