<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@include file="inc/header.jsp" %>    
<%@include file="inc/sidebar.jsp" %>


    <section class="content">
        <div class="container-fluid">
            <div class="row clearfix">
                
                <div class="col-xs-12 col-sm-9">
                    <div class="card">
                        <div class="body">
                            <div>
                                <ul class="nav nav-tabs" role="tablist">                                    
                                    <li role="presentation" class="active"><a href="#profile_settings" aria-controls="settings" role="tab" data-toggle="tab">View Details</a></li>
                                    <li role="presentation"><a href="#change_password_settings" aria-controls="settings" role="tab" data-toggle="tab">Update Status</a></li>
                                </ul>

                                <div class="tab-content">                                           
                                    <div role="tabpanel" class="tab-pane fade in active" id="profile_settings">
                                        <form class="form-horizontal" action="alleventcomments.jsp" method="post">
                                            

<%
       
    String id = request.getParameter("id");
    
    Class.forName("com.mysql.jdbc.Driver");
    String uni_id = "", comment = "", event_id = "", status="";
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_eventcomment where id = '" + id + "'");
    while (rs.next()) {
        uni_id       = rs.getString("uni_id");
        comment      = rs.getString("comment");
        event_id     = rs.getString("event_id");
        
        id = rs.getString("id");
        
        status = rs.getString("status");
        int s = Integer.parseInt(status);
%>
                                            <div class="form-group">
<%   
            
    Class.forName("com.mysql.jdbc.Driver");
    String title = "";
    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
    Statement st2 = con2.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("select * from tbl_event where id = '" + event_id + "'");

    while (rs2.next()){
        title  = rs2.getString("title"); 
%>  
                                                
                                                <label for="Story" class="col-sm-2 control-label">Story</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line input-group">
                                                        <input type="text" style="font-weight:normal;text-align: justify;" class="form-control input-group-addon" id="Title" name="title" value="<%= title %>" readonly="" >
                                                        <span class="input-group-addon"><a href="allevents.jsp">Details</a> </span>
                                                    </div>
                                                </div>
<%       
    }
%>
                                            </div>
                                            
                                            <div class="form-group">
    <%   
            
           Class.forName("com.mysql.jdbc.Driver");
            String name = "";
            Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
            Statement st4 = con4.createStatement();
            ResultSet rs4;
            rs4 = st4.executeQuery("select * from tbl_registration where uni_id = '" + uni_id + "'");
                         
            
            while (rs4.next()){
                
                name   = rs4.getString("name");
                uni_id = rs4.getString("uni_id");
        %>  
                                                
                                                <label for="Commentator" class="col-sm-2 control-label">Commentator</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line input-group">
                                                        <input type="text" style="font-weight:normal;text-align: justify;" class="form-control input-group-addon well" id="Title" name="name" value="<%= name %>" readonly="" >
                                                        <span class="input-group-addon"><a href="details.jsp?id=<%= uni_id %>">Details</a> </span>
                                                    </div>
                                                </div>
<%       
    }
%>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label for="Comment" class="col-sm-2 control-label">Comment</label>
                                                <div class="col-sm-10">
                                                    <div class="well">
                                                        
                                                        <%= comment %>
                                                
                                                    </div>
                                                        
                                                </div>
                                            </div>
                                                        
                                            <div class="form-group">
    <%   
            
           Class.forName("com.mysql.jdbc.Driver");
            String id2 = "", date = "";
            id2 = rs.getString("id");

            Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
            Statement st3 = conn3.createStatement();

            ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W, %e %M %Y') as 'date' FROM tbl_eventcomment where id = '" + id2 + "'");
            while (rs3.next()) {
                date = rs3.getString("date");
    %>  
                                                
                                                <label for="Commented On" class="col-sm-2 control-label">Commented On</label>
                                                <div class="col-sm-10">
                                                    
                                                    <div class="well">
                                                        
                                                        <%= date %>
                                                
                                                    </div>
                                                </div>
<%       
    }
%>
                                            </div>
                                           
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-danger">OK</button>
                                                </div>
                                            </div>
<%      }
%>   
                                        </form>
                                    </div>
                                                    
                                    <div role="tabpanel" class="tab-pane fade in" id="change_password_settings">
                                        <form action="" id="frmFileUpload" method="post">
                                            
<%   
    try {
    String id3 = request.getParameter("id");
    
    Class.forName("com.mysql.jdbc.Driver");
    String uni_id2 = "", comment2 = "", event_id2 = "", status2 = "";
    Connection conn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st5 = conn5.createStatement();

    ResultSet rs5 = st5.executeQuery("select * from tbl_eventcomment where id = '" + id3 + "'");
    while (rs5.next()) {
        uni_id2       = rs5.getString("uni_id");
        comment2      = rs5.getString("comment");
        event_id2     = rs5.getString("event_id");
        
        status2 = rs5.getString("status");
        int s2 = Integer.parseInt(status);

%>    
                                
                                <label for="Comment">Comment Preview</label>
                                <br/><div class="form-group well">
                                    
                                    <%= comment2 %>
                                    
                                </div>
                                
                                <label for="image">Current Status</label>
                                
                                <div class="form-group">
<%
    if(s2 == 0){
%>
                                            <span class="btn btn-default btn-xs waves-effect" style="margin-top: 8px;">Pending</span>
<%
    } else if(s2 == 1){
%>
                                            <span class="btn btn-info btn-xs waves-effect" style="margin-top: 8px;">Accepted</span>
<%
    } else {
%>
                                            <span class="btn bg-orange btn-xs waves-effect" style="margin-top: 8px;">Rejected</span>
<%
    }
%>
                                </div>
                                
<style type="text/css">
    
</style>


                            <label for="Update">Update Status</label>

                            <div class="form-group">
                                
                                <ul style="margin-left: -37px; list-style: none; line-height: 35px;">
                                    
                                    
                                        <li><% if(s2==0) { %> 
                                            <button class="btn bg-blue-grey btn-xs waves-effect" disabled="disabled">Pending</button>
                                            
                                            <% } %>
                                        </li>
                                        
                                        <li><% if(s2==1) {%> 
                                            <button class="btn btn-success btn-xs waves-effect" disabled="disabled">Accept</button>
                                            <% } else { %>
                                            <a class="btn btn-success btn-xs waves-effect" href="editcommentstatus.jsp?accept_id=<%= id %>">Accept</a>
                                            <% } %>
                                        </li>
                                        
                                        
                                        <li><% if(s2==2) {%> 
                                            <button class="btn btn-danger btn-xs waves-effect" disabled="disabled">Reject</button>
                                            <% } else { %>
                                            <a class="btn btn-danger btn-xs waves-effect" href="editcommentstatus.jsp?reject_id=<%= id %>">Reject</a>
                                            <% } %>
                                        </li>
                                    </ul>
                                 
                            </div>

                      
<%                                
    } }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }   
%>   
                            
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@include file="inc/footer.jsp" %>

   
