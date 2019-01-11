<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/myfunctions" prefix="myfn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看菜</title>
<style type="text/css">
			.greens{
				width: 800px;
				height: 500px;
				margin: 0 auto;
				position: relative;
			}
			
			.img{
				position: absolute;
				height: 500px;
				max-height: 500px;
				max-width: 600px;
				top: 0px;
				left: 0px;
			}
			
			.greensname{
				position: absolute;
				left: 630px;
				top: 30px;
				font-size: 30px;
				font-weight: bolder;
			}
			
			.restname{
				position: absolute;
				left: 630px;
				top: 80px;
			}
			
			.greensprice{
				position: absolute;
				left: 630px;
				top:110px;
			}
			
			.greensprice_price{
				font-size: 20px;
				font-weight: bolder;
				color: red;
			}
			
			.greensnumber{
				position: absolute;
				left:630px;
				top:140px;
			}
			
			.greenscount{
				position: absolute;
				left:630px;
				top:170px;
			}
			
			.greenscount_input{
				width: 30px;
				text-align: center;
			}
			
			.button{
				position: absolute;
				left:630px;
				top:200px;
			}
			
			.button input{
				padding:0;
				margin-top: 10px;
				text-align: center;
				line-height: 50px;
				width: 150px;
				height: 50px;
				background-color: black;
				font-size: 15px;
				text-decoration: none;
				color: orangered;
				border-style: none;
			}
			
			.button input:HOVER{
				color: black;
				background-color: orangered;
				cursor: pointer;
			}
			
			.comment {
				position: relative;
				margin: 0 auto;
				width: 1200px;
				height: 100px;
			}
			
			.comment_userid {
				position: absolute;
				top: 10px;
				left: 10px;
			}
			
			.comment_pubtime {
				position: absolute;
				top: 10px;
				right: 10px;
				color: gray;
				font-size: 15px;
			}
			
			.comment_title {
				position: absolute;
				top: 32px;
				left: 20px;
				font-size: 20px;
			}
			
			.comment_score {
				position: absolute;
				top: 10px;
				left: 200px;
			}
			
			.comment_context {
				position: absolute;
				bottom: 20px;
				left: 25px;
			}
			
			.catalogalldown {
				margin-top: 10px;
				margin-bottom: 50px;
			}
			
			.catalogdown {
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
		<c:if test="${requestScope.selectedgreens==null }">
			<script type="text/javascript">
				alert("请选择菜！");
				location = "greens_query_user_all.jsp";
			</script>
		</c:if>

		<c:if test="${requestScope.selectedgreens!=null }">
			<div class="greens">
				<img src="image/photo/${requestScope.selectedgreens.greensphoto }" class="img" />
				<div class="greensname">
					${requestScope.selectedgreens.greensname }</div>
				<div class="restname">
					所属餐厅:${requestScope.selectedgreens.rest.restname }</div>
				
				<div class="greensprice">
					单价：<span class="greensprice_price">${requestScope.selectedgreens.greensprice }</span></div>
				<div class="greensnumber">
					库存：${requestScope.selectedgreens.greensnumber }</div>
				<div class="greenscount">
					<input type="button" value="-" onclick="subCount(${requestScope.selectedgreens.greensid })" />
					<input type="text" id="${requestScope.selectedgreens.greensid }" name="${requestScope.selectedgreens.greensid }" value="1" class="greenscount_input"/>
					<input type="button" value="+" onclick="addCount(${requestScope.selectedgreens.greensid })" />
				</div>
				<div class="button">
					<input type="button" id="addCar" onclick="checkGreensnumber(${requestScope.selectedgreens.greensid },this)" value="加入购物车" />
					<input type="button" id="buyCar" onclick="checkGreensnumber(${requestScope.selectedgreens.greensid },this)" value="立即购买" />
				</div>
			</div>

		</c:if>
		<hr>
		<h2>评论</h2>
		<hr color="gray" />

		<c:if test="${requestScope.greencommentPage!=null }">

			<c:forEach items="${greencommentPage.dataList}" var="greencomment">

				<div class="comment">
					<div class="comment_userid">用户编号：${greencomment.userid }</div>
					<div class="comment_pubtime">发表时间：${greencomment.greencommentpubtime }</div>
					<div class="comment_title">标题：${greencomment.greencommenttitle }</div>
					<div class="comment_context">评论内容：${greencomment.greencommentcontext }</div>
					<div class="comment_score">评分:
						<c:forEach var="i" begin="1" end="${greencomment.score }">
							<img src="image/star_yellow.gif" />
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5 - greencomment.score }">
							<img src="image/star_white.gif" />
						</c:forEach>
					</div>
				</div>

			</c:forEach>

			<div class="catalogalldown">
				<div class="catalogdown">
					共${greencommentPage.totalCount }条记录&nbsp;&nbsp;&nbsp; 每页${greencommentPage.pageSize }条记录&nbsp;&nbsp;&nbsp; 第【${greencommentPage.currentPage}】页/共${greencommentPage.totalPage }页
				</div>
				<div class="catalogdown">

					<c:if test="${greencommentPage.currentPage==1 }">
						首页&nbsp;&nbsp;&nbsp;上一页
					</c:if>
					<c:if test="${greencommentPage.currentPage!=1 }">
						<a href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=1&userorderid=${requestScope.userorderid }">首页</a>&nbsp;&nbsp;&nbsp;
						<a href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=${greencommentPage.currentPage-1}&userorderid=${requestScope.userorderid }">上一页</a>&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${greencommentPage.currentPage==greencommentPage.totalPage }">
						下一页&nbsp;&nbsp;&nbsp;尾页
					</c:if>
					<c:if test="${greencommentPage.currentPage!=greencommentPage.totalPage }">
						<a href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=${greencommentPage.currentPage+1}&userorderid=${requestScope.userorderid }">下一页</a>&nbsp;&nbsp;&nbsp;
						<a href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=${greencommentPage.totalPage }&userorderid=${requestScope.userorderid }">尾页</a>&nbsp;&nbsp;&nbsp;
					</c:if>

				</div>
			</div>

		</c:if>
	</c:if>





		<%-- <c:if test="${requestScope.selectedgreens!=null }">
			<table>
				<tr>
					<th style="width: 100px">菜图</th>
					<th style="width: 300px;">菜</th>
					<th style="width: 300px;">餐厅</th>
					<th style="width: 100px;">价格</th>
					<th style="width: 100px;">库存</th>
					<th style="width: 400px;">操作</th>
				</tr>
				<tr>
					<td><img src="image/photo/${requestScope.selectedgreens.greensphoto }" /></td>
					<td>${requestScope.selectedgreens.greensname }</td>
					<td>${requestScope.selectedgreens.rest.restname }</td>
					<td>${requestScope.selectedgreens.greensprice }</td>
					<td>${requestScope.selectedgreens.greensnumber }</td>
					<td><input type="text" id="${requestScope.selectedgreens.greensid }" name="${requestScope.selectedgreens.greensid }" style="width: 20px;" /> 
						<input type="button" id="addCar" onclick="checkGreensnumber(${requestScope.selectedgreens.greensid },this)" value="加入购物车" />
						<input type="button" id="buyCar" onclick="checkGreensnumber(${requestScope.selectedgreens.greensid },this)" value="立即购买" /></td>
				</tr>
			</table>
		</c:if>
	<hr>
	<h2>评论</h2>
	<hr color="gray" />

	<c:if test="${requestScope.greencommentPage!=null }">
		<table border="1" cellpadding="1" cellspacing="0">

			<tr>
				<th>用户编号</th>
				<th>标题</th>
				<th>内容</th>
				<th>发表时间</th>
				<th>评分</th>
			</tr>

			<c:set var="row" value="0" />

			<c:forEach items="${greencommentPage.dataList}" var="greencomment">

				<tr bgcolor='${row==0 ? "#d0d0d0" : "#ffffff"  }'>
					
					<td align="center">${greencomment.userid }</td>

					<td>${greencomment.greencommenttitle }</td>

					<td>${greencomment.greencommentcontext }</td>

					<td>${greencomment.greencommentpubtime }</td>

					<td><c:forEach var="i" begin="1" end="${greencomment.score }">
							<img src="image/star_yellow.gif" />
						</c:forEach> <c:forEach var="i" begin="1" end="${5 - greencomment.score }">
							<img src="image/star_white.gif" />
						</c:forEach></td>

				</tr>

				<c:set var="row" value="${1-row }" />

			</c:forEach>



			<tr>
				<td colspan="5" align="center">共${greencommentPage.totalCount }条记录&nbsp;&nbsp;&nbsp;
					每页${greencommentPage.pageSize }条记录&nbsp;&nbsp;&nbsp;
					第【${greencommentPage.currentPage}】页/共${greencommentPage.totalPage }页
				</td>
			</tr>

			<tr>
				<td colspan="5" align="center"><c:if
						test="${greencommentPage.currentPage==1 }">
				首页&nbsp;&nbsp;&nbsp;上一页
			</c:if> <c:if test="${greencommentPage.currentPage!=1 }">
						<a
							href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=1&userorderid=${requestScope.userorderid }">首页</a>&nbsp;&nbsp;&nbsp;
				<a
							href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=${greencommentPage.currentPage-1}&userorderid=${requestScope.userorderid }">上一页</a>&nbsp;&nbsp;&nbsp;
			</c:if> <c:if
						test="${greencommentPage.currentPage==greencommentPage.totalPage }">
				下一页&nbsp;&nbsp;&nbsp;尾页
			</c:if> <c:if
						test="${greencommentPage.currentPage!=greencommentPage.totalPage }">
						<a
							href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=${greencommentPage.currentPage+1}&userorderid=${requestScope.userorderid }">下一页</a>&nbsp;&nbsp;&nbsp;
				<a
							href="GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=${greencommentPage.totalPage }&userorderid=${requestScope.userorderid }">尾页</a>&nbsp;&nbsp;&nbsp;
			</c:if></td>
			</tr>

			<tr>
				<td colspan="5" align="center"><select name="currentPage"
					onchange="location='GreensQueryByCommentServlet?greensid=${requestScope.greensid }&currentPage=' + this.value">
						<c:forEach var="i" begin="1" end="${greencommentPage.totalPage}"
							step="1">
							<option value="${i}"
								${i==greencommentPage.currentPage ? "selected" : ""}>${i}</option>
						</c:forEach>
				</select></td>
			</tr>

		</table>
	</c:if> --%>





		<%-- <c:if test="${sessionScope.user==null }">
		<%
			String URL = request.getRequestURI();
				String prevURL = URL.substring(URL.lastIndexOf("/") + 1);
				session.setAttribute("prevURL", prevURL);
		%>
		<script type="text/javascript">
		alert("尚未登录，请先登录！");
		location="user_login.jsp";
	</script>
	</c:if>
	<c:if test="${sessionScope.user!=null }">
		<c:if test="${requestScope.usergreensPage==null }">
			<%
				response.sendRedirect("GreensQueryByUserServlet");
			%>
		</c:if>

		<c:if test="${requestScope.usergreensPage!=null }">

			<div class="search">
				<form action="GreensQueryByUserServlet?currentPage=1" method="post">
					<input type="text" class="search_input" name="findgreens"
						value="${requestScope.greensname }" placeholder="请输入搜索内容" /> <input
						type="submit" class="search_button" value="查询" />
				</form>
			</div>
			<br />
			<div class="table">
				<form action="UserShoppingBatchServlet" method="post"
					onsubmit="return checkCount()">
					<table>
						<tr>
							<th style="width: 100px;">选择</th>
							<th style="width: 300px;">菜</th>
							<th style="width: 300px;">餐厅</th>
							<th style="width: 100px;">价格</th>
							<th style="width: 100px;">库存</th>
							<th style="width: 400px;">操作</th>
						</tr>

						<c:set var="row" value="0" />
						<c:forEach var="greens" items="${usergreensPage.dataList }">
							<tr class="rows" bgcolor='${ row == 0 ? "#d0d0d0" : "#ffffff"}'>

								<td><input type="checkbox" name="greensids"
									value="${greens.greensid }" onclick="checkSelect()"></td>

								<td><img src="image/photo/${greens.greensphoto }"
									width="80px" /><br /> <a
									href="GreensQueryByCommentServlet?currentPage=1&greensid=${greens.greensid }">${myfn:convertKeyword(greens.greensname,greensname)}</a>
								</td>

								<td>${greens.rest.restname }</td>

								<td>${greens.greensprice }</td>

								<td>${greens.greensnumber }</td>

								<td><input type="text" id="${greens.greensid }"
									name="${greens.greensid }" style="width: 20px;" /> <input
									type="button" id="addCar"
									onclick="checkGreensnumber(${greens.greensid },this)"
									value="加入购物车" /> <input type="button" id="buyCar"
									onclick="checkGreensnumber(${greens.greensid },this)"
									value="立即购买" /></td>
							</tr>

							<c:set var="row" value="${1-row }" />
						</c:forEach>
						<tr>
							<td colspan="8" align="center"><c:if
									test="${ usergreensPage.currentPage==1 }">
								首页&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;
							</c:if> <c:if test="${usergreensPage.currentPage!=1 }">
									<a href="GreensQueryByUserServlet?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
								<a
										href="GreensQueryByUserServlet?currentPage=${usergreensPage.currentPage-1 }">上一页</a>&nbsp;&nbsp;&nbsp;
							</c:if> <!-- 数字分页  --> <c:forEach var="i"
									begin="${usergreensPage.begin }" end="${usergreensPage.end}"
									step="1">
									<c:if test="${i==usergreensPage.currentPage}">
									${i }
								</c:if>
									<c:if test="${i!=usergreensPage.currentPage}">
										<a href="GreensQueryByUserServlet?currentPage=${i }"}>
											${i } </a>
									</c:if>
								</c:forEach> <c:if
									test="${usergreensPage.currentPage==usergreensPage.totalPage }">
								下一页&nbsp;&nbsp;&nbsp;尾页
							</c:if> <c:if
									test="${usergreensPage.currentPage!=usergreensPage.totalPage }">
									<a
										href="GreensQueryByUserServlet?currentPage=${usergreensPage.currentPage+1 }">下一页</a>&nbsp;&nbsp;&nbsp;
								<a
										href="GreensQueryByUserServlet?currentPage=${usergreensPage.totalPage}">尾页</a>
								</c:if> &nbsp;&nbsp;&nbsp;到 <select name="currentPage"
								onchange="location='GreensQueryByUserServlet?currentPage='+this.value">
									<c:forEach var="i" begin="1" end="${usergreensPage.totalPage}"
										step="1">
										<option value="${i }"
											${i==usergreensPage.currentPage ? "selected" : "" }>${i }</option>
									</c:forEach>
							</select> 页</td>
						</tr>

						<tr>
							<td colspan="8" align="center">共${usergreensPage.totalCount }
								条记录&nbsp;&nbsp;&nbsp; 每页${usergreensPage.pageSize }
								条记录&nbsp;&nbsp;&nbsp; 第【${usergreensPage.currentPage }】页/共${usergreensPage.totalPage }页
							</td>
						</tr>
						<tr>
							<td><input type="checkbox" id="all" onclick="selectAll()">全选</td>
							<td colspan="5" align="center"><input type="submit"
								value="购买"></td>
							<td><input type="button" value="反选"
								onclick="selectReverse()"></td>
						</tr>

					</table>

				</form>
			</div>

		</c:if>
	</c:if>
