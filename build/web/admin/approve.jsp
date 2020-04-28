<%-- 
    Document   : approve
    Created on : Jul 20, 2019, 11:53:20 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<% 
    if ((session.getAttribute("adminEmail") == null) || (session.getAttribute("adminEmail") == "")){ 
%>
    <script type="text/javascript">
        alert("You aren't currently signed in !");
        window.location = "/../alumni/admin/error.jsp";
    </script>
<%
    } else {
%>

<%
    String id = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    String query = "INSERT IGNORE INTO tbl_profile(uni_id) VALUES(?)";
    PreparedStatement ps = conn2.prepareStatement(query);
    ps.setString(1, id);

    ps.executeUpdate();
%>


<%
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");

    Statement st = conn.createStatement();

    String sql = "update tbl_registration set status = '1' where uni_id = '" + id + "'";

    int i = st.executeUpdate(sql);
    
    if(i > 0){ 
%>

                <script type="text/javascript">
                    alert("User Approved Successfully !");
                    window.location = "pending.jsp";
                </script>
<%
            } else {
%>
                <script type="text/javascript">
                    alert("Something went Wrong ! Please try again.");
                    window.location = "profile.jsp";
                </script>
<%
            }      
%>

    
<%
    }
%>
