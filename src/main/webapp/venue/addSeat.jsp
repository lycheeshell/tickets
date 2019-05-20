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
    <title>添加座位</title>
    
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
			<div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="box-title m-b-0">座位信息</h3>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">座位名称</label>
                                            <input type="text" class="form-control" id="nameInput" placeholder="请输入座位名称">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">座位数量</label>
                                            <input type="text" class="form-control" id="amountInput" placeholder="请输入座位数量">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">座位价格</label>
                                            <input type="text" class="form-control" id="priceInput" placeholder="请输入座位价格">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">单次添加一种座位</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10" onclick="addSeat();return false;">提交</button>
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
    
	    function fix(num, length) {
	    	return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
	    }
	    
	    $(document).on("click","#modifyVenue",function(){
	    	window.location.href = path + "/venue/venueInfo.jsp?id=" + id + "&name=" + name;
	    })
    
    </script>
    
    <script type="text/javascript">
    
	    function addSeat(){
	    	
	    	var allow = $("#checkbox1").is(":checked");
	    	if(allow == false) {
	    		alert("请接收协议");
	    		return;
	    	}
	    	
	        var seatname = $("#nameInput").val();
	        var amount = $("#amountInput").val();
	        var price = $("#priceInput").val();
	        
	        if (seatname == "") {
	            alert("座位名称不能为空");
	            return;
	        }
	        if (amount == "") {
	            alert("座位数量不能为空");
	            return;
	        }
	        if (price == "") {
	            alert("座位价格不能为空");
	            return;
	        }
	        
	        
	        $.ajax({
	            type: "POST",
	            url: path + "/venue/addSeat.action",
	            data: {"venueid":id,
	            	"showid":showid,
	            	"name":seatname,
	            	"amount":amount,
	            	"price":price
	            	},
	            dataType: "json",
	            success: function (backData) {
	            	if(backData == -1) {
	            		alert("已有该种座位，新增座位失败");
	            	} else if(backData == -2) {
	            		alert("座位总数超出场馆总座位数，新增座位失败");
	            	} else if(backData == 0) {
	                    alert("新增座位失败");
	                } else {
	                	alert("新增座位成功，请继续添加演出座位");
	                	window.location.href = path + "/venue/addSeat.jsp?id=" + id + "&name=" + name + "&showid=" + showid;
	                }
	            },
	            error: function() {
	            	alert("新增座位失败");
	            }
	        });
	    }
    
    </script>
    
</body>
</html>