--%>
		<script type="text/javascript">
var xhr = new XMLHttpRequest();
var flag = false;

function checkGreensnumber(greensid,obj) {
	var count = document.getElementById(greensid);
	if(count.value.length<=0){
		alert("输入不能为零");
		history.back();
	}
	xhr.open("get", "CheckGreensnumberServlet?greensid=" + encodeURI(greensid)+"&count="+encodeURI(count.value), true);
	xhr.send(null);
	alert("检查库存");
	xhr.onreadystatechange = checkGreensnumberResult(greensid);

	if(flag){
		if(obj.value=="加入购物车"){
			location.href="UserShoppingServlet?greensid="+greensid+"&count="+count.value;
		}
		if(obj.value=="立即购买"){
			location.href="UserBuyNowServlet?greensid="+greensid+"&count="+count.value;
		}
	}
	
}

function checkGreensnumberResult(greensid) {
	if (xhr.readyState == 4) {
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

function addCount(greensid){
	var count = document.getElementById(greensid);
	/*var count = obj.previousSibling;*/
	count.value++;
}

function subCount(greensid){
	/*var count = obj.nextSibling;
*/				var count = document.getElementById(greensid);
	if(count.value>1){
		count.value--;	
	}else{
		count.value=1;
	}
	
}
</script>
</body>
</html>