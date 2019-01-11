<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/myfunctions" prefix="myfn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看菜</title>
<style>
.search {
	width: 1300px;
	text-align: center;
}

.search_input {
	width: 521px;
	height: 20px;
	padding: 9px 7px;
	font: 16px arial;
	border: 1px solid #b8b8b8;
	border-bottom: 1px solid #ccc;
	border-right: 0;
	vertical-align: top;
	outline: none;
	box-shadow: none;
}

.search_button {
	cursor: pointer;
	width: 102px;
	height: 40px;
	line-height: 38px;
	padding: 0;
	border: 0;
	background: none;
	background-color: black;
	font-size: 16px;
	color: orangered;
	box-shadow: none;
	font-weight: normal;
}

.rows {
	width: 1300px;
	height: 100px;
	margin-left: 20px;
	margin-top: 10px;
	background-color: #23262E;
	transition: 1s;
}

.rows:hover {
	box-shadow: 10px 10px 10px orangered;
}

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

ul {
	list-style-type: none;
	margin: 0;
	pidding: 0;
}

#cityList1 {
	display: none;
}

#cityList1 li a {
	margin-left: -40px;
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

#cityList1 li a:hover {
	color: black;
	background-color: orangered;
	cursor: pointer;
}

.background {
	float: left;
	width: 1100px;
	height: 700px;
}

.singlon {
	width: 300px;
	height: 300px;
	float: left;
	margin-left: 50px;
	margin-top: 30px;
	background-color: orangered;
	transition: 1s;
}

.singlon:hover {
	cursor: pointer;
	box-shadow: 10px 10px 10px black;
}

.img {
	width: 300px;
	height: 200px;
}

.greensname {
	margin-top: 15px;
	width: 300px;
	text-align: center;
}

.catalogalldown {
	margin-top: 710px;
	margin-bottom: 50px;
}

.catalogdown {
	margin-top: 15px;
	text-align: center;
}

.comment{
	position: relative;
	margin: 0 auto;
	width: 1200px;
	height: 100px;
}

.comment_userid{
	position: absolute;
	top: 10px;
	left: 10px;
}

.comment_pubtime{
	position: absolute;
	top: 10px;
	right: 10px;
	color: gray;
	font-size: 15px;
}

.comment_title{
	position: absolute;
	top: 32px;
	left: 20px;
	font-size: 20px;
}

.comment_score{
	position: absolute;
	top: 10px;
	left: 200px;
}

.comment_context{
	position: absolute;
	bottom: 20px;
	left: 25px;
}

.restcomment{
	margin-top: 10px;
	margin-bottom: 50px;
}

