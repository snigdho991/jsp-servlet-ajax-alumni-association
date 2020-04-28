<%-- 
    Document   : adminlogout
    Created on : Aug 7, 2019, 1:27:07 AM
    Author     : singdho
--%>

<% 
    session.setAttribute("adminEmail", null);
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
