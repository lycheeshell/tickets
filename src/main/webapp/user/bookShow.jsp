<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>现场售票</title>
    
<script type="text/javascript">
	var path = "<%=path%>";
	var id = "<%=id%>";
</script>

<style type="text/css">

</style>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/style.min.css" />

</head>

<body class="skin-default-dark fixed-layout">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">tickets</p>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="<%=path%>/user/index.jsp?id=<%=id%>">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="<%=path%>/dist/images/logo-icon.png" alt="homepage" class="dark-logo" />
                            <!-- Light Logo icon -->
                            <img src="<%=path%>/dist/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         <!-- dark Logo text -->
                         <img src="<%=path%>/dist/images/logo-text.png" alt="homepage" class="dark-logo" />
                         <!-- Light Logo text -->    
                         <img src="<%=path%>/dist/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto">
                    </ul>
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<%=path%>/dist/images/venue-main.jpg" alt="user" class="img-circle" width="30"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">
                                <span class="with-arrow"><span class="bg-primary"></span></span>
                                <!-- <div class="d-flex no-block align-items-center p-15 bg-primary text-white m-b-10">
                                    <div class=""><img src="<%=path%>/dist/images/venue-main.jpg" alt="user" class="img-circle" width="60"></div>
                                    <div class="m-l-10">
                                        <h4 class="m-b-0" id="venueName">场馆名</h4>
                                    </div>
                                </div> -->
                                <a class="dropdown-item" href="<%=path%>/user/userInfo.jsp?id=<%=id%>">查看个人信息</a>
                                <a class="dropdown-item" href="<%=path%>/user/bookShow.jsp?id=<%=id%>">演出预定</a>
                                <a class="dropdown-item" href="<%=path%>/user/cancelShow.jsp?id=<%=id%>">演出退订</a>
                                <a class="dropdown-item" href="<%=path%>/user/showOrderState.jsp?id=<%=id%>">查看订单状态</a>
                                <a class="dropdown-item" href="<%=path%>/user/showStatistics.jsp?id=<%=id%>">查看个人统计信息</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="<%=path%>/user/login.jsp">退出</a>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
        	<div class="container-fluid">
        		<div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">在售演出</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                        </div>
                    </div>
                </div>
				<!-- Row -->
                <div class="row">
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row" id="showDiv">
                            
                        </div>
                        <!-- Row -->
                    </div>
                </div>
                <!-- End Row -->        		
        	</div>
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">
            © 2019 tickets by lycheeshell
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<%=path%>/dist/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=path%>/dist/js/popper.min.js"></script>
    <script src="<%=path%>/dist/js/bootstrap.min.js"></script>
    <!--Wave Effects -->
    <script src="<%=path%>/dist/js/waves.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=path%>/dist/js/custom.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $(".preloader").fadeOut();
        });
    </script>
    
    <script type="text/javascript">
    
    $(function() {
    	$.ajax({
            type: "POST",
            url: path + "/user/getShows.action",
            dataType: "json",
            success: function (backData) {
                setShowInfo(backData);
            },
            error: function() {
            	alert("获取演出信息失败");
            }
        });
    })
    
    function setShowInfo(shows) {
    	$("#showDiv").html("");
        var html = "";
        for(var i = 0;i<shows.length;i++){
        	var item = shows[i];
        	html += "<div class='col-lg-3 col-md-6'>";
        	html += "<div class='card'>";
        	
        	var showName = item.name + "venue" + item.venue.id;
        	html += "<img class='card-img-top img-responsive' src='" + path + "/dist/images/venue/" + showName + ".jpg' alt='Card image cap'>";
        	
        	html += "<div class='card-body'>";
        	
        	html += "<a href='" + path + "/user/buyTicket.jsp?id=" + id + "&showid=" + item.id + "' class='btn btn-primary'>" + item.name + "</a>";
        	
        	html += "</div>";
        	html += "</div>";
        	html += "</div>";
        }
        $("#showDiv").html(html);
    }
    
    </script>
    
</body>
</html>