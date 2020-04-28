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

<%@page import="com.java.DB"%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@include file="inc/header.jsp" %>    
<%@include file="inc/sidebar.jsp" %> 

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">

<style>
    label {
        margin-bottom: 15px;
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
    
    String title = "", file = "", status = "", para1 = "", para2 = "", para3 = "";
    Connection conn = DB.getConnection();
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_news where id = '" + id + "'");
    while (rs.next()) {
        title  = rs.getString("title");
        para1  = rs.getString("para1");
        para2  = rs.getString("para2");
        para3  = rs.getString("para3");
        file   = rs.getString("file");
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
                                News Details  
                            </h2>
                        </div>
                        
                        <div class="body">
                            <form action="allnews.jsp" id="frmFileUpload" method="post">
                                
                                <label for="event_title">
                                    News Title
                                </label>
                                <div class="form-group">
                                    <div class="well">
                                        <%= title %>
                                    </div>
                                </div>
                                
                                <label for="image">Image</label>
                                <div class="form-group">
                                     <image src="/../alumni/news_images/<%= file %>" width="300px" height="165px"/>
                                </div>
                                
                                <label for="paragraph">Paragraph 1</label>
                                <div class="form-group">
                                    <div class="well">
                                        <%= para1 %>
                                    </div>
                                </div>
                                
                                <label for="paragraph">Paragraph 2</label>
                                <div class="form-group">
                                    <div class="well">
                                        <%= para2 %>
                                    </div>
                                </div>
                                
                                <label for="paragraph">Paragraph 3</label>
                                <div class="form-group">
                                    <div class="well">
                                        <%= para3 %>
                                    </div>
                                </div>
                                    
                                <label for="status" style="margin-bottom: 7px;">Status</label>
                                <div class="form-group">
                                    <% 
                                        if(s == 0){
                                    %>
                                        <span class="label bg-orange btn-xs waves-effect">Unpublished</span>
                                    <%  } else { %>
                                        <span class="label bg-teal btn-xs waves-effect">Published</span>
                                    <%  } %>
                                </div>
                                
                                <% 
                                    if(s == 1) {
                                %>
                                <label for="date" style="margin-bottom: 7px;">Published On</label>
                                    <div class="form-group">
<%   
        String id2 = "", date = "";
        id2 = rs.getString("id");

        Connection conn3 = DB.getConnection();
        Statement st3 = conn3.createStatement();

        ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W, %e %M %Y') as 'date' FROM tbl_news where id = '" + id2 + "'");
        while (rs3.next()) {
            date = rs3.getString("date");
%>  
                                        
                                            <span class="label bg-blue-grey">
                                                <%= date %>
                                            </span>
                                        
<%  } %>
                                    </div>
                                <%  } %>
                                    
                               
                                <button type="submit" class="btn btn-primary m-t-15 waves-effect">OK</button>
                            
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         
    </section>
<%
            }
%>

<%
    }
%>

<%@include file="inc/footer.jsp" %>

</body>

</html>
