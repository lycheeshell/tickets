<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
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
    <title>登录</title>
    
    <script type="text/javascript">
    	var path = "<%=path%>";	
	</script>
    
    <!-- page css -->
    <link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/pages/login-register-lock.css"/>
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/style.min.css"/>
    
</head>

<body class="skin-default card-no-border">
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
    <section id="wrapper">
        <div class="login-register" style="background-image:url(<%=path%>/dist/images/login-register.jpg);">
            <div class="login-box card">
                <div class="card-body">
                    <form class="form-horizontal form-material" id="loginform">
                        <h3 class="box-title m-b-20">登录</h3>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" name="account" id="account" required placeholder="账号"> </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" name="password" id="password" required placeholder="密码"> </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">记住密码</label>
                                    <a href="" id="to-recover" class="text-dark pull-right"><i class="fa fa-lock m-r-5"></i> 忘记密码?</a> 
                                </div> 
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <div class="col-xs-12 p-b-20">
                                <button class="btn btn-block btn-lg btn-info btn-rounded" type="submit" onclick="login();return false;">登录</button>
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                                        还没有账号？ <a href="<%=path%>/manager/register.jsp" class="text-info m-l-5"><b>注册</b></a>
                            </div>
                        </div>
                        <br/>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                                        普通用户请点击 <a href="<%=path%>/user/login.jsp" class="text-info m-l-5"><b>这里</b></a>&nbsp;&nbsp;&nbsp;登录
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                                        场馆用户请点击 <a href="<%=path%>/venue/login.jsp" class="text-info m-l-5"><b>这里</b></a>&nbsp;&nbsp;&nbsp;登录
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script type="text/javascript" src="<%=path%>/dist/js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script type="text/javascript" src="<%=path%>/dist/js/popper.min.js"></script>
    <script type="text/javascript" src="<%=path%>/dist/js/bootstrap.min.js"></script>
    <!--Custom JavaScript -->
    <script type="text/javascript">
        $(function() {
            $(".preloader").fadeOut();
        });
    </script>
    <script type="text/javascript">
    	function login() {
    		var account = $("#account").val();
	        var password = $("#password").val();
	        $.ajax({
	            type: "POST",
	            url: path + "/manager/login.action",
	            data: {"account":account,
	            	"password":password
	            	},
	            dataType: "json",
	            success: function (backData) {
	                if (backData == 0) {
	                    alert("账号或密码错误");
	                } else if (backData == 1) {
	                	window.location.href = path + "/manager/index.jsp";
	                } else {
	                	alert("不可能的错误");
	                }
	            },
	            error: function() {
	            	alert("账号或密码错误");
	            }
	        });
    	}
    </script>
</body>

</html>