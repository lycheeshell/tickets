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
    <title>发布演出</title>
    
<script type="text/javascript">
	var path = "<%=path%>";
	var id = "<%=id%>";
	var name = "<%=name%>";
</script>

<style type="text/css">

</style>
<!-- Custom CSS -->
<link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/style.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/dist/css/pages/dropify.min.css">
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
				<div class="col-lg-6 col-md-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">上传演出图片jpg</h4>
							<input type="file" id="file" class="dropify" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
                    <div class="col-md-6">
                        <div class="card card-body">
                            <h3 class="box-title m-b-0">演出信息</h3>
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <form>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">名称</label>
                                            <input type="text" class="form-control" id="nameInput" placeholder="请输入演出名称">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">演出类型</label><br/>
                                            <select id="showTypeInput" class="selectpicker" data-style="form-control btn-secondary">
	                                            <option>演唱会</option>
	                                            <option>舞蹈</option>
	                                            <option>话剧</option>
	                                            <option>体育比赛</option>
                                        	</select>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">演出时间</label>
                                            <input class="form-control" type="datetime-local" value="2019-09-16T20:00:00" id="showTimeInput">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">演出描述</label>
                                            <input type="text" class="form-control" id="descriptionInput" placeholder="请输入演出描述">
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox checkbox-success">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">确认发布演出</label>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10" onclick="addShow();return false;">提交</button>
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
    <!-- jQuery file upload -->
    <script src="<%=path%>/dist/js/dropify.min.js"></script>
    <script src="<%=path%>/dist/js/bootstrap-select.min.js" type="text/javascript"></script>
    <script>
    $(document).ready(function() {
        // Basic
        $('.dropify').dropify();

        
    });
    </script>
    
    <script type="text/javascript">
        $(function() {
            $(".preloader").fadeOut();
        });
        jQuery(document).ready(function() {
        	// For select 2
            $(".select2").select2();
            $('.selectpicker').selectpicker();
        })
    </script>
    
    <script type="text/javascript">
    
	    $(function() {
	        $("#venueName").text(name);
	        var now = new Date();
	        var str = now.getFullYear() + "-" + fix((now.getMonth() + 1),2) + "-" + fix(now.getDate(),2) + "T" + fix(now.getHours(),2) + ":" + fix(now.getMinutes(),2);
	        $("#showTimeInput").val(str);
	    });
	    
	    function fix(num, length) {
	    	return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;
	    }
	    
	    $(document).on("click","#modifyVenue",function(){
	    	window.location.href = path + "/venue/venueInfo.jsp?id=" + id + "&name=" + name;
	    })
    
    </script>
    
    <script type="text/javascript">
    
    	function testFile() {
    		var animateimg = $("#file").val(); //获取上传的图片名 带//
    	    if (animateimg != "") {                               //是否有上传图片
    	        var imgarr = animateimg.split('\\'); //分割
    	        var myimg = imgarr[imgarr.length - 1]; //去掉 // 获取图片名
    	        var houzui = myimg.lastIndexOf('.'); //获取 . 出现的位置
    	        var ext = myimg.substring(houzui, myimg.length).toUpperCase();  //切割 . 获取文件后缀
    	        var file = $('#file').get(0).files[0]; //获取上传的文件
    	        var fileSize = file.size;           //获取上传的文件大小
    	        var maxSize = 5242880;              //最大1MB
    	        if (ext != '.JPG') {
    	            alert('文件类型错误,请上传JPG类型');
    	            return false;
    	        } else if (parseInt(fileSize) >= parseInt(maxSize)) {
    	            alert('上传的文件不能超过5MB');
    	            return false;
    	        }
    	    }
    	}
    
	    function addShow(){
	    	
	    	testFile();
	    	
	    	var allow = $("#checkbox1").is(":checked");
	    	if(allow == false) {
	    		alert("请接收协议");
	    		return;
	    	}
	    	
	        var showName = $("#nameInput").val();
	        var showType = $("#showTypeInput").find("option:selected").text();
	        var showTime = $("#showTimeInput").val();
	        var showDescription = $("#descriptionInput").val();
	        
	        if (showName == "") {
	            alert("演出名称不能为空");
	            return;
	        }
	        if (showType == "") {
	            alert("演出类型不能为空");
	            return;
	        }
	        if (showTime == "") {
	            alert("演出时间不能为空");
	            return;
	        }
	        if (showDescription == "") {
	            alert("演出描述不能为空");
	            return;
	        }
	        
	        //当你给后台传图片时，你传的是一个文件 而不再是普通的string类型的值。而是file类型   也就是文件类型
	        //data: formData,
	        //processData : false,
	        //contentType : false,
	        var formData = new FormData();
	        formData.append("showName",showName);
	        formData.append("venueid",id);
	        formData.append("showType",showType);
	        formData.append("showTime",showTime);
	        formData.append("showDescription",showDescription);
	        formData.append("file",$('#file').get(0).files[0]);
	        
	        $.ajax({
	            type: "POST",
	            url: path + "/venue/addShow.action",
	            data: formData,
	            dataType: "json",
	            processData : false,
	            contentType : false,
	            success: function (backData) {
	                if (backData == 0) {
	                    alert("发布演出失败");
	                } else {
	                	alert("发布演出成功，请添加演出座位");
	                	window.location.href = path + "/venue/addSeat.jsp?id=" + id + "&name=" + name + "&showid=" + backData;
	                }
	            },
	            error: function() {
	            	alert("发布演出失败");
	            }
	        });
	    }
    
    </script>
    
</body>
</html>