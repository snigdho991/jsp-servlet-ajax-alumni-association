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
    
    textarea{
        width: 100%;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-shadow: inset 0 1px 3px #ddd;
        border-radius: 4px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-transition: all 0.30s ease-in-out;
        -moz-transition: all 0.30s ease-in-out;
        -ms-transition: all 0.30s ease-in-out;
        -o-transition: all 0.30s ease-in-out;
        box-sizing: border-box;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 12px;
        padding-bottom: 12px;
        height: 130px;
        line-height: 1.42857143;
        font-size: 14px;
    }
    
    textarea:focus {
       
        border-color: #ff80ff !important;
        box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(255, 100, 255, 0.5) !important;
    }
    
    input[type=text], input[type=password]{
        width: 100%;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-shadow: inset 0 1px 3px #ddd;
        border-radius: 4px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-transition: all 0.30s ease-in-out;
        -moz-transition: all 0.30s ease-in-out;
        -ms-transition: all 0.30s ease-in-out;
        -o-transition: all 0.30s ease-in-out;
        box-sizing: border-box;
        padding-left: 20px;
        padding-right: 20px;
        padding-top: 12px;
        padding-bottom: 12px;
    }
    
    
    input[type=text]:focus, input[type=password]:focus {
        box-shadow:0 0 5px rgba(81, 203, 238, 1);
        border: 1px solid rgba(81, 203, 238, 1);
        transition: 0.7s;
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
                <h2>Email Sender</h2>
            </div>
                 
                                
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        
                        <div class="header">
                            <h2>
                                Email to all 
                            </h2>
                        </div>
                       
                        <div class="body">
                            <form action="/../alumni/EmailController" method="post">
                                <%-- 
                            <% 
                                if (request.getAttribute("alertMsg") != null){
                            %>
                            <div class="alert alert-info alert-dismissible" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <%= request.getAttribute("alertMsg") %>
                            </div>
                            <% } %> --%>
                                
                                <label for="from">Sender Email</label>
                                <div class="form-group">
                                    <div class="form-control">
                                        <input name="user" type="text" value="madisonpop1@gmail.com" readonly="">
                                    </div>
                                </div><br>
                                
                                <label for="password">Password</label>
                                <div class="form-group">
                                    <div class="form-control">
                                        <input name="pass" type="password" value="tangail199" readonly="">
                                    </div>
                                </div><br>
                                
                                <label for="subject">Subject</label>
                                <div class="form-group">
                                    <div class="form-control">
                                        <input name="subject" type="text" placeholder="Enter email subject" required="">
                                    </div>
                                </div><br>
                                
                                <label for="image">Message</label>
                                <div class="form-group">
                                    <div class="form-control">
                                        
                                        <textarea name="message" placeholder="Enter email message" required=""></textarea>
                                    </div>
                                </div>
                                
                                
                                <br><br><br><br><br><button type="submit" class="btn bg-teal m-t-15 waves-effect">SEND</button>
                            
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

