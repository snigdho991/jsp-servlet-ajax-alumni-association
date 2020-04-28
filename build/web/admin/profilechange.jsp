<%-- 
    Document   : profilechange
    Created on : Aug 7, 2019, 12:59:03 AM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>



<%
    String adminName  = request.getParameter("adminName");
    String adminEmail = request.getParameter("adminEmail");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st = con.createStatement();
    
    int i = st.executeUpdate("update tbl_admin set adminName = '" + adminName + "', adminEmail = '" + adminEmail + "' where adminEmail = '"+session.getAttribute("adminEmail")+"'");  
       
    if(i > 0){ 
%>
        <script type="text/javascript">
            alert("Profile Settings Updated Successfully !");
            window.location = "adminprofile.jsp";
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

