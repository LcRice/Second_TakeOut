<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/myfunctions" prefix="myfn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/shopping_query.js"></script>
</head>
<body>
	<c:if test="${sessionScope.user==null }">
	<%
		String URL = request.getRequestURI();
		String prevURL = URL.substring(URL.lastIndexOf("/")+1);
		session.setAttribute("prevURL", prevURL);
	%>
	<script type="text/javascript">
		alert("尚未登录，请先登录！");
		location="user_login.jsp";
	</script>
</c:if>
<c:if test="${sessionScope.user!=null }">
	<c:if test="${requestScope.shoppingcarPage==null }">
	<%
		 	response.sendRedirect("UserShoppingQueryServlet");
	%>
	</c:if>
		
	<c:if test="${requestScope.shoppingcarPage!=null }">
	
	<h2>查看菜</h2>
	<hr color="gray" />
	
	<form action="UserBuyServlet" method = "post" onsubmit = "return checkCount()">
	<table border="1" cellpadding="1" cellspacing="0">
		<tr>
			<th>选择</th>
			<th>菜照片</th>
			<th>菜名</th>
			<th>餐厅</th>
			<th>价格</th>
			<th>购买个数</th>
			<th>操作</th>
		</tr>

		<c:set var="row" value="0"/>
		<c:forEach var="shoppingcar" items="${shoppingcarPage.dataList }">
		
			<tr bgcolor='${ row == 0 ? "#d0d0d0" : "#ffffff"}'>
			
				<td><input type = "checkbox" name = "greensids" value="${shoppingcar.greens.greensid }"  onclick = "checkSelect()"></td>
			
				<td><img src="image/photo/${shoppingcar.greens.greensphoto }" width="80px" /></td>
			
				<td><a href="GreensQueryByCommentServlet?greensid=${shoppingcar.greens.greensid }">${myfn:convertKeyword(shoppingcar.greens.greensname,greensname)}</a></td>
			
				<td>${shoppingcar.rest.restname }</td>
			
				<td>${shoppingcar.count } * ${shoppingcar.greens.greensprice }</td>
				
				<td>${shoppingcar.count }</td>
			
				<td>
					<a href="ShoppingDeleteServlet?currentPage=1&greensid=${shoppingcar.greens.greensid }" onclick = "return confirm('是否删除');">删除</a>
				</td>
			</tr>

			<c:set var="row" value="${1-row }" />
		</c:forEach>
		<tr>
			<td colspan="8" align="center">
				<c:if test="${ shoppingcarPage.currentPage==1 }">
					首页&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:if test="${shoppingcarPage.currentPage!=1 }">
					<a href="UserShoppingQueryServlet?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
					<a href="UserShoppingQueryServlet?currentPage=${shoppingcarPage.currentPage-1 }">上一页</a>&nbsp;&nbsp;&nbsp;
				</c:if>
				
				<!-- 数字分页  -->
				<c:forEach var="i" begin="${shoppingcarPage.begin }" end="${shoppingcarPage.end}" step="1">
					<c:if test="${i==shoppingcarPage.currentPage}">
						${i }
					</c:if>
					<c:if test="${i!=shoppingcarPage.currentPage}">
						<a href="UserShoppingQueryServlet?currentPage=${i }" }>
							${i }
						</a>
					</c:if>
				</c:forEach>
				
				
				<c:if test="${shoppingcarPage.currentPage==shoppingcarPage.totalPage }">
					下一页&nbsp;&nbsp;&nbsp;尾页
				</c:if>
				<c:if test="${shoppingcarPage.currentPage!=shoppingcarPage.totalPage }">
					<a href="UserShoppingQueryServlet?currentPage=${shoppingcarPage.currentPage+1 }">下一页</a>&nbsp;&nbsp;&nbsp;
					<a href="UserShoppingQueryServlet?currentPage=${shoppingcarPage.totalPage}">尾页</a>
				</c:if>
				
				&nbsp;&nbsp;&nbsp;到
				<select name="currentPage" onchange="location='UserShoppingQueryServlet?currentPage='+this.value">
					<c:forEach var="i" begin="1" end="${shoppingcarPage.totalPage}" step="1">
						<option value="${i }" ${i==shoppingcarPage.currentPage ? "selected" : "" }>${i }</option>
					</c:forEach>
				</select>
				页
			</td>
		</tr>
		
		<tr>
			<td colspan="8" align="center">
				共${shoppingcarPage.totalCount } 条记录&nbsp;&nbsp;&nbsp;
				每页${shoppingcarPage.pageSize } 条记录&nbsp;&nbsp;&nbsp;
				第【${shoppingcarPage.currentPage }】页/共${shoppingcarPage.totalPage }页
			</td>
		</tr>
		<tr>
			<td><input type = "checkbox" id = "all" onclick = "selectAll()">全选</td>
			<td colspan="5" align = "center"><input type = "submit" value = "付款"></td>
			<td><input type = "button" value = "反选" onclick = "selectReverse()"></td>
		</tr>

	</table>

