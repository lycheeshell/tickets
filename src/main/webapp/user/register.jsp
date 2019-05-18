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
    <title>注册</title>
    
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
                    <form class="form-horizontal form-material" id="loginform" >
                        <h3 class="box-title m-b-20">注册</h3>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="account" name="account" required placeholder="账号">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="email" name="email" required placeholder="Email">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" id="password" name="password" required placeholder="密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <input class="form-control" type="password" id="confirmedPassword" name="confirmedPassword" required placeholder="确认密码">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">我同意 <a >协议</a></label> 
                                </div> 
                            </div>
                        </div>
                        <div class="form-group text-center p-b-20">
                            <div class="col-xs-12">
                                <button class="btn btn-info btn-lg btn-block btn-rounded text-uppercase waves-effect waves-light" type="submit" onclick="reg();return false;">注册</button>
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                                               已经有账号了? <a href="<%=path%>/user/login.jsp" class="text-info m-l-5"><b>登录</b></a>
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
    <script type="text/javascript">
        $(function() {
            $(".preloader").fadeOut();
        });
    </script>
    <script type="text/javascript">
	    function reg(){
	    	var allow = $("#customCheck1").is(":checked");
	    	if(allow == false) {
	    		alert("请接收协议");
	    		return;
	    	}
	    	
	    	var account = $("#account").val();
	        var email = $("#email").val();
	        var password = $("#password").val();
	        var confirmedPassword = $("#confirmedPassword").val();
	        
	        if (password != confirmedPassword) {
	            alert("两次输入密码不一样");
	            return;
	        }
	        $.ajax({
	            type: "POST",
	            url: path + "/user/register.action",
	            data: {"account":account,
	            	"email":email,
	            	"password":password
	            	},
	            dataType: "json",
	            success: function (backData) {
	                if (backData == 0) {
	                    alert("注册失败");
	                } else if (backData == -1) {
	                    alert("账号已存在");
	                } else {
	                    alert("请前往邮箱验证");
	                    window.location.href = path + "/user/login.jsp";
	                }
	            },
	            error: function() {
	            	alert("注册失败");
	            }
	        });
	    }
    </script>
</body>

</html>