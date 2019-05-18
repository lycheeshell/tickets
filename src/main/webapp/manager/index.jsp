<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>tickets管理</title>

<script type="text/javascript">
	var path = "<%=path%>";
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
                        <h4 class="text-themecolor">Tickets管理</h4>
                    </div>
                    <div class="col-md-7 align-self-center text-right">
                        <div class="d-flex justify-content-end align-items-center">
                            <button type="button" class="btn btn-info d-none d-lg-block m-l-15" id="settle">结算场馆费用</button>
                            <button type="button" class="btn btn-info d-none d-lg-block m-l-15" id="showStatistics">查看统计信息</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">审核场馆信息</h4>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>场馆</th>
                                                <th>地址</th>
                                                <th>电话</th>
                                                <th>座位数</th>
                                                <th>申请类型</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody id="venueTable">
                                            <!-- <tr>
                                                <td>1</td>
                                                <td>Deshmukh</td>
                                                <td>Prohaska</td>
                                                <td>@Genelia</td>
                                                <td>40000</td>
                                                <td>注册信息</td>
                                                <td><button type="button" class="label label-danger agreeVenue">同意</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="label label-success deleteVenue">删除</button></td>
                                            </tr> -->
                                        </tbody>
                                    </table>
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
    	$.ajax({
            type: "POST",
            url: path + "/manager/getVenues.action",
            dataType: "json",
            success: function (backData) {
                setVenueInfo(backData);
            },
            error: function() {
            	alert("获取场馆申请信息失败");
            }
        });
    })
    
    function setVenueInfo(venues) {
    	$("#venueTable").html("");
        var html = "";
        for(var i = 0;i<venues.length;i++){
        	var item = venues[i];
        	html += "<tr>";
        	html += "<td>" + item.id + "</td>";
        	html += "<td>" + item.name + "</td>";
        	html += "<td>" + item.location + "</td>";
        	html += "<td>" + item.phone + "</td>";
        	html += "<td>" + item.seat + "</td>";
        	if(item.state == 0) {
        		html += "<td>注册申请</td>";
        	} else if(item.state == 2) {
        		html += "<td>修改申请</td>";
        	} else {
        		html += "<td>error</td>";
        	}
        	html += "<td><button type='button' class='label label-danger agreeVenue'>同意</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type='button' class='label label-success deleteVenue'>删除</button></td>";
        	html += "</tr>";
        }
        $("#venueTable").html(html);
    }
    

    $(document).on("click",".agreeVenue",function(){
    	var tr = $(this).closest("tr");
    	var venueid = tr.find("td:eq(0)").text();
    	$.ajax({
            type: "POST",
            url: path + "/manager/agreeVenue.action",
            data: {"id":venueid},
            dataType: "json",
            success: function (backData) {
                if (backData == 0) {
                    alert("id错误，不存在");
                } else if (backData == 1) {
                	alert("已同意id为" + venueid + "的场馆申请");
                	tr.remove();
                } else {
                	alert("不可能的错误");
                }
            },
            error: function() {
            	alert("服务器错误");
            }
        });
    })
    
    $(document).on("click",".deleteVenue",function(){
    	var tr = $(this).closest("tr");
    	var venueid = tr.find("td:eq(0)").text();
    	$.ajax({
            type: "POST",
            url: path + "/manager/deleteVenue.action",
            data: {"id":venueid},
            dataType: "json",
            success: function (backData) {
                if (backData == 0) {
                    alert("id错误，不存在");
                } else if (backData == 1) {
                	alert("已删除id为" + venueid + "的场馆申请");
                	tr.remove();
                } else {
                	alert("不可能的错误");
                }
            },
            error: function() {
            	alert("服务器错误");
            }
        });
    })
    
    $(document).on("click","#settle",function(){
    	window.location.href = path + "/manager/settle.jsp";
    })
    
	$(document).on("click","#showStatistics",function(){
		window.location.href = path + "/manager/showStatistics.jsp";
	})
    
    </script>
    
</body>
</html>