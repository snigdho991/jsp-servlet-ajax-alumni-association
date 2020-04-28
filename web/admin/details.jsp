<%-- 
    Document   : details
    Created on : Aug 12, 2019, 2:07:44 PM
    Author     : singdho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@include file="inc/header.jsp" %>    
<%@include file="inc/sidebar.jsp" %> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<style>
    .list-group {
        /* padding-left: 80px; */
        margin-bottom: 20px;
        padding: 20px 250px;
    }
</style>


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
    String name = "", uni_id = "", email = "", mobile = "", profession = "", location = "",  facebook = "", departmentName = "", departmentId = "", batchId = "", batchName = "", linkedin = "", twitter = "", website = "", job = "", status="";
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_registration where uni_id = '" + id + "'");
    if (rs.next()) {
        name         = rs.getString("name");
        departmentId = rs.getString("departmentId");
        batchId      = rs.getString("batchId");
        uni_id       = rs.getString("uni_id");
        email        = rs.getString("email");
        mobile       = rs.getString("mobile");
        profession   = rs.getString("profession");
        job          = rs.getString("job");
        location     = rs.getString("location");
        linkedin     = rs.getString("linkedin");
        facebook     = rs.getString("facebook");
        twitter      = rs.getString("twitter");
        website      = rs.getString("website");
               
        status = rs.getString("status");
        int s = Integer.parseInt(status);
        
%>
                 
    <section class="content">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                User Details  
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="list-group">
                                <div style="color: #dfe9f1;"><a href="javascript:void(0);" class="list-group-item">
                                    <b>Profile</b> <span style="float: right; margin-right: 10px;"><b>Content</b></span> 
                                    </a>
                                </div>
                                
                                <div class="list-group-item">
                                    Name <span style="float: right"><%=name%></span> 
                                </div>
                                
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st1 = conn1.createStatement();

    ResultSet rs1 = st1.executeQuery("SELECT * from tbl_department where departmentId = '" + departmentId + "'");
    if (rs1.next()) {

%>
                                
                                <div class="list-group-item">
                                    Department <span style="float: right"><%=rs1.getString("departmentName")%></span> 
                                </div>  
                                
<% } %>

<%
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st2 = conn2.createStatement();

    ResultSet rs2 = st2.executeQuery("SELECT * from tbl_batch where batchId = '" + batchId + "'");
    if (rs2.next()) {

%>

                                
                                <div class="list-group-item">
                                    Batch <span style="float: right"><%=rs2.getString("batchName")%></span> 
                                </div> 
                                    
<% } %>                                
     
                                <div class="list-group-item">
                                    ID <span style="float: right"><%=uni_id%></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Email <span style="float: right"><%=email%></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Mobile <span style="float: right"><%=mobile%></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Profession <span style="float: right"><%=profession%></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Job Details <span style="float: right"><%=job%></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Location <span style="float: right"><%=location%></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Linkedin <span style="float: right"><a href="<%=linkedin%>"><i class="fa fa-linkedin" style="color: #55acee"></i></a></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Facebook <span style="float: right"><a href="<%=facebook%>"><i class="fa fa-facebook" style="color: #007bb5"></i></a></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Twitter <span style="float: right"><a href="<%=twitter%>"><i class="fa fa-twitter" style="color: #1494f6"></i></a></span> 
                                </div>
                                
                                <div class="list-group-item">
                                    Website <span style="float: right"><a href="<%=website%>"><i class="fa fa-globe" style="color: #607D8B"></i></a></span> 
                                </div>
                                
                                
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String date = "";
    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W, %e %M %Y') as 'date' FROM tbl_registration where uni_id = '" + id + "'");
    if (rs3.next()) {
        date = rs3.getString("date");
%>
                                
                                <div class="list-group-item">
                                    Joined On <span style="float: right"><%=date%></span> 
                                </div>
<% } %>
                                
                                <div class="list-group-item">
                                    Status <span style="float: right">
                                    <% 
                                        if(s == 0){
                                    %>
                                        <span class="btn bg-orange btn-block btn-xs waves-effect">Pending</span>
                                    <% } else { %>
                                        <span class="btn bg-teal btn-block btn-xs waves-effect">Active</span>
                                    <% } %>
                                    </span> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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

<%@include file="inc/footer.jsp" %>

</body>

</html>
