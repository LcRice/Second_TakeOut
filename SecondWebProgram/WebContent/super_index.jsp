<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员主页</title>
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
				margin-left: 300px;
			}
			
		</style>
		<script type="text/javascript" src="res/layui/layui.js"></script>
		<link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="res/static/css/main.css">
	
</style>
</head>
<body>
<%-- <h2>管理员主页</h2>
<hr color="gray" />
${sessionScope.superadmin.superadminnumber },您好！平台目前盈利${sessionScope.superadmin.superadminamount }元<br/>
<a href="RestQueryServletBySuper?currentPage=1">查看餐厅</a><br/>
<a href="UserQueryServletBySuper?currentPage=1">查看用户</a><br/>
<a href="CourierQueryServletBySuper?currentPage=1">查看配送员</a><br/> --%>

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
					<a href="#" class="active"> ${sessionScope.superadmin.superadminnumber }</a>
					<a href = "#">您好！平台目前盈利${sessionScope.superadmin.superadminamount }元</a>					
				</div>
				<ul class="layui-nav header-down-nav">
					<li class="layui-nav-item">
						<a href="#" class="active"> ${sessionScope.superadmin.superadminnumber }</a>,你好！
					</li>
					<li class="layui-nav-item">
						<a href = "#">您好！平台目前盈利${sessionScope.superadmin.superadminamount }元</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="catalog">
			<ul>
				<li>
					<div class="title_1">
						<a href="RestQueryServletBySuper?currentPage=1" class="title" target="right">查看餐厅</a>
					</div>
				</li>
				<li>
					<div class="title_3">
						<a href="UserQueryServletBySuper?currentPage=1" class="title" target="right">查看用户</a>
					</div>
				</li>
				<li>
					<div class="title_4">
						<a href="CourierQueryServletBySuper?currentPage=1" class="title" target="right">查看配送员</a>
					</div>
				</li>
			</ul>
		</div>
</body>
</html>