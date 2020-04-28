<%-- 
    Document   : adminprofile
    Created on : Aug 6, 2019, 11:46:48 PM
    Author     : singdho
--%>

<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@include file="inc/header.jsp" %>    
<%@include file="inc/sidebar.jsp" %>

<style>
    input#file {
        display: inline-block;
        width: 100%;
        padding: 120px 0 0 0;
        height: 100px;
        overflow: hidden;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        background: url('images/upload.png') center center no-repeat #e4e4e4;
        border-radius: 20px;
        background-size: 60px 60px;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.16), 0 2px 6px rgba(0, 0, 0, 0.12);
        cursor: pointer;
    }
</style>

    <section class="content">
        <div class="container-fluid">
            <div class="row clearfix">
                
                <div class="col-xs-12 col-sm-9">
                    <div class="card">
                        <div class="body">
                            <div>
                                <ul class="nav nav-tabs" role="tablist">                                    
                                    <li role="presentation" class="active"><a href="#profile_settings" aria-controls="settings" role="tab" data-toggle="tab">Text Settings</a></li>
                                    <li role="presentation"><a href="#change_password_settings" aria-controls="settings" role="tab" data-toggle="tab">Change Image</a></li>
                                </ul>

                                <div class="tab-content">                                           
                                    <div role="tabpanel" class="tab-pane fade in active" id="profile_settings">
                                        <form class="form-horizontal" action="aboutText.jsp" method="post">
                                            

<%
    try {    
    Class.forName("com.mysql.jdbc.Driver");
    String title="", description="";
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from tbl_about where id = '1'");
    while(rs.next()){
       title       = rs.getString("title");
       description = rs.getString("description");
%>
                                        
                                    
                                            <div class="form-group">
                                                <label for="Title" class="col-sm-2 control-label">Title</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" class="form-control" id="Title" name="title" value="<%=title%>" required="" >
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Description" class="col-sm-2 control-label">Description</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        
                                                        <textarea rows="3" class="form-control no-resize auto-growth" name="description" required=""><%=description%></textarea>
                                                
                                                    </div>
                                                        
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <div class="col-sm-offset-2 col-sm-10">
                                                    <button type="submit" class="btn btn-danger">SUBMIT</button>
                                                </div>
                                            </div>
<%       } }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }   
%>   
                                        </form>
                                    </div>
                                                    
                                    <div role="tabpanel" class="tab-pane fade in" id="change_password_settings">
                                        <form action="/../alumni/aboutImage" id="frmFileUpload" method="post" enctype="multipart/form-data">
                                            
<%   
    try {
    Class.forName("com.mysql.jdbc.Driver");
    String image = "";

    Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
    Statement st2 = con2.createStatement();
    ResultSet rs2;
    rs2 = st2.executeQuery("select * from tbl_about where id = '1'");

    while (rs2.next()){       
        image = rs2.getString("image");

%>    
                                
                                <label for="image_title">Preview</label>
                                <div class="form-group">
                                    
                                    <img src="/../alumni/about_images/<%=image%>" alt="About" style="height: 118px; width: 360px;" />
                                    
                                </div>
                                
                                <label for="image">Select Image</label>
                                
                                <div class="fallback">
                                    <br/><input name="file" id="file" type="file" multiple />
                                </div>
                              
                                <br><button type="submit" class="btn btn-danger">SUBMIT</button>

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

   