.restcomment_first{
	margin-top: 15px;
	text-align: center;
}
</style>
<script type="text/javascript" src="js/greens_query_user.js"></script>
</head>
<body>
	<c:if test="${sessionScope.user==null }">
		<%
			String URL = request.getRequestURI();
				String prevURL = URL.substring(URL.lastIndexOf("/") + 1);
				session.setAttribute("prevURL", prevURL);
		%>
		<script type="text/javascript">
			alert("尚未登录，请先登录！");
			location = "user_login.jsp";
		</script>
	</c:if>
	<c:if test="${sessionScope.user!=null }">
		<c:if test="${requestScope.usergreensPage==null }">
			<%
				response.sendRedirect("GreensQueryByUserServlet");
			%>
		</c:if>

		<c:if test="${requestScope.usergreensPage!=null }">


			<!-- 输入框 -->
			<div class="search">
				<form action="GreensQueryByUserServlet?currentPage=1" method="post">
					<input type="text" class="search_input" name="findgreens"
						value="${requestScope.greensname }" placeholder="请输入搜索内容" /> <input
						type="submit" class="search_button" value="查询" />
				</form>
			</div>
			<br />


			<div class="rest">
				<div class="rest_a">
					<a onclick="displayOrHide1();">商户名称</a>
				</div>
				<ul id="cityList1">
					<c:forEach items="${restPageByUser.dataList}" var="rests">
						<li><a
							href="GreensQueryByRestServlet?currentPage=1&currentPage1=1&restid=${rests.restid }">${rests.restname }</a></li>
					</c:forEach>
				</ul>

				<%-- <table border="1" cellpadding="1" cellspacing="0">
			
					<tr>
						<th>商户名称</th>
						<th>商户地址</th>
						<th>商户评论数</th>
					</tr>

					<c:set var="row" value="0" />

					<c:forEach items="${restPage.dataList}" var="rests">

						<tr bgcolor='${row==0 ? "#d0d0d0" : "#ffffff"  }'>

							<td align="center"><a
								href="GreensQueryByRestServlet?currentPage=1&currentPage1=1&restid=${rests.restid }">${rests.restname }</a>
							</td>

							<td>${rests.restaddress }</td>

							<td>${rests.restcommentcount }</td>

						</tr>

						<c:set var="row" value="${1-row }" />

					</c:forEach>

					<tr>
						<td colspan="3" align="center"><c:if
								test="${restPage.currentPage==1 }">
				首页&nbsp;&nbsp;&nbsp;上一页
			</c:if> <c:if test="${restPage.currentPage!=1 }">
								<a href="RestQueryByUserServlet?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
				<a
									href="RestQueryByUserServlet?currentPage=${restPage.currentPage-1}">上一页</a>&nbsp;&nbsp;&nbsp;
			</c:if> <c:if test="${restPage.currentPage==restPage.totalPage }">
				下一页&nbsp;&nbsp;&nbsp;尾页
			</c:if> <c:if test="${restPage.currentPage!=restPage.totalPage }">
								<a href="RestQueryByUserServlet?currentPage=${restPage.currentPage+1}">下一页</a>&nbsp;&nbsp;&nbsp;
				<a href="RestQueryByUserServlet?currentPage=${restPage.totalPage }">尾页</a>&nbsp;&nbsp;&nbsp;
			</c:if></td>
					</tr>
				</table> --%>
			</div>


			<!-- 数据 -->
			<div class="background">
				<c:forEach var="greens" items="${usergreensPage.dataList }">
					<div class="singlon">
						<a href="GreensQueryByUserselfServlet?currentPage=1&greensid=${greens.greensid }">
							<img src="image/photo/${greens.greensphoto }" width="80px"
							class="img" /> <br />
							<div class="greensname">
								<a href="GreensQueryByCommentServlet?currentPage=1&greensid=${greens.greensid }">
									${myfn:convertKeyword(greens.greensname,greensname)}</a> <br />
								所属餐厅： ${greens.rest.restname } <br /> 价格： ${greens.greensprice };
								库存 ${greens.greensnumber }
							</div>
						</a>
					</div>
				</c:forEach>
			</div>

			<div class="catalogalldown">
				<div class="catalogdown">
					<c:if test="${ usergreensPage.currentPage==1 }">
								首页&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;
			</c:if>
					<c:if test="${usergreensPage.currentPage!=1 }">
						<a href="GreensQueryByUserServlet?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
								<a
							href="GreensQueryByUserServlet?currentPage=${usergreensPage.currentPage-1 }">上一页</a>&nbsp;&nbsp;&nbsp;
							</c:if>
					<!-- 数字分页  -->
					<c:forEach var="i" begin="${usergreensPage.begin }"
						end="${usergreensPage.end}" step="1">
						<c:if test="${i==usergreensPage.currentPage}">
									${i }
								</c:if>
						<c:if test="${i!=usergreensPage.currentPage}">
							<a href="GreensQueryByUserServlet?currentPage=${i }"}> ${i }
							</a>
						</c:if>
					</c:forEach>
					<c:if
						test="${usergreensPage.currentPage==usergreensPage.totalPage }">
								下一页&nbsp;&nbsp;&nbsp;尾页
							</c:if>
					<c:if
						test="${usergreensPage.currentPage!=usergreensPage.totalPage }">
						<a
							href="GreensQueryByUserServlet?currentPage=${usergreensPage.currentPage+1 }">下一页</a>&nbsp;&nbsp;&nbsp;
								<a
							href="GreensQueryByUserServlet?currentPage=${usergreensPage.totalPage}">尾页</a>
					</c:if>
					&nbsp;&nbsp;&nbsp;到 <select name="currentPage"
						onchange="location='GreensQueryByUserServlet?currentPage='+this.value">
						<c:forEach var="i" begin="1" end="${usergreensPage.totalPage}"
							step="1">
							<option value="${i }"
								${i==usergreensPage.currentPage ? "selected" : "" }>${i }</option>
						</c:forEach>
					</select> 页
				</div>
				<div class="catalogdown">共${usergreensPage.totalCount }
					条记录&nbsp;&nbsp;&nbsp; 每页${usergreensPage.pageSize }
					条记录&nbsp;&nbsp;&nbsp; 第【${usergreensPage.currentPage }】页/共${usergreensPage.totalPage }页
				</div>
			</div>
		</c:if>
	</c:if>


	<%-- 	<h2>查看菜</h2>
	<hr color="gray" />
	
	<form action = "GreensQueryByUserServlet?currentPage=1" method = "post">
		<input type="text" name="findgreens" value="${requestScope.greensname }" />
		<input type="submit" value="查询" />
	</form>
	<br/>
	<form action="UserShoppingBatchServlet" method = "post" onsubmit = "return checkCount()">
	<table border="1" cellpadding="1" cellspacing="0">
		
			<th>选择</th>
			<th>菜照片</th>
			<th>菜名</th>
			<th>餐厅</th>
			<th>价格</th>
			<th>库存</th>
			<th>操作</th>
		

		<c:set var="row" value="0"/>
		<c:forEach var="greens" items="${usergreensPage.dataList }">
		
			<tr bgcolor='${ row == 0 ? "#d0d0d0" : "#ffffff"}'>
			
				<input type = "checkbox" name = "greensids" value="${greens.greensid }"  onclick = "checkSelect()">
			
				<img src="image/photo/${greens.greensphoto }" width="80px" />
			
				<a href="GreensQueryByCommentServlet?currentPage=1&greensid=${greens.greensid }">${myfn:convertKeyword(greens.greensname,greensname)}</a>
			
				${greens.rest.restname }
			
				${greens.greensprice }
			
				${greens.greensnumber }
			
				
						<input type="text" id="${greens.greensid }" name="${greens.greensid }" style="width:20px;" />
						<input type="button" id="addCar" onclick = "checkGreensnumber(${greens.greensid },this)" value="加入购物车" />
						<input type="button" id="buyCar" onclick = "checkGreensnumber(${greens.greensid },this)" value="立即购买" />
				
			

			<c:set var="row" value="${1-row }" />
		</c:forEach>
		
			<td colspan="8" align="center">
				<c:if test="${ usergreensPage.currentPage==1 }">
					首页&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${usergreensPage.currentPage!=1 }">
					<a href="GreensQueryByUserServlet?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
					<a href="GreensQueryByUserServlet?currentPage=${usergreensPage.currentPage-1 }">上一页</a>&nbsp;&nbsp;&nbsp;
				</c:if>
				
				<!-- 数字分页  -->
				<c:forEach var="i" begin="${usergreensPage.begin }" end="${usergreensPage.end}" step="1">
					<c:if test="${i==usergreensPage.currentPage}">
						${i }
					</c:if>
					<c:if test="${i!=usergreensPage.currentPage}">
						<a href="GreensQueryByUserServlet?currentPage=${i }" }>
							${i }
						</a>
					</c:if>
				</c:forEach>
				
				
				<c:if test="${usergreensPage.currentPage==usergreensPage.totalPage }">
					下一页&nbsp;&nbsp;&nbsp;尾页
				</c:if>
				<c:if test="${usergreensPage.currentPage!=usergreensPage.totalPage }">
					<a href="GreensQueryByUserServlet?currentPage=${usergreensPage.currentPage+1 }">下一页</a>&nbsp;&nbsp;&nbsp;
					<a href="GreensQueryByUserServlet?currentPage=${usergreensPage.totalPage}">尾页</a>
				</c:if>
				
				&nbsp;&nbsp;&nbsp;到
				<select name="currentPage" onchange="location='GreensQueryByUserServlet?currentPage='+this.value">
					<c:forEach var="i" begin="1" end="${usergreensPage.totalPage}" step="1">
						<option value="${i }" ${i==usergreensPage.currentPage ? "selected" : "" }>${i }</option>
					</c:forEach>
				</select>
				页
			
		
		
		
			<td colspan="8" align="center">
				共${usergreensPage.totalCount } 条记录&nbsp;&nbsp;&nbsp;
				每页${usergreensPage.pageSize } 条记录&nbsp;&nbsp;&nbsp;
				第【${usergreensPage.currentPage }】页/共${usergreensPage.totalPage }页
			
		
		
			<input type = "checkbox" id = "all" onclick = "selectAll()">全选
			<td colspan="5" align = "center"><input type = "submit" value = "购买">
			<input type = "button" value = "反选" onclick = "selectReverse()">
		

	</table>

