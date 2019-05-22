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
    <title>订单状态</title>
    
<script type="text/javascript">
	var path = "<%=path%>";
	var id = "<%=id%>";
</script>

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
                        <h4 class="text-themecolor">我的订单</h4>
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
                                <h4 class="card-title">订单信息</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>演出</th>
                                                <th>座位</th>
                                                <th>数量</th>
                                                <th>券后总价</th>
                                                <th>状态</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="orderTable">
                                        
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
    	$.ajax({
            type: "POST",
            url: path + "/user/getUserAllOrders.action",
            data: {"id":id},
            dataType: "json",
            success: function (backData) {
                setOrderInfo(backData);
            },
            error: function() {
            	alert("获取订单信息失败");
            }
        });
    })
    
    function setOrderInfo(orders) {
    	$("#orderTable").html("");
        var html = "";
        for(var i = 0;i<orders.length;i++){
        	var item = orders[i];
        	html += "<tr>";
        	html += "<td>" + item.id + "</td>";
        	html += "<td>" + item.show.name + "</td>";
        	html += "<td>" + item.seat + "</td>";
        	html += "<td>" + item.amount + "</td>";
        	html += "<td>" + item.price + "</td>";
        	if(item.state == 1) {
        		html += "<td>已支付</td>";
        		html += "<td><button type='button' class='label label-danger refundButton'>退款</button></td>";
        	} else if(item.state == 2) {
        		html += "<td>已检票</td>";
        		html += "<td></td>";
        	} else if(item.state == 3) {
        		html += "<td>已退款</td>";
        		html += "<td></td>";
        	} else if(item.state == 4) {
        		html += "<td>待支付</td>";
        		html += "<td><button type='button' class='label label-danger payButton'>支付</button></td>";
        	} else if(item.state == 5) {
        		html += "<td>已失效</td>";
        		html += "<td></td>";
        	} else {
        		html += "<td>错误</td>";
        	}
        	html += "</tr>";
        }
        $("#orderTable").html(html);
    }
    
    $(document).on("click",".payButton",function(){
    	var tr = $(this).closest("tr");
    	var orderid = tr.find("td:eq(0)").text();
    	var orderprice = tr.find("td:eq(4)").text();
    	
    	
    	$.ajax({
            type: "POST",
            url: path + "/user/payTicket.action",
            data: {"userid":id,
            	"orderid":orderid,
            	"orderPrice":orderprice
            	},
            dataType: "json",
            success: function (backData) {
            	if (backData == -1) {
                    alert("账户余额不足");
                } else if (backData == 0) {
                	alert("订单已超时15分钟未支付失效");
                } else if (backData == 1) {
                	alert("支付成功");
                	window.location.href = path + "/user/showOrderState.jsp?id=" + id;
                } else {
                	alert("不可能的错误");
                }
            },
            error: function() {
            	alert("服务器错误");
            }
        });
    })
    
    $(document).on("click",".refundButton",function(){
    	var tr = $(this).closest("tr");
    	var orderid = tr.find("td:eq(0)").text();
    	var orderprice = tr.find("td:eq(4)").text();
    	
    	
    	$.ajax({
            type: "POST",
            url: path + "/user/refundTicket.action",
            data: {"userid":id,
            	"orderid":orderid,
            	"orderPrice":orderprice
            	},
            dataType: "json",
            success: function (backData) {
            	if (backData == -1) {
                    alert("不知道啥错误");
                } else if (backData == 0) {
                	alert("退款失败");
                } else if (backData == 1) {
                	alert("退款成功");
                	window.location.href = path + "/user/showOrderState.jsp?id=" + id;
                } else {
                	alert("不可能的错误");
                }
            },
            error: function() {
            	alert("服务器退款错误");
            }
        });
    })
    
    </script>
    
</body>
</html>