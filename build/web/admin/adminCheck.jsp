<%-- 
    Document   : adminCheck
    Created on : Jul 15, 2019, 3:34:58 PM
    Author     : singdho
--%>


<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%
        String adminEmail = request.getParameter("adminEmail");
        String adminPass  = request.getParameter("adminPass");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from tbl_admin where adminEmail = '" +adminEmail+ "' and adminPass = '" +adminPass+ "' ");
        if(rs.next()){
            session.setAttribute("adminEmail", adminEmail);
            response.sendRedirect("dashboard.jsp");
        } else { %>
            <script type="text/javascript">
                alert("Incorrect Email or Password ! Please Try again.");
                window.location = "index.jsp";
            </script>
        <%  } 
%>