</form>

	</c:if>
</c:if> --%>



<head>
		<meta charset="UTF-8">
		<title></title>
		<style type="text/css">
			*{
				margin: 0;
				padding: 0;
			}
			.allGreens {
				width: 1000px;
				height: 600px;
				margin: 0 auto;
			}
			
			#footer{
				width: 300px;
				margin-left: 700px;
				height: 50px;
				line-height: 50px;
				text-align: center;
			}
			
			.weight{
				font-size: 30px;
				color: orangered;
			}
			
			.oneGreens {
				width: 1000px;
				height: 100px;
			}
			
			.checkBox {
				display: inline-block;
				line-height: 100px;
				width: 50px;
				margin-left: 10px ;
			}
			
			.img{
				display: inline-block;
				height: 100px;
				max-height: 100px;
				margin-left: 20px;
			}
			
			.greensname{
				display: inline-block;
				margin-left: 20px;
				width: 100px;
				height: 100px;
				line-height: 100px;
			}
			
			.restname{
				display: inline-block;
				margin-left: 10px;
				width: 100px;
				height: 100px;
				line-height: 100px;
			}
			
			.greensprice{
				display: inline-block;
				margin-left: 10px;
				width: 50px;
				height: 100px;
				line-height: 100px;
			}
			
			.greenscount{
				display: inline-block;
				margin-left: 10px;
				width: 200px;
				height: 100px;
				line-height: 100px;
			}
			
			.greenscount_input{
				width: 30px;
			}
			
			.greenstotal{
				display: inline-block;
				margin-left: 10px;
				width: 100px;
				height: 100px;
				line-height: 100px;
				margin-right: 50px;
			}
			
			.catalogalldown {
				margin-top: 10px;
				margin-bottom: 50px;
			}
			
			.catalogdown {
				margin-top: 15px;
				text-align: center;
			}
			
			.paybtn{
				text-align: center;
				line-height: 50px;
				width: 150px;
				height: 50px;
				background-color: black;
				font-size: 15px;
				text-decoration: none;
				color: orangered;
				border-style: none;
				margin-left: 700px;
			}
			
			.paybtn:HOVER{
				color: black;
				background-color: orangered;
				cursor: pointer;
			}
			
			.selectall{
				margin-left: 150px;
			}
		</style>
		<script>
			function addCount(obj,greensid) {
				var count = document.getElementById(greensid);
				/*var count = obj.previousSibling;*/
				count.value++;

				/* alert(greensid);
				alert(count.value); */
				if(checkGreensnumber(greensid, count.value)) {
					subTotal(obj,count.value);
				} else {
					count.value--;
				}
			}

			function subCount(obj,greensid) {
				/*var count = obj.nextSibling;
				 */
				var count = document.getElementById(greensid);
				if(count.value > 1) {
					count.value--;
				} else {
					count.value = 1;
				}

				subTotal(obj,count.value);

			}

			//全选
			function selectAll() {
				var all = document.getElementById("all");
				var greensids = document.getElementsByName("greensids");

				for(var i = 0; i < greensids.length; i++) {
					greensids[i].checked = all.checked; //checked 选中为true  没选中为false;
				}
			}

			//反选
			function selectReverse() {
				var greensids = document.getElementsByName("greensids");

				for(var i = 0; i < greensids.length; i++) {
					greensids[i].checked = !greensids[i].checked;
				}

				checkSelect();
			}

			//全选框判断
			function checkSelect() {
				var all = document.getElementById("all");
				var greensids = document.getElementsByName("greensids");

				var flag = true;
				for(var i = 0; i < greensids.length; i++) {
					if(!greensids[i].checked) {
						flag = false;
						break;
					}
				}

				all.checked = flag;
			}

			//至少选一个用户
			function checkCount() {
				var greensids = document.getElementsByName("greensids");

				var flag = false;
				for(var i = 0; i < greensids.length; i++) {
					if(greensids[i].checked) {
						flag = true;
						break;
					}
				}

				if(!flag) {
					alert("至少选择一个菜");
					return false;
				}

				if(flag) {
					return confirm("是否确认？");
				}

			}

			var xhr = new XMLHttpRequest();
			var flag = false;

			function checkGreensnumber(greensid, count) {
			/* 	alert(greensid); */
				if(count.length <= 0 && count <= 0) {
					alert("输入不能为零");
					history.back();
				}
				/* alert(count); */
				xhr.open("get", "CheckGreensnumberServlet?greensid=" +
					encodeURI(greensid) + "&count=" + encodeURI(count),
					true);
				xhr.send(null);
				alert("判断库存");
				xhr.onreadystatechange = checkGreensnumberResult(greensid, count);
				
				return flag;
			}

			function checkGreensnumberResult(greensid, count) {
				if(xhr.readyState == 4) {
					/*  alert(xhr.status); */
					if(xhr.status == 200) {
						if(xhr.responseText == "success") {
							flag = true;
						} else {
							alert("库存不足！请选择其他菜");
							flag = false;
						}
					} else {
						alert("调用失败");
						flag = false;
					}
				}
			}

			function modifyQuantity(greensid,obj){
				
				var num = obj.value;
				
				if(num<=0){
					obj.value = 1;
					num = 1;
				}
				
				if(checkGreensnumber(greensid, num)){
					//更新小计
					subTotal(obj,num);
				
					//更新总计
					updateTotal();
				}else{
					obj.value = 1;
					subTotal(obj,obj.value);
				}
				
			}
			
			function subTotal(obj,count) {
				var price = obj.parentNode.previousSibling.previousSibling.innerText
				obj.parentNode.nextSibling.nextSibling.innerText = price * count;
			}

			function updateTotal() {

				//获取表格的每一行
				var rows = document.getElementsByClassName("oneGreens");
				var totalCount = 0;
				var totalAmount = 0;

				//遍历除了表头行之外的所有行。计算总金额和总件数
				for(var i = 0; i < rows.length; i++) {
					//只计算选中的商品
					if(state = rows[i].children[0].children[0].checked) {
						totalAmount += parseInt(rows[i].children[6].innerText);
						totalCount += parseInt(rows[i].children[5].children[1].value);
					}

				}

				//显示总金额和总件数
				document.getElementById("totalAmount").innerText = totalAmount;
				document.getElementById("totalCount").innerText = totalCount;
			}
		</script>
	</head>

	<body>
	<c:if test="${sessionScope.user==null }">
	<%
		String URL = request.getRequestURI();
		String prevURL = URL.substring(URL.lastIndexOf("/")+1);
		session.setAttribute("prevURL", prevURL);
	%>
	<script type="text/javascript">
		alert("尚未登录，请先登录！");
		location="user_login.jsp";
	</script>
