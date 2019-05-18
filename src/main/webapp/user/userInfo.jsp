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
    <title>个人信息</title>
    
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
        
        	<!-- /.row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="box-title m-b-0">修改个人信息</h3>
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
                                            <label for="exampleInputEmail1">Email</label>
                                            <input type="text" class="form-control" id="emailInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">姓名</label>
                                            <input type="text" class="form-control" id="nameInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">账户余额</label>
                                            <input type="text" class="form-control" id="moneyInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">积分</label>
                                            <input type="text" class="form-control" id="scoreInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">会员等级</label>
                                            <input type="text" class="form-control" id="levelInput">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">注销会员后该账号将不能使用！</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10" onclick="modifyUser();return false;">提交</button>
                                    	<button type="submit" class="btn btn-inverse waves-effect waves-light" onclick="dropUser();return false;" >注销会员</button>
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
	        //进入页面时加载会员信息
	        var accountInput = $("#accountInput");
	        var passwordInput = $("#passwordInput");
	        var confirmedPasswordInput = $("#confirmedPasswordInput");
	        var emailInput = $("#emailInput");
	        var nameInput = $("#nameInput");
	        var moneyInput = $("#moneyInput");
	        var scoreInput = $("#scoreInput");
	        var levelInput = $("#levelInput");
	        
	        $.ajax({
	            type: "POST",
	            url: path + "/user/getUserInfo.action",
	            data: {"id":id},
	            dataType: "json",
	            success: function (backData) {
	            	accountInput.val(backData.account);
	    	        accountInput.attr("readonly","readonly");
	    	        emailInput.val(backData.email);
	    	        nameInput.val(backData.name);
	    	        moneyInput.val(backData.money);
	    	        moneyInput.attr("readonly","readonly");
	    	        scoreInput.val(backData.score);
	    	        scoreInput.attr("readonly","readonly");
	    	        levelInput.val(backData.level);
	    	        levelInput.attr("readonly","readonly");
	            },
	            error: function() {
	            	alert("获取个人信息失败");
	            }
	        });
	    });
	    
	    function modifyUser(){
	    	
	    	var account = $("#accountInput").val();
	        var password = $("#passwordInput").val();
	        var confirmedPassword = $("#confirmedPasswordInput").val();
	        var email = $("#emailInput").val();
	        var name = $("#nameInput").val();
	        
	        if (password != confirmedPassword) {
	            alert("两次输入密码不一样");
	            return;
	        }
	        if (name == "") {
	            alert("名称不能为空");
	            return;
	        }
	        if (password == "") {
	            alert("密码不能为空");
	            return;
	        }
	        if (email == "") {
	            alert("邮箱不能为空");
	            return;
	        }
	        
	        $.ajax({
	            type: "POST",
	            url: path + "/user/modifyUser.action",
	            data: {"id":id,
	            	"account":account,
	            	"password":password,
	            	"name":name,
	            	"email":email
	            	},
	            dataType: "json",
	            success: function (backData) {
	                if (backData == 0) {
	                    alert("修改个人信息失败");
	                } else {
	                	alert("修改个人信息成功");
	                    window.location.href = path + "/user/login.jsp";
	                }
	            },
	            error: function() {
	            	alert("修改个人信息失败");
	            }
	        });
	    }
	    
	    function dropUser(){
	    	var allow = $("#checkbox1").is(":checked");
	    	if(allow == false) {
	    		alert("请接收协议");
	    		return;
	    	}
	    	
	    	$.ajax({
	            type: "POST",
	            url: path + "/user/dropUser.action",
	            data: {"id":id},
	            dataType: "json",
	            success: function (backData) {
	                if (backData == 0) {
	                    alert("注销会员失败");
	                } else {
	                	alert("注销会员成功");
	                    window.location.href = path + "/user/login.jsp";
	                }
	            },
	            error: function() {
	            	alert("注销会员失败");
	            }
	        });
	    	
	    }
    
    </script>
    
</body>
</html>