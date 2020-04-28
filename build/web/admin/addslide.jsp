<%-- 
    Document   : addslide
    Created on : Aug 14, 2019, 4:35:33 PM
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
                <h2>Slider Controller</h2>
            </div>
                 
                                
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        
                        <div class="header">
                            <h2>
                                Add New Slide
                            </h2>
                        </div>
                       
                        <div class="body">
                            <form action="/../alumni/SliderUploadServlet" id="frmFileUpload" method="post" enctype="multipart/form-data">
                                
                                <label for="image_title">Title</label>
                                <div class="form-group">
                                    <div class="form-line">
                                        <input name="title" type="text" class="form-control" placeholder="Enter slider image title">
                                    </div>
                                </div>
                                
                                <label for="image">Select Image</label>
                                
                                <div class="fallback">
                                    <br/><input name="file" id="file" type="file" multiple />
                                </div>
                                    
                                
                                
                                <button type="submit" class="btn btn-primary m-t-15 waves-effect">SUBMIT</button>
                            
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

<%@include file="inc/footer.jsp" %>
