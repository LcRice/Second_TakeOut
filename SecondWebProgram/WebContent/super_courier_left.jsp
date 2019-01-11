<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rest {
	width: 150px;
	height: 700px;
	float: left;
}

.rest_a {
	list-style: none;
	width: 150px;
	height: 50px;
	text-align: center;
	background-color: black;
}

.rest_a a {
	display: inline-block;
	text-align: center;
	line-height: 50px;
	width: 150px;
	height: 50px;
	background-color: black;
	font-size: 15px;
	text-decoration: none;
	color: orangered;
}

.rest_a a:hover {
	color: black;
	background-color: orangered;
	cursor: pointer;
}

</style>
</head>
<body>
<div class="rest">
		<div class="rest_a">
			<a href="CourierOrderQueryBySuperServlet?currentPage=1" target="right1">查看该配送员订单</a>
		</div>
		<div class="rest_a">
			<a href="CourierCommentQueryBySuperServlet?currentPage=1" target="right1">查看该配送员评论</a>
		</div>
	</div>
</body>
</html>