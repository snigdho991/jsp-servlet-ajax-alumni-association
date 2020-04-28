<%-- 
    Document   : profilechange
    Created on : Aug 7, 2019, 12:59:03 AM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>

<%@page import="com.java.DB"%>

<%
    String id    = request.getParameter("id");
    String title = request.getParameter("title");
    String para1 = request.getParameter("para1");
    String para2 = request.getParameter("para2");
    String para3 = request.getParameter("para3");
    
    Connection con = DB.getConnection();
    String sql = "update tbl_news set title = ?, para1 = ?, para2 = ?, para3 = ? where id =" + id;
    PreparedStatement ps = con.prepareStatement(sql);
    
    ps.setString(1, title);
    ps.setString(2, para1);
    ps.setString(3, para2);
    ps.setString(4, para3);
    
    int i = ps.executeUpdate();
       
    if(i > 0){ 
%>
        <script type="text/javascript">
            alert("Text Settings Updated Successfully !");
            window.location = "editnews.jsp?id=<%= id %>";
        </script>
<%
    } else {
%>
        <script type="text/javascript">
            alert("Something went Wrong ! Please try again.");
            window.location = "allnews.jsp";
        </script>
<%
    }
%>



