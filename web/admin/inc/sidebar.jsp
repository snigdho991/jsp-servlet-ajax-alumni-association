<%-- 
    Document   : sidebar
    Created on : Jul 15, 2019, 2:22:19 PM
    Author     : singdho
--%>


<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page import="com.java.DB"%>

<% 
    if ((session.getAttribute("adminEmail") == null) || (session.getAttribute("adminEmail") == "")){ %>
    <div class='alert alert-warning'>You aren't logged in ! Please <a class="btn btn-primary btn-xs" href="/../alumni/admin/index.jsp">log in</a> to continue.</div>
<%
    } else {
%>

    <script type='text/javascript'>
        var current = document.getElementById('default');
        var currentLocation = window.location.href;
        
        function active(el)
        {
           if (current !== null && this.href === currentLocation)
           {
               current.className = "";
               
           }
           el.className = "active";
           current = el;
           currentLocation = el;
        }
        
        
    </script>

<section>
        <!-- Left Sidebar -->
        <aside id="leftsidebar" class="sidebar">
            <!-- User Info -->
            <div class="user-info">
                <div class="image">
                    <img src="images/user.png" width="48" height="48" alt="User" />

<%
        
        String adminName="";
        Connection con = DB.getConnection();
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("select * from tbl_admin where adminEmail = '"+session.getAttribute("adminEmail")+"'");
        while(rs.next()){
           adminName = rs.getString("adminName");
           
        }   
        
%>
                    
            <div style="float: right; color: #fff; margin-top: 17px; margin-left: 10px;">Welcome , <%=adminName%>
            </div>
            </div>
                

                
                
                <div class="info-container">
                    <div class="name" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rank : Administrator</div>
                   
                    <div class="email"><%=session.getAttribute("adminEmail")%></div>
                    <div style="bottom: -4px;" class="btn-group user-helper-dropdown">
                        <i class="material-icons" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">keyboard_arrow_down</i>
                        <ul class="dropdown-menu pull-right">
                           
                            <li><a href="adminprofile.jsp"><i class="material-icons">person</i>Profile</a></li>
                            <li><a href=""><i class="material-icons">language</i>Website</a></li>
                           
                            
                            <li><a href=""><i class="material-icons">sms</i>Inbox</a></li>
                            <li role="separator" class="divider"></li>
                            
                            <li><a href="adminlogout.jsp"><i class="material-icons">input</i>Sign Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #User Info -->
            <!-- Menu -->
            <div class="menu">
                <ul class="list">
                    <li class="header">MAIN NAVIGATION</li>
                    <li onclick="active(this);" id="default">
                        <a href="dashboard.jsp">
                            <i class="material-icons">home</i>
                            <span>Home</span>
                        </a>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">assignment_ind</i>
                            <span>Students</span>
                        </a>
                        <ul class="ml-menu">
                            <li class="active" onclick="active(this);">
                                <a href="verified.jsp">Verified</a>
                            </li>
                            <li onclick="active(this);">
                                <a href="pending.jsp">Pending</a>
                            </li>
                            <li onclick="active(this);">
                                <a href="emailtoall.jsp">Email to all</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">archive</i>
                            <span>Sliders</span>
                        </a>
                        <ul class="ml-menu">
                            <li onclick="active(this);">
                                <a href="addslide.jsp">Add slide</a>
                            </li>
                            <li onclick="active(this);">
                                <a href="allslides.jsp">Slides</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="about.jsp">
                            <i class="material-icons">info_outline</i>
                            <span>About Us</span>
                        </a>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">event_available</i>
                            <span>Event</span>
                        </a>
                        <ul class="ml-menu">
                            <li onclick="active(this);">
                                <a href="addevent.jsp">Add event</a>
                            </li>
                            <li onclick="active(this);">
                                <a href="allevents.jsp">Events</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="alleventcomments.jsp">
                            <i class="material-icons">chat</i>
                            <span>Event Comments</span>
                        </a>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">developer_board</i>
                            <span>News</span>
                        </a>
                        <ul class="ml-menu">
                            <li onclick="active(this);">
                                <a href="addnews.jsp">Add News</a>
                            </li>
                            <li onclick="active(this);">
                                <a href="allnews.jsp">News</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li onclick="active(this);">
                        <a href="allnewscomments.jsp">
                            <i class="material-icons">receipt</i>
                            <span>News Comments</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="javascript:void(0);" class="menu-toggle">
                            <i class="material-icons">view_list</i>
                            <span>Tables</span>
                        </a>
                        <ul class="ml-menu">
                            <li>
                                <a href="pages/tables/normal-tables.html">Normal Tables</a>
                            </li>
                            <li>
                                <a href="pages/tables/jquery-datatable.html">Jquery Datatables</a>
                            </li>
                            <li>
                                <a href="pages/tables/editable-table.html">Editable Tables</a>
                            </li>
                        </ul>
                    </li>                   
                  
   
                </ul>
            </div>
            <!-- #Menu -->
            <!-- Footer -->
            <div class="legal">
                <div class="copyright">
                    &copy; 2019 - <a href="javascript:void(0);">Snigdho2011@gmail.com</a>.
                </div>
                
            </div>
            <!-- #Footer -->
        </aside>
        <!-- #END# Left Sidebar -->
        
    </section>
                    
    <% } %>