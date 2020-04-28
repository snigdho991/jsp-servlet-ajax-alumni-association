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
                                    <li role="presentation" class="active"><a href="#text_settings" aria-controls="settings" role="tab" data-toggle="tab">Text Settings</a></li>
                                    <li role="presentation"><a href="#image_settings" aria-controls="settings" role="tab" data-toggle="tab">Change Image</a></li>
                                    <li role="presentation"><a href="#status_settings" aria-controls="settings" role="tab" data-toggle="tab">Update Status</a></li>
                                </ul>

                                <div class="tab-content">                                           
                                    <div role="tabpanel" class="tab-pane fade in active" id="text_settings">
                                        <form class="form-horizontal" action="newsText.jsp" method="post">
                                            

<%
       
    String id = request.getParameter("id");
    
    Class.forName("com.mysql.jdbc.Driver");
    String title = "", id4 = "", para1 = "", para2 = "", para3 = "";
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st = conn.createStatement();

    ResultSet rs = st.executeQuery("select * from tbl_news where id = '" + id + "'");
    while (rs.next()) {
        title = rs.getString("title");
        para1 = rs.getString("para1");
        para2 = rs.getString("para2");        
        para3 = rs.getString("para3");
        
%>
                                    <input type="hidden" name="id" value="<%= id %>">   
                                            <div class="form-group">
                                                
                                                <label for="News" class="col-sm-2 control-label">Title</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <input type="text" style="font-weight:normal;text-align: justify;" class="form-control" id="Title" name="title" value="<%= title %>" required="">
                                                    </div>
                                                </div>

                                            </div>
                                            
                                            <div class="form-group">  
                                                
                                                <label for="paragraph" class="col-sm-2 control-label">Paragraph 1</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <textarea rows="5" class="form-control no-resize auto-growth" name="para1" required=""><%= para1 %></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">  
                                                
                                                <label for="paragraph" class="col-sm-2 control-label">Paragraph 2</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <textarea rows="5" class="form-control no-resize auto-growth" name="para2" required=""><%= para2 %></textarea>
                                                    </div>
                                                </div>
                                          </div>
                                            
                                            <div class="form-group">  
                                                
                                                <label for="paragraph" class="col-sm-2 control-label">Paragraph 3</label>
                                                <div class="col-sm-10">
                                                    <div class="form-line">
                                                        <textarea rows="5" class="form-control no-resize auto-growth" name="para3" required=""><%= para3 %></textarea>
                                                    </div>
                                                </div>
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
                                        
                                    <div role="tabpanel" class="tab-pane fade in" id="image_settings">
                                        <form action="/../alumni/newsImage" id="frmFileUpload" method="post" enctype="multipart/form-data">
                                            
<%   
    try {
        String id2 = request.getParameter("id");

        Class.forName("com.mysql.jdbc.Driver");
        String file = "";

        Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni", "root", "");
        Statement st2 = con2.createStatement();
        ResultSet rs2;
        rs2 = st2.executeQuery("select * from tbl_news where id = '" + id2 + "'");

        while (rs2.next()){       
            file = rs2.getString("file");

%>    
                            <input type="hidden" name="id2" value="<%= id2 %>">   
                                <label for="image_title">Preview</label>
                                <div class="form-group">
                                    
                                    <img src="/../alumni/news_images/<%=file%>" alt="News" style="height: 165px; width: 360px;" />
                                    
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
                                                    
                                    <div role="tabpanel" class="tab-pane fade in" id="status_settings">
                                        <form action="" id="frmFileUpload" method="post">
                                            
<%   
    try {
    String id3 = request.getParameter("id");
    
    Class.forName("com.mysql.jdbc.Driver");
    String status2 = "";
    Connection conn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_alumni","root","");
    Statement st5 = conn5.createStatement();

    ResultSet rs5 = st5.executeQuery("select * from tbl_news where id = '" + id3 + "'");
    while (rs5.next()) {
        status2 = rs5.getString("status");
        int s2 = Integer.parseInt(status2);

%>    
                                
                                
                                <label for="image">Current Status</label>
                                
                                <div class="form-group">
<%
    if(s2 == 0){
%>
                                            <span class="btn btn-default btn-xs waves-effect" style="margin-top: 8px;">Unpublished</span>
<%
    } else if(s2 == 1){
%>
                                            <span class="btn btn-info btn-xs waves-effect" style="margin-top: 8px;">Published</span>
<%
    } 
%>
                                </div>
                                
<style type="text/css">
    
</style>


                            <label for="Update">Update Status</label>

                            <div class="form-group">
                                
                                <ul style="margin-left: -37px; list-style: none; line-height: 35px;">
                                    
                                        <li><% if(s2==0) {%> 
                                            <button class="btn btn-danger btn-xs waves-effect" disabled="disabled">Unpublished</button>
                                            <% } else { %>
                                            <a class="btn btn-danger btn-xs waves-effect" href="newsstatus.jsp?reject_id=<%= id %>">Un-publish</a>
                                            <% } %>
                                        </li>
                                        
                                        
                                        <li><% if(s2==1) {%> 
                                            <button class="btn btn-success btn-xs waves-effect" disabled="disabled">Published</button>
                                            <% } else { %>
                                            <a class="btn btn-success btn-xs waves-effect" href="newsstatus.jsp?accept_id=<%= id %>">Publish</a>
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
