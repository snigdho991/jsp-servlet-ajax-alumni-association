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
    String accept_id = request.getParameter("accept_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");

    Statement st = conn.createStatement();

    String sql = "update tbl_eventcomment set status = '1' where id = '" + accept_id + "'";

    int i = st.executeUpdate(sql);
    
    if(i > 0){ %>
                <script type="text/javascript">
                    alert("Comment Accepted Successfully !");
                    window.location = "alleventcomments.jsp";
                </script>
<%
            }
%>


<%
    String reject_id = request.getParameter("reject_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");

    Statement st2 = conn2.createStatement();
 
    String sql2 = "update tbl_eventcomment set status = '2' where id = '" + reject_id + "'";

    int i2 = st2.executeUpdate(sql2);
    
    if(i2 > 0){ %>
                <script type="text/javascript">
                    alert("Comment Rejected Successfully !");
                    window.location = "alleventcomments.jsp";
                </script>
<%
            } 
%>

<%
    }
%>

