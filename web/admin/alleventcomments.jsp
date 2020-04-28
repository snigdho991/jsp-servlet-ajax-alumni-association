<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@include file="inc/header.jsp" %>    
<%@include file="inc/sidebar.jsp" %> 

<style>
    label {   
        margin-left: 900px;
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

<section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Event Controller
                </h2>
            </div>    
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                All Event Comments
                            </h2>
                                                       
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Story</th>
                                            <th>Commentator</th>
                                            <th>Status</th>
                                            <th>Commented On</th>
                                            <th>Options</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
    
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String id = "", uni_id = "", status = "";
    int i = 0;
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_eventcomment order by date desc");
    while (rs.next()) {
        i++;
                          
        uni_id = rs.getString("uni_id");
        id     = rs.getString("event_id");
        status = rs.getString("status");
        
        int s = Integer.parseInt(status);
                
%>
                                        
                                        
        <tr>
                                            <td> <%= i %> </td>
                                            
                                            <td>
        <%   
            
            Class.forName("com.mysql.jdbc.Driver");
            String title = "";
            Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
            Statement st2 = con2.createStatement();
            ResultSet rs2;
            rs2 = st2.executeQuery("select * from tbl_event where id = '" + id + "'");
                         
            
            while (rs2.next()){
                
                title  = rs2.getString("title"); 
        %>  
                                                <%= title %>
<%       
        }   
%>
                                            </td>
                                            
                                            <td>
        <%   
            
            Class.forName("com.mysql.jdbc.Driver");
            String name = "";
            Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
            Statement st4 = con4.createStatement();
            ResultSet rs4;
            rs4 = st4.executeQuery("select * from tbl_registration where uni_id = '" + uni_id + "'");
                         
            
            while (rs4.next()){
                
                name  = rs4.getString("name"); 
        %>  
                                                <%= name %>
<%       
        }   
%>
                                            </td>
                                            
                                            <td>
<%
    if(s == 0){
%>
                                                <button class="btn btn-default btn-xs waves-effect">Pending</button>
<%
    } else if(s == 1){
%>
                                                <button class="btn btn-info btn-xs waves-effect">Accepted</button>
<%
    } else {
%>
                                                <button class="btn bg-orange btn-xs waves-effect">Rejected</button>
<%
    }
%>
                                            
                                            </td>
                                           
                                           
                                            <td>
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
                                                <%= date %> 
<% } %>
                                            </td>

                                            
                        <td><div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Action <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="editeventcomments.jsp?id=<%= id2 %>">Details</a>
                                    </li>
                                    
                                    <div class="dropdown-divider"></div>
                                    
                                    <li><a onclick="return confirm('Are you sure to delete ?');" class="dropdown-item" href="dlteventcomment.jsp?id=<%= id2 %>">Remove</a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </td>
                                            
<%
    }
%>                                    
        </tr>
                                   </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
        
<%
    }
%>


<%@include file="inc/footer.jsp" %>
