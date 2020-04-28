<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%@include file="inc/header.jsp" %>    
<%@include file="inc/sidebar.jsp" %>


<!-- Tags Input -->
    <section class="content">
        <div class="container-fluid">
            <div class="row clearfix">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                TAGS INPUT
                                <small>Taken from <a href="https://github.com/bootstrap-tagsinput/bootstrap-tagsinput" target="_blank">github.com/bootstrap-tagsinput/bootstrap-tagsinput</a></small>
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                            <div class="form-group demo-tagsinput-area">
                                <div class="form-line">
                                    <input type="text" class="form-control" data-role="tagsinput" value="Amsterdam,Washington,Sydney,Beijing,Cairo">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
                <!-- #END# Tags Input -->

<%@include file="inc/footer.jsp" %>