</form>
	</c:if>
</c:if> --%>
	
	<c:if test="${requestScope.restcommentPage==null }">
		<div></div>
	</c:if>
	<c:if test="${requestScope.restcommentPage!=null }">
	<hr>
	<h2>餐厅评论</h2>

			<c:forEach items="${restcommentPage.dataList}" var="restcomment">

				<div class="comment">
					<div class="comment_userid">用户编号:${restcomment.userid }</div>
					<div class="comment_pubtime">发表时间:${restcomment.restcommentpubtime }</div>
					<div class="comment_title">标题:${restcomment.restcommenttitle }</div>
					<div class="comment_context">评论内容:${restcomment.restcommentcontext }</div>
					<div class="comment_score">评分:
						<c:forEach var="i" begin="1" end="${restcomment.score }">
							<img src="image/star_yellow.gif" />
						</c:forEach> <c:forEach var="i" begin="1" end="${5 - restcomment.score }">
							<img src="image/star_white.gif" />
						</c:forEach>
					</div>
				</div>

			</c:forEach>

		
			<div class="restcomment">
			
				<div class="restcomment_first">
					共 ${restcommentPage.totalCount } 条记录&nbsp;&nbsp;&nbsp;每页${restcommentPage.pageSize }条记录&nbsp;&nbsp;&nbsp;
					第【${restcommentPage.currentPage}】页/共${restcommentPage.totalPage }页
				</div>
				<div class="restcomment_first">
					<c:if test="${restcommentPage.currentPage==1 }">
						首页&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp; 
					</c:if> 
					<c:if test="${restcommentPage.currentPage!=1 }">
						<a href="GreensQueryByRestServlet?currentPage1=1&currentPage=1&restid=${sessionScope.restgreensid }">首页</a>&nbsp;&nbsp;&nbsp;
						<a href="GreensQueryByRestServlet?currentPage1=${restcommentPage.currentPage-1}&currentPage=1&restid=${sessionScope.restgreensid }">上一页</a>
					</c:if>&nbsp;&nbsp;&nbsp; 
					<c:if test="${restcommentPage.currentPage==restcommentPage.totalPage }">
						下一页&nbsp;&nbsp;&nbsp;尾页
					</c:if> 
					<c:if test="${restcommentPage.currentPage!=restcommentPage.totalPage }">
						<a href="GreensQueryByRestServlet?currentPage1=${restcommentPage.currentPage+1}&currentPage=1&restid=${sessionScope.restgreensid }">下一页</a>&nbsp;&nbsp;&nbsp;
						<a href="GreensQueryByRestServlet?currentPage1=${restcommentPage.totalPage }&currentPage=1&restid=${sessionScope.restgreensid }">尾页</a>&nbsp;&nbsp;&nbsp;
				</c:if>
				</div>
			</div>
	</c:if>




	<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		var flag = false;

		function checkGreensnumber(greensid, obj) {
			alert(greensid);
			var count = document.getElementById(greensid);
			if (count.value.length <= 0) {
				alert("输入不能为零");
				history.back();
			}
			xhr.open("get", "CheckGreensnumberServlet?greensid="
					+ encodeURI(greensid) + "&count=" + encodeURI(count.value),
					true);
			xhr.send(null);
			alert("123");
			xhr.onreadystatechange = checkGreensnumberResult(greensid);

			if (flag) {
				alert(obj.value);
				if (obj.value == "加入购物车") {
					location.href = "UserShoppingServlet?greensid=" + greensid
							+ "&count=" + count.value;
				}
				if (obj.value == "立即购买") {
					location.href = "UserBuyNowServlet?greensid=" + greensid
							+ "&count=" + count.value;
				}
			}

		}

		function checkGreensnumberResult(greensid) {
			if (xhr.readyState == 4) {
				alert(xhr.status);
				if (xhr.status == 200) {
					if (xhr.responseText == "success") {
						flag = confirm("是否执行操作？");
					} else {
						alert("库存不足！请选择其他菜");
					}
				} else {
					alert("调用失败");
				}
			}
		}

		//默认隐藏的
		var hide = true;
		//显示或者隐藏的函数
		function displayOrHide1() {
			var cityList = document.getElementById("cityList1");
			if (hide) {
				//显示
				cityList.style.display = "block";
				hide = false;
			} else {
				//隐藏
				cityList.style.display = "none";
				hide = true;
			}
		}
	</script>
</body>
</html>