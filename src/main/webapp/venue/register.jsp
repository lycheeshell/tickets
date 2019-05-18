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
    
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
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
        <div class="login-register-venue" style="background-image:url(<%=path%>/dist/images/login-register.jpg);">
            <div class="login-box card">
                <div class="card-body">
                    <form class="form-horizontal form-material" id="loginform" >
                        <h3 class="box-title m-b-20">注册</h3>
                        <h3 id="account"></h3>
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
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="name" name="name" required placeholder="名称">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="location" name="location" required placeholder="位置">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="phone" name="phone" required placeholder="电话">
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <input class="form-control" type="text" id="seat" name="seat" required placeholder="座位数">
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
                                                               已经有账号了? <a href="<%=path%>/venue/login.jsp" class="text-info m-l-5"><b>登录</b></a>
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
	    $(function () {
	    	$.ajax({
	            type: "POST",
	            url: path + "/venue/getAccount.action",
	            dataType: "text",
	            success: function (backData) {
	                $("#account").text(backData);
	            },
	            error: function() {
	            	alert("生成账号失败");
	            }
	        });
	    })
    
	    function reg(){
	    	var allow = $("#customCheck1").is(":checked");
	    	if(allow == false) {
	    		alert("请接收协议");
	    		return;
	    	}
	    	
	    	var account = $("#account").text();
	        var password = $("#password").val();
	        var confirmedPassword = $("#confirmedPassword").val();
	        var name = $("#name").val();
	        var location = $("#location").val();
	        var phone = $("#phone").val();
	        var seat = $("#seat").val();
	        
	        if (password != confirmedPassword) {
	            alert("两次输入密码不一样");
	            return;
	        }
	        $.ajax({
	            type: "POST",
	            url: path + "/venue/register.action",
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
	                    alert("注册失败");
	                } else if (backData == -1) {
	                    alert("账号已存在");
	                } else {
	                    alert("请等待经理审核后登录");
	                    window.location.href = path + "/venue/login.jsp";
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