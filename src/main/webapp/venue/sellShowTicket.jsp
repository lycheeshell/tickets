<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String showid = request.getParameter("showid");
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
	var name = "<%=name%>";
	var showid = "<%=showid%>";
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
                    <a class="navbar-brand" href="<%=path%>/venue/index.jsp?id=<%=id%>&name=<%=name%>">
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
                                <div class="d-flex no-block align-items-center p-15 bg-primary text-white m-b-10">
                                    <div class=""><img src="<%=path%>/dist/images/venue-main.jpg" alt="user" class="img-circle" width="60"></div>
                                    <div class="m-l-10">
                                        <h4 class="m-b-0" id="venueName">场馆名</h4>
                                    </div>
                                </div>
                                <a class="dropdown-item" href="<%=path%>/venue/venueInfo.jsp?id=<%=id%>&name=<%=name%>">修改场馆信息</a>
                                <a class="dropdown-item" href="<%=path%>/venue/releaseShow.jsp?id=<%=id%>&name=<%=name%>">发布演出</a>
                                <a class="dropdown-item" href="<%=path%>/venue/sellTicket.jsp?id=<%=id%>&name=<%=name%>">现场售票</a>
                                <a class="dropdown-item" href="<%=path%>/venue/checkTicket.jsp?id=<%=id%>&name=<%=name%>">检票登记</a>
                                <a class="dropdown-item" href="<%=path%>/venue/showStatistics.jsp?id=<%=id%>&name=<%=name%>">查看场馆统计信息</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="<%=path%>/venue/login.jsp">退出</a>
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
                        <h4 class="text-themecolor">售票</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">座位信息</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>座位名称</th>
                                                <th>座位数量</th>
                                                <th>座位价格</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="seatTable">
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
	        $("#venueName").text(name);
	    });
	    
	    $(document).on("click","#modifyVenue",function(){
	    	window.location.href = path + "/venue/venueInfo.jsp?id=" + id + "&name=" + name;
	    })
    
    </script>
    
    <script type="text/javascript">
    
    $(function() {
    	$.ajax({
            type: "POST",
            url: path + "/venue/getSeats.action",
            data: {"showid":showid},
            dataType: "json",
            success: function (backData) {
                setSeatInfo(backData);
            },
            error: function() {
            	alert("获取座位信息失败");
            }
        });
    })
    
    function setSeatInfo(seats) {
    	$("#seatTable").html("");
        var html = "";
        for(var i = 0;i<seats.length;i++){
        	var item = seats[i];
        	html += "<tr>";
        	html += "<td>" + item.id + "</td>";
        	html += "<td>" + item.name + "</td>";
        	html += "<td>" + item.amount + "</td>";
        	html += "<td>" + item.price + "</td>";
        	html += "<td><button type='button' class='label label-danger sellButton'>购买</button></td>";
        	html += "</tr>";
        }
        $("#seatTable").html(html);
    }
    
    $(document).on("click",".sellButton",function(){
    	var tr = $(this).closest("tr");
    	var seatid = tr.find("td:eq(0)").text();
    	var seatName = tr.find("td:eq(1)").text();
    	var seatAmount = tr.find("td:eq(2)").text();
    	$.ajax({
            type: "POST",
            url: path + "/venue/sellTicket.action",
            data: {"seatid":seatid},
            dataType: "json",
            success: function (backData) {
            	if (backData == 0) {
                    alert("余票不足");
                } else if (backData == 1) {
                	alert("售出 " + seatName + " 一张");
                	tr.find("td:eq(2)").text(seatAmount-1);
                } else {
                	alert("不可能的错误");
                }
            },
            error: function() {
            	alert("服务器错误");
            }
        });
    })
    
    </script>
    
</body>
</html>