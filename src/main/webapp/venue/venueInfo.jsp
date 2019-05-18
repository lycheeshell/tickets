<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
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
    <title>修改场馆信息</title>
    
<script type="text/javascript">
	var path = "<%=path%>";
	var id = "<%=id%>";
	var name = "<%=name%>";
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
        
        	<!-- /.row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="box-title m-b-0">修改场馆信息</h3>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">账号</label>
                                            <input type="text" class="form-control" id="accountInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">密码</label>
                                            <input type="password" class="form-control" id="passwordInput" placeholder="请输入密码" >
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">确认密码</label>
                                            <input type="password" class="form-control" id="confirmedPasswordInput" placeholder="请确认密码" >
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">名称</label>
                                            <input type="text" class="form-control" id="nameInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">位置</label>
                                            <input type="text" class="form-control" id="locationInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">电话</label>
                                            <input type="text" class="form-control" id="phoneInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">座位数</label>
                                            <input type="text" class="form-control" id="seatInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">账户余额</label>
                                            <input type="text" class="form-control" id="moneyInput">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">修改提交经理审核期间将不能登录使用！</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10" onclick="modifyVenue();return false;">提交</button>
                                    </form>
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
	    
	    $(function() {
	        //进入页面时加载场馆信息
	        var accountInput = $("#accountInput");
	        var passwordInput = $("#passwordInput");
	        var confirmedPasswordInput = $("#confirmedPasswordInput");
	        var nameInput = $("#nameInput");
	        var locationInput = $("#locationInput");
	        var phoneInput = $("#phoneInput");
	        var seatInput = $("#seatInput");
	        var moneyInput = $("#moneyInput");
	        
	        $.ajax({
	            type: "POST",
	            url: path + "/venue/getVenueInfo.action",
	            data: {"id":id},
	            dataType: "json",
	            success: function (backData) {
	            	accountInput.val(backData.account);
	    	        accountInput.attr("readonly","readonly");
	    	        nameInput.val(backData.name);
	    	        locationInput.val(backData.location);
	    	        phoneInput.val(backData.phone);
	    	        seatInput.val(backData.seat);
	    	        moneyInput.val(backData.money);
	    	        moneyInput.attr("readonly","readonly");
	            },
	            error: function() {
	            	alert("获取场馆信息失败");
	            }
	        });
	    });
	    
	    function modifyVenue(){
	    	var allow = $("#checkbox1").is(":checked");
	    	if(allow == false) {
	    		alert("请接收协议");
	    		return;
	    	}
	    	
	    	var account = $("#accountInput").val();
	        var password = $("#passwordInput").val();
	        var confirmedPassword = $("#confirmedPasswordInput").val();
	        var name = $("#nameInput").val();
	        var location = $("#locationInput").val();
	        var phone = $("#phoneInput").val();
	        var seat = $("#seatInput").val();
	        
	        if (password != confirmedPassword) {
	            alert("两次输入密码不一样");
	            return;
	        }
	        if (password == "") {
	            alert("密码不能为空");
	            return;
	        }
	        if (name == "") {
	            alert("名称不能为空");
	            return;
	        }
	        if (location == "") {
	            alert("位置不能为空");
	            return;
	        }
	        if (phone == "") {
	            alert("电话不能为空");
	            return;
	        }
	        if (seat == "") {
	            alert("座位数不能为空");
	            return;
	        }
	        
	        $.ajax({
	            type: "POST",
	            url: path + "/venue/modifyVenue.action",
	            data: {"account":account,
	            	"password":password,
	            	"name":name,
	            	"location":location,
	            	"phone":phone,
	            	"seat":seat
	            	},
	            dataType: "json",
	            success: function (backData) {
	                if (backData == 0) {
	                    alert("修改场馆信息失败");
	                } else {
	                	alert("请等待经理审核后登录");
	                    window.location.href = path + "/venue/login.jsp";
	                }
	            },
	            error: function() {
	            	alert("修改场馆信息失败");
	            }
	        });
	    }
    
    </script>
    
</body>
</html>