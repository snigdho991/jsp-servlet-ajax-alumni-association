<%-- 
    Document   : allslides
    Created on : Aug 16, 2019, 1:17:35 AM
    Author     : singdho
--%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="com.java.DB"%>


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
                    News Controller
                </h2>
            </div>    
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                All News
                            </h2>
                                                       
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
                                        <tr>
                                            <th style="width:5%">No.</th>
                                            <th style="width:28%">Title</th>
                                            <th style="width:13%">Image</th>
                                            <th style="width:11%">Viewed</th>
                                            <th style="width:13%">Status</th>
                                            <th style="width:15%">Published On</th>
                                            <th style="width:15%">Options</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                                                               
                                            
        <%   
            try {
            String id = "", title = "", file = "", status = "" ;
            int views;
            
            int i = 0;
            Connection con = DB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from tbl_news order by id asc");
                         
            
            while (rs.next()){
                i++;
                               
                id     = rs.getString("id");
                title  = rs.getString("title");
                file   = rs.getString("file");
                status = rs.getString("status");
                views  = rs.getInt("views");
        
                int s = Integer.parseInt(status);
                 
        %>    
        <tr>
                                            <td> <%= i %> </td>
                                            <td><%= title %></td>
                                            
                                            <td><p><button class="btn bg-teal btn-block btn-xs waves-effect reveal" style="width:37%">Show</button></p><div class="toggle_container"><div class="block"> <image src="/../alumni/news_images/<%=file%>" width="90px" height="55px"/></div></div>
                                            </td>
                                            
                                            <td><%= views %> times</td>
                                            
                                            <td>
<%
    if(s == 0){
%>
                                                <button class="btn btn-default btn-xs waves-effect">Unpublished</button>
<%
    } else if(s == 1){
%>
                                            <button class="btn btn-info btn-xs waves-effect">Published</button>
<%
    } 
%>
                                            
                                            </td>
                          
                                            <td>
<%
    
    String date = "";
    Connection conn3 =  DB.getConnection();
    Statement st3 = conn3.createStatement();

    ResultSet rs3 = st3.executeQuery("select DATE_FORMAT(date, '%W, %e %b %Y') as 'date' FROM tbl_news where id = '" + id + "'");
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
                                    <li><a class="dropdown-item" href="particularnews.jsp?id=<%= id %>">Details</a>
                                    </li>
                                    <li><a class="dropdown-item" href="editnews.jsp?id=<%= id %>">Edit</a>
                                    </li>
                                    
                                    <div class="dropdown-divider"></div>
                                    
                                    <li><a onclick="return confirm('Are you sure to delete ?');" class="dropdown-item" href="dltnews.jsp?id=<%= id %>">Remove</a>
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
