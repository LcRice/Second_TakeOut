<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐厅主页</title>
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
<%-- <img alt="" src="image/photo/${sessionScope.rest.restphoto }" width="30px" height="30px" />
<a href="rest_query.jsp">${sessionScope.rest.restname }</a>,hello!
<hr color="gray">
<a href="greens_add.jsp">上架菜品</a><br/>
<a href="GreensQueryServlet?currentPage=1">查询菜品</a><br/>

<a href="OrderQueryServlet?currentPage=1">查看订单</a><br/>
<a href="AutoSelectCourierServlet">自动派单</a>

<hr color="gray">

<a href="CommentQueryServletforRestByRest?currentPage=1">查看评论信息</a><br/>

<hr color="gray">
<a href="RestLogoutServlet">退出</a>
 --%>


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
					<a href="rest_query.jsp" class="active" target="right"><img alt="" src="image/photo/${sessionScope.rest.restphoto }" width="30px" height="30px" /> ${sessionScope.rest.restname }</a>
					<a href = "OrderQueryServlet?currentPage=1" target="right">查看订单</a>
					<a href="RestLogoutServlet" target="_top">退出</a>
				</div>
				<ul class="layui-nav header-down-nav">
					<li class="layui-nav-item">
						<a href="rest_query.jsp" class="active" target="right"><img alt="" src="image/photo/${sessionScope.rest.restphoto }" width="30px" height="30px" /> ${sessionScope.rest.restname }</a>,你好！
					</li>
					<li class="layui-nav-item">
						<a href = "OrderQueryServlet?currentPage=1" target="right">查看订单</a>
					</li>
					<li class="layui-nav-item">
						<a href="RestLogoutServlet" target="_top">退出</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="catalog">
			<ul>
				<li>
					<div class="title_1">
						<a href="greens_add.jsp" class="title" target="right">上架菜品</a>
					</div>
				</li>
				<li>
					<div class="title_2">
						<a href="GreensQueryServlet?currentPage=1" class="title" target="right">查询菜品</a>
					</div>
				</li>
				<li>
					<div class="title_3">
						<a href="AutoSelectCourierServlet" class="title" target="right">自动派单</a>
					</div>
				</li>
				<li>
					<div class="title_4">
						<a href="CommentQueryServletforRestByRest?currentPage=1" class="title" target="right">查看评价</a>
					</div>
				</li>
			</ul>
		</div>
</body>
</html>