<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
	String id = request.getParameter("id");
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
    <title>预定演出票</title>
    
<script type="text/javascript">
	var path = "<%=path%>";
	var id = "<%=id%>";
	var showid = "<%=showid%>";
</script>

<style type="text/css">

</style>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/style.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/bootstrap-select.min.css">

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
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="box-title m-b-0">购票信息</h3>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">购票张数</label><br/>
                                            <select id="ticketNumberInput" class="selectpicker" data-style="form-control btn-secondary">
	                                            <option>1</option>
	                                            <option>2</option>
	                                            <option>3</option>
	                                            <option>4</option>
	                                            <option>5</option>
	                                            <option>6</option>
                                        	</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">我的优惠券</label><br/>
                                            <select id="couponInput">
	                                            
                                        	</select>
                                        </div>
                                    </form>
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
    <script src="<%=path%>/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(function() {
            $(".preloader").fadeOut();
        });
    </script>
    
    <script type="text/javascript">
    
    $(function() {
    	$.ajax({
            type: "POST",
            url: path + "/user/getSeats.action",
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
        	html += "<td><button type='button' class='label label-danger buyButton'>下单</button></td>";
        	html += "</tr>";
        }
        $("#seatTable").html(html);
    }
    
    $(function() {
    	$.ajax({
            type: "POST",
            url: path + "/user/getCoupons.action",
            data: {"id":id},
            dataType: "json",
            success: function (backData) {
                setCouponInfo(backData);
            },
            error: function() {
            	alert("获取优惠券信息失败");
            }
        });
    })
    
    function setCouponInfo(coupons) {
    	$("#couponInput").html("");
        var html = "";
        for(var i = 0;i<coupons.length;i++){
        	var item = coupons[i];
        	html += "<option id='" + item.id + "'>" + item.amount + "</option>";
        }
        $("#couponInput").html(html);
    }
    
    $(document).on("click",".buyButton",function(){
    	var tr = $(this).closest("tr");
    	var seatName = tr.find("td:eq(1)").text();
    	var seatAmount = tr.find("td:eq(3)").text();
    	var couponid = "";
    	var couponAmount = 0;
    	var amount = $("#ticketNumberInput").find("option:selected").text();
    	
    	if("" != $("#couponInput").find("option:selected").attr("id")) {
    		couponid = $("#couponInput").find("option:selected").attr("id");
    		couponAmount = $("#couponInput").find("option:selected").text();
    	}
    	
    	var price = seatAmount * amount - couponAmount;
    	
    	$.ajax({
            type: "POST",
            url: path + "/user/buyTicket.action",
            data: {"userid":id,
            	"showid":showid,
            	"couponid":couponid,
            	"seat":seatName,
            	"amount":amount,
            	"price":price
            	},
            dataType: "json",
            success: function (backData) {
            	if (backData == 0) {
                    alert("余票不足");
                } else if (backData == 1) {
                	alert("预订 " + seatName + " " + amount + " 张");
                	window.location.href = path + "/user/payTicket.jsp?id=" + id + "&showid=" + showid;
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