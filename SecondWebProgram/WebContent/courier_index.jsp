<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>配送员主页</title>
<style type="text/css">
			<style>
			body {
				margin: 0px;
				padding: 0px;
				font-family: "Microsoft YaHei", SimSun, sans-serif;
			}
			
			ul {
				width: 1000px;
				height: 50px;
			}
			
			ul li {
				display: inline-block;
				list-style: none;
				float: left;
				width: 200px;
				height: 50px;
				margin-right: 50px;
			}
			
			ul li div a {
				display: inline-block;
				text-align: center;
				line-height: 50px;
				width: 200px;
				height: 50px;
				background-color: black;
				font-size: 15px;
				text-decoration: none;
				color: orangered;
			}
			
			ul li div .title:hover {
				color: black;
				background-color: orangered;
				cursor: pointer;
			}
			
			.catalog{
				height: 50px;
				margin-top: 50px;
				text-align: center;
				margin-left: 175px;
			}
			
		</style>
		<script type="text/javascript" src="res/layui/layui.js"></script>
		<link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="res/static/css/main.css">
	
</style>
</head>
<body>
<%-- <img alt="" src="image/photo/${sessionScope.courier.courierphoto }">
${sessionScope.courier.couriername },你好!
<hr color="gray" />
<a href="CourierFinishServlet">完成订单配送</a>
<hr color="gray" />
<a href="CourierLogoutServlet">退出</a> --%>

<div class="header_box">
			<div class="header">
				<ul class="app-header">
					<li class="app-header-menuicon">
						<i class="layui-icon layui-icon-more-vertical"></i>
					</li>
				</ul>
				<h1 class="logo">
        			<a href="#"><img src="image/logo.png"></a>
      			</h1>
				<div class="nav" style="visibility: visible">
					<a href="#" class="active"><img alt="" src="image/photo/${sessionScope.courier.courierphoto }" width="30px" height="30px" /> ${sessionScope.courier.couriername }</a>
					<a href = "CourierFinishServlet">完成订单</a>
					<a href="CourierLogoutServlet" target="_top">退出</a>
				</div>
				<ul class="layui-nav header-down-nav">
					<li class="layui-nav-item">
						<a href="#" class="active"><img alt="" src="image/photo/${sessionScope.courier.courierphoto }" width="30px" height="30px" /> ${sessionScope.courier.couriername }</a>,你好！
					</li>
					<li class="layui-nav-item">
						<a href = "CourierFinishServlet">完成订单</a>
					</li>
					<li class="layui-nav-item">
						<a href="CourierLogoutServlet" target="_top">退出</a>
					</li>
				</ul>
			</div>
		</div>
</body>
</html>