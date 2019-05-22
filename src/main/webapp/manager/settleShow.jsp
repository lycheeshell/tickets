<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
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
    <title>结算</title>
    
    <script type="text/javascript">
    	var path = "<%=path%>";	
    	var showid = "<%=showid%>";
	</script>
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/style.min.css"/>
    
</head>
<body>
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
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="<%=path%>/manager/index.jsp">
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
                </div>
            </nav>
        </header>
        <div class="page-wrapper">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h4 class="text-themecolor">结算场馆费用</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <button type="button" class="btn btn-info d-none d-lg-block m-l-15" id="settle">结算场馆费用</button>
                            <button type="button" class="btn btn-info d-none d-lg-block m-l-15" id="showStatistics">查看统计信息</button>
                        </div>
                    </div>
                </div>
                <!-- Row -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="box-title m-b-0">结算</h3>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">演出名称</label>
                                            <input type="text" class="form-control" id="nameInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">总费用的80%</label>
                                            <input type="text" class="form-control" id="moneyInput">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">确认结算,商家可得80% ！</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10" onclick="settleShow();return false;">提交</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        <footer class="footer">
            © 2019 tickets by lycheeshell
        </footer>
    </div>
    
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
        
        $(document).on("click","#settle",function(){
        	window.location.href = path + "/manager/settle.jsp";
        })
        
    	$(document).on("click","#showStatistics",function(){
    		window.location.href = path + "/manager/showStatistics.jsp";
    	})
    </script>
    <script type="text/javascript">
    
    $(function() {
        //进入页面时加载信息
        var nameInput = $("#nameInput");
        var moneyInput = $("#moneyInput");
        
        $.ajax({
            type: "POST",
            url: path + "/manager/getMoneyInfo.action",
            data: {"showid":showid},
            dataType: "json",
            success: function (backData) {
            	nameInput.val(backData.name);
            	nameInput.attr("readonly","readonly");
    	        moneyInput.val(backData.money*0.8);
    	        moneyInput.attr("readonly","readonly");
            },
            error: function() {
            	alert("获取演出信息失败");
            }
        });
    });
    
    function settleShow(){
    	var allow = $("#checkbox1").is(":checked");
    	if(allow == false) {
    		alert("请接收协议");
    		return;
    	}
    	
        var money = $("#moneyInput").val();
    	
    	$.ajax({
            type: "POST",
            url: path + "/manager/settleShow.action",
            data: {"showid":showid,
            	"money":money
            },
            dataType: "json",
            success: function (backData) {
                if (backData == 0) {
                    alert("结算失败");
                } else {
                	alert("结算成功");
                    window.location.href = path + "/manager/index.jsp";
                }
            },
            error: function() {
            	alert("服务器结算失败");
            }
        });
    	
    }
    
    </script>
</body>
</html>