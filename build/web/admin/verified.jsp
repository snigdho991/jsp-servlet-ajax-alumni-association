<%-- 
    Document   : verified
    Created on : Jul 15, 2019, 4:32:57 PM
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

<section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>
                    Students Controller
                    <small>Taken from <a href="https://datatables.net/" target="_blank">datatables.net</a></small>
                </h2>
            </div>    
        <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                All Verified Alumnus
                            </h2>
                            
                           
                            
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>Department</th>
                                            <th>Batch</th>
                                            <th>ID</th>
                                            <th>Email</th>
                                            <th>Mobile</th>
                                            <th>Profession</th>
                                            <th>Location</th>
                                            <th>Options</th>
                                              
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                                                               
                                            
        <%   
            try {
            Class.forName("com.mysql.jdbc.Driver");
            String name = "", uni_id = "", email = "", mobile = "", profession = "", location = "",  facebook = "", date="", departmentName = "", departmentId = "", batchId = "", batchName = "", status="";
            
            int i = 0;
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT tbl_registration.*, tbl_batch.*, tbl_department.* FROM tbl_department INNER JOIN tbl_registration ON tbl_registration.departmentId = tbl_department.departmentId INNER JOIN tbl_batch ON tbl_registration.batchId = tbl_batch.batchId");
                         
            
            while(rs.next()){
                name           = rs.getString("name");
                departmentName = rs.getString("departmentName");
                batchName      = rs.getString("batchName");
                uni_id         = rs.getString("uni_id");
                email          = rs.getString("email");
                mobile         = rs.getString("mobile");
                profession     = rs.getString("profession");
                location       = rs.getString("location");
                facebook       = rs.getString("facebook");
                
                date       = rs.getString("date");
                status = rs.getString("status");
                int s = Integer.parseInt(status);
                
                System.out.println(status);
                if(s != 1)
                    continue;
                
                i++;
                    
        %>    
        <tr>
                                            <td> <%= i %> </td>
                                            <td><%= name %></td>
                                            
                            
                                            <td><%= departmentName %></td>
                            
                                            
            
                                            <td><%= batchName %></td>
                                            <td><%= uni_id %></td>
                                            <td><%= email %></td>
                                            <td><%= mobile %></td>
                                            <td><%= profession %></td>
                                            <td><%= location %></td>
                                            <td><div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  Action <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="details.jsp?id=<%= uni_id %>">Details</a>
                                    </li>
                                    <li><a class="dropdown-item" href="#">Edit</a>
                                    </li>
                                    
                                    <div class="dropdown-divider"></div>
                                    
                                    <li><a class="dropdown-item" href="#">Remove</a>
                                    </li>
                                    
                                </ul>
                              </div></td>
                                            
                                            
        </tr>
                                            
<%       } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   %>                                           
  
                                      
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>

<%@include file="inc/footer.jsp" %>

</body>

</html>
