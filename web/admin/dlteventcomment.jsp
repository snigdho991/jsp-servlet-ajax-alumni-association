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
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");

    Statement st = conn.createStatement();

    String sql = "delete from tbl_eventcomment where id = '" + id + "'";

    int i = st.executeUpdate(sql);
    
    if(i > 0){ %>
                <script type="text/javascript">
                    alert("Comment Deleted Successfully !");
                    window.location = "alleventcomments.jsp";
                </script>
<%
            }
%>

<%
    }
%>


