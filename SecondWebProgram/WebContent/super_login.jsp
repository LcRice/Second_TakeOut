<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	
	body {
		width: 1300px;
		height: 696px;
	}
	
	.top {
		width: 1300px;
		height: 60px;
		background-color: gray;
	}
	
	.logo {
		float: left;
		max-height: 60px;
	}
	
	span {
		float: right;
		text-align: center;
		line-height: 60px;
		display: inline-block;
		font-size: 30px;
		font-weight: bolder;
		margin-right: 20px;
	}
	
	.main {
		width: 1300px;
		height: 500px;
		margin-top: 40px;
		background-image: url(image/logo.png);
	}
	
	#login {
		float: right;
		margin-right: 80px;
		margin-top: 80px;
		width: 300px;
		height: 300px;
		text-align: center;
		background-color: white;
		border: solid 2px;
	}
	
	.login_title{
		height: 30px;
		margin-top: 40px;
		font-weight: bolder;
		font-size: 25px;
		line-height: 30px;
	}
	
	.login_context {
		position: relative;
		height: 150px;
		margin: 25px auto 60px;
	}
	
	.username {
		position: absolute;
		top: 8px;
		left: 43px;
		font-size: 20px;
	}
	
	.password {
		position: absolute;
		top: 42px;
		left: 43px;
		font-size: 20px;
	}
	
	.login_context_middle{
		height: 30px;
		width: 185px;
		position: absolute;
		top: 76px;
		left: 47.5px;
		color: #d3d3d3;
		font-size: 20px;
	}
	
	#autoLogin{
		margin-left: 20px;
		line-height: 30px;
	}
	.font{
		line-height: 30px;
		margin-top: -5px;
	}
	
	.subbtn{
		position: absolute;
		top: 120px;
		left: 80px;
		background-color: #01AAED;
		color:#D9DADC;
		width: 50px;
		height: 30px;
		border-style: none;
	}
	
	.regbtn{
		position: absolute;
		top: 120px;
		left: 180px;
		background-color: #01AAED;
		color:#D9DADC;
		width: 50px;
		height: 30px;
		border-style: none;
	}
</style>
<script type="text/javascript" src="res/layui/layui.js"></script>
<link rel="stylesheet" type="text/css" href="res/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="res/static/css/main.css">


</head>
<body>
<!-- <h2>管理员登录</h2>
<hr color="gray" />
<form action="SuperLoginServlet" method="post" onSubmit = "return myfunction()">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="supernumber"></td>
			</tr>
			<tr>
				<td>密 码：</td>
				<td><input type="password" name="superpassword"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input style="margin-right: 50px;" type="submit" value="登陸" >
				<input type="reset" value="重置"></td>
			</tr>
		</table>
	</form> -->
	
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
					<a href="html/Index_no1.html" class="active">首页</a>
					<a href="index.jsp">登录</a>
				</div>
				<ul class="layui-nav header-down-nav">
					<li class="layui-nav-item">
						<a href="html/Index_no1.html" class="active">首页</a>
					</li>
					<li class="layui-nav-item">
						<a href="index.jsp">登录</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="main">

			<form action="SuperLoginServlet" method="post" onSubmit="return myfunction()">
				<div id="login">
					<h2 class="login_title">账号登录</h2>
					<div class="login_context">
						<input type="text" name="supernumber" class="username" placeholder="请输入用户名">
						<input type="password" name="superpassword" class="password" placeholder="请输入密码">
						<div class="login_context_middle">
							<input type="checkbox" name="member" id="member">
							<font class="font" size="1px" color="gray">记住用户名密码</font>

							<input type="checkbox" name="autoLogin" id="autoLogin">
							<font class="font" size="1px" color="gray">七天免登录</font>
						</div>
						<input class="subbtn" type="submit" value="登陸">
						<input type="reset" class="regbtn" value="重置">
					</div>
				</div>
			</form>
		</div>
</body>
</html>