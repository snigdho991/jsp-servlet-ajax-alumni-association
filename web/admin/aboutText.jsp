<%-- 
    Document   : profilechange
    Created on : Aug 7, 2019, 12:59:03 AM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>



<%
    String title       = request.getParameter("title");
    String description = request.getParameter("description");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("update tbl_about set title = '" + title + "', description = '" + description + "' where id = '1'");  
       
    if(i > 0){ 
%>
        <script type="text/javascript">
            alert("Text Settings Updated Successfully !");
            window.location = "about.jsp";
        </script>
<%
    } else {
%>
        <script type="text/javascript">
            alert("Something went Wrong ! Please try again.");
            window.location = "adminprofile.jsp";
        </script>
<%
    }
%>