</c:if>
<c:if test="${sessionScope.user!=null }">
	<c:if test="${requestScope.shoppingcarPage==null }">
	<%
		 	response.sendRedirect("UserShoppingQueryServlet?currentPage=1");
	%>
	</c:if>
		
	<c:if test="${requestScope.shoppingcarPage!=null }">
		<form action="UserBuyServlet" method="post" onsubmit="return checkCount()">
			<div class="allGreens">
				<div id="footer">
					总件数:<span class="weight" id="totalCount">0</span>件 &nbsp; 
					总金额:<span class="weight" id="totalAmount">0</span>元
				</div>
				<c:forEach var="shoppingcar" items="${shoppingcarPage.dataList }">
					<div class="oneGreens">
						<div class="checkBox">
							<input type="checkbox" name="greensids" value="${shoppingcar.greens.greensid }" onclick="checkSelect();updateTotal();">
							<!--${shoppingcar.greens.greensid }-->
						</div>
						<div class="img">
							<img src="image/photo/${shoppingcar.greens.greensphoto }" width="80px" />
						</div>
						<div class="greensname">
							<a href="GreensQueryByCommentServlet?currentPage=1&greensid=${shoppingcar.greens.greensid }">
								${myfn:convertKeyword(shoppingcar.greens.greensname,greensname)}</a>
						</div>
						<div class="restname">
							${shoppingcar.rest.restname }
						</div>
						单价：
						<div class="greensprice">
							${shoppingcar.greens.greensprice }
						</div>
						<div class="greenscount">
							<input type="button" value="-" onclick="subCount(this,${shoppingcar.greens.greensid })" />
							<input type="text" id="${shoppingcar.greens.greensid}" name="${shoppingcar.greens.greensid}" onkeyup="modifyQuantity(${shoppingcar.greens.greensid},this)" class="greenscount_input" value="${shoppingcar.count }" />
							<input type="button" value="+" onclick="addCount(this,${shoppingcar.greens.greensid })" />
						</div>
						小计：
						<div class="greenstotal">
							${shoppingcar.count *shoppingcar.greens.greensprice }
						</div>
						<a href="ShoppingDeleteServlet?currentPage=1&greensid=${shoppingcar.greens.greensid }" onclick="return confirm('是否删除');">删除</a>
					</div>
				</c:forEach>


			</div>
				<input type="checkbox" id="all" onclick="selectAll();updateTotal();" class="selectall">全选
				<input type="button" value="反选" onclick="selectReverse();updateTotal();" class="rcheckbtn">
				
				
				
				<input type="submit" value="付款" class="paybtn">

			<div class="catalogalldown">
				<div class="catalogdown">
					<c:if test="${ shoppingcarPage.currentPage==1 }">
						首页&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:if test="${shoppingcarPage.currentPage!=1 }">
						<a href="UserShoppingQueryServlet?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
						<a href="UserShoppingQueryServlet?currentPage=${shoppingcarPage.currentPage-1 }">上一页</a>&nbsp;&nbsp;&nbsp;
					</c:if>

					<!-- 数字分页  -->
					<c:forEach var="i" begin="${shoppingcarPage.begin }" end="${shoppingcarPage.end}" step="1">
						<c:if test="${i==shoppingcarPage.currentPage}">
							${i }
						</c:if>
						<c:if test="${i!=shoppingcarPage.currentPage}">
							<a href="UserShoppingQueryServlet?currentPage=${i }" }>
								${i }
							</a>
						</c:if>
					</c:forEach>

					<c:if test="${shoppingcarPage.currentPage==shoppingcarPage.totalPage }">
						下一页&nbsp;&nbsp;&nbsp;尾页
					</c:if>
					<c:if test="${shoppingcarPage.currentPage!=shoppingcarPage.totalPage }">
						<a href="UserShoppingQueryServlet?currentPage=${shoppingcarPage.currentPage+1 }">下一页</a>&nbsp;&nbsp;&nbsp;
						<a href="UserShoppingQueryServlet?currentPage=${shoppingcarPage.totalPage}">尾页</a>
					</c:if>

					&nbsp;&nbsp;&nbsp;到
					<select name="currentPage" onchange="location='UserShoppingQueryServlet?currentPage='+this.value">
						<c:forEach var="i" begin="1" end="${shoppingcarPage.totalPage}" step="1">
							<option value="${i }" ${i==shoppingcarPage.currentPage ? "selected" : "" }>${i }</option>
						</c:forEach>
					</select>
					页
				</div>
				<div class="catalogdown">
					共${shoppingcarPage.totalCount } 条记录&nbsp;&nbsp;&nbsp; 每页${shoppingcarPage.pageSize } 条记录&nbsp;&nbsp;&nbsp; 第【${shoppingcarPage.currentPage }】页/共${shoppingcarPage.totalPage }页
				</div>
			</div>

		</form>
	</c:if>
</c:if>

</body>
</html>