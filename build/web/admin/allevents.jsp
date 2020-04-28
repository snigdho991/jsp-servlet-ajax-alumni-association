<%-- 
    Document   : allslides
    Created on : Aug 16, 2019, 1:17:35 AM
    Author     : singdho
--%>

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

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>

<script>
    $(document).ready(function(){
        $(".toggle_container").hide(); 
        $("button.reveal").click(function(){
            $(this).toggleClass("active").parent().next('.toggle_container').slideToggle("fast");

            if ($.trim($(this).text()) === 'Show') {
                $(this).text('Hide');
            } else {
                $(this).text('Show');        
            }

            return false; 
        });
         $("a[href='" + window.location.hash + "']").parent(".reveal").click();
        });
</script>

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
                                All Events
                            </h2>
                                                       
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
                                        <tr>
                                            <th style="width:3%">No.</th>
                                            <th style="width:12%">Title</th>
                                            <th style="width:15%">Event Date</th>
                                            <th style="width:10%">Event Time</th>
                                            <th style="width:23%">Venue</th>
                                            <th style="width:15%">Image</th>
                                            <th style="width:10%">Added On</th>
                                            <th style="width:12%">Options</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                                                               
                                            
        <%   
            try {
            Class.forName("com.mysql.jdbc.Driver");
            String id = "", title = "", time = "", venue = "", file = "";
            
            int i = 0;
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from tbl_event order by id asc");
                         
            
            while (rs.next()){
                i++;
                               
                id    = rs.getString("id");
                title = rs.getString("title");
                time  = rs.getString("time");
                venue = rs.getString("venue");
                file  = rs.getString("file");
                 
        %>    
        <tr>
                                            <td> <%= i %> </td>
                                            <td><%= title %></td>
                          
                                            <td>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String date = "";
    Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W, %e %b %Y') as 'date' FROM tbl_event where id = '" + id + "'");
    while (rs3.next()) {
        date = rs3.getString("date");
%>
                                                <%= date %> 
<% } %>
                                            </td>
                                            
                                            <td><%= time %></td>
                                            <td><%= venue %></td>
                                            
                                            <td><p><button class="btn bg-teal btn-block btn-xs waves-effect reveal" style="width:30%">Show</button></p><div class="toggle_container"><div class="block"> <image src="/../alumni/event_images/<%=file%>" width="90px" height="55px"/></div></div>
                                            </td>
                                            <td>
                                            
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    String added_on = "";
    Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st2 = conn2.createStatement();

    ResultSet rs2 = st2.executeQuery("select DATE_FORMAT(added_on, '%e %b, %Y') as 'added_on' FROM tbl_event where id = '" + id + "'");
    while (rs2.next()) {
        added_on = rs2.getString("added_on");
%>
                                                <%= added_on %> 
<% } %>
                                            </td>

                                            
                                            <td><div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Action <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="particularevent.jsp?id=<%= id %>">Details</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Edit</a>
                                    </li>
                                    
                                    <div class="dropdown-divider"></div>
                                    
                                    <li><a class="dropdown-item" href="#">Remove</a>
                                    </li>
                                    
                                </ul>
                              </div>
                                            </td>
                                            
                                            
        </tr>
                                            
<%       } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   
%>                                           
  
                                      
                                        
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