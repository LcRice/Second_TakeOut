<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/myfunctions" prefix="myfn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>餐厅评论</title>
<script type="text/javascript" src="js/comment_add_user.js"></script>
<style type="text/css">
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
	
	.btn {
	display: inline-block;
	text-align: center;
	line-height: 50px;
	width: 150px;
	height: 50px;
	background-color: black;
	font-size: 15px;
	text-decoration: none;
	color: orangered;
	border-style: none;
	margin-left: 300px;
	}
	
	.btn:hover {
		color: black;
		background-color: orangered;
		cursor: pointer;
	}
</style>
</head>
<body>
	<c:if test="${sessionScope.user==null }">
		<script type="text/javascript">
			alert("您还未登录，请先登录！");
			location="user_login.jsp";
		</script>
	</c:if>
	<c:if test="${requestScope.restcommentPage==null }">
	<%
		response.sendRedirect("RestCommentQueryServlet?currentPage=1&userorderid=${requestScope.userorderid }");
	%>
	</c:if>

<h2>评论</h2>
<hr color="gray" />
<c:if test="${sessionScope.user!=null }">
<c:if test="${requestScope.restcommentPage!=null }">
<%-- <table border="1" cellpadding="1" cellspacing="0">
	
	<tr><th>用户编号</th><th>标题</th><th>内容</th><th>发表时间</th><th>评分</th></tr>
	
	<c:set var="row" value="0"/>
		
	<c:forEach items="${restcommentPage.dataList}" var="restcomment">
		
		 <tr bgcolor='${row==0 ? "#d0d0d0" : "#ffffff"  }'>
		 
		 	<td align="center">
				${restcomment.userid }
			</td>
	
			<td>${restcomment.restcommenttitle }</td>
	
			<td>${restcomment.restcommentcontext }</td>
			
			<td>${restcomment.restcommentpubtime }</td>
			
			<td>
				<c:forEach var="i" begin="1" end="${restcomment.score }">
					<img src="image/star_yellow.gif" />
				</c:forEach> 
				<c:forEach var="i" begin="1" end="${5 - restcomment.score }">
					<img src="image/star_white.gif" />
				</c:forEach>
			</td>
			
		</tr>
		    
		<c:set var="row" value="${1-row }"/>
		    
 	</c:forEach>



	<tr>
		<td colspan="7" align="center">
			共${restcommentPage.totalCount }条记录&nbsp;&nbsp;&nbsp;
			每页${restcommentPage.pageSize }条记录&nbsp;&nbsp;&nbsp;
                                    第【${restcommentPage.currentPage}】页/共${restcommentPage.totalPage }页
		</td>
	</tr>
	
	<tr>
		<td colspan="7" align="center">
		
			<c:if test="${restcommentPage.currentPage==1 }">
				首页&nbsp;&nbsp;&nbsp;上一页
			</c:if>
			<c:if test="${restcommentPage.currentPage!=1 }">
				<a href="RestCommentQueryServlet?currentPage=1&userorderid=${requestScope.userorderid }">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="RestCommentQueryServlet?currentPage=${restcommentPage.currentPage-1}&userorderid=${requestScope.userorderid }">上一页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${restcommentPage.currentPage==restcommentPage.totalPage }">
				下一页&nbsp;&nbsp;&nbsp;尾页
			</c:if>
			<c:if test="${restcommentPage.currentPage!=restcommentPage.totalPage }">
				<a href="RestCommentQueryServlet?currentPage=${restcommentPage.currentPage+1}&userorderid=${requestScope.userorderid }">下一页</a>&nbsp;&nbsp;&nbsp;
				<a href="RestCommentQueryServlet?currentPage=${restcommentPage.totalPage }&userorderid=${requestScope.userorderid }">尾页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
		</td>
	</tr>
	
	<tr>
		<td colspan="7" align="center">
			<select name="currentPage" onchange="location='RestCommentQueryServlet?currentPage=' + this.value">
				<c:forEach var="i" begin="1" end="${restcommentPage.totalPage}" step="1">
					<option value="${i}" ${i==restcommentPage.currentPage ? "selected" : ""}>${i}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	
	<tr>
		<td colspan="7" align="center">
		
			<c:set var="pageNumber" value="5"/>
			
			<c:forEach var="i" begin="${restcommentPage.begin}" end="${restcommentPage.end}" step="1">
				
				<c:if test="${i==restcommentPage.currentPage}">
					${i}
				</c:if>
				
				<c:if test="${i!=restcommentPage.currentPage}">
					<a href="RestCommentQueryServlet?currentPage=${i}&userorderid=${requestScope.userorderid }">${i}</a>
				</c:if>
	
			</c:forEach>
		</td>
	</tr>
	
   </table> --%>
   
   <c:forEach items="${restcommentPage.dataList}" var="restcomment">

				<div class="comment">
					<div class="comment_userid">用户编号：${restcomment.userid }</div>
					<div class="comment_pubtime">发表时间：${restcomment.restcommentpubtime }</div>
					<div class="comment_title">标题：${restcomment.restcommenttitle }</div>
					<div class="comment_context">评论内容：${restcomment.restcommentcontext }</div>
					<div class="comment_score">评分:
						<c:forEach var="i" begin="1" end="${restcomment.score }">
							<img src="image/star_yellow.gif" />
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5 - restcomment.score }">
							<img src="image/star_white.gif" />
						</c:forEach>
					</div>
				</div>

			</c:forEach>

			<div class="catalogalldown">
				<div class="catalogdown">
					共${restcommentPage.totalCount }条记录&nbsp;&nbsp;&nbsp;
				每页${restcommentPage.pageSize }条记录&nbsp;&nbsp;&nbsp;
                                    第【${restcommentPage.currentPage}】页/共${restcommentPage.totalPage }页
				</div>
				<div class="catalogdown">

					<c:if test="${restcommentPage.currentPage==1 }">
				首页&nbsp;&nbsp;&nbsp;上一页
			</c:if>
			<c:if test="${restcommentPage.currentPage!=1 }">
				<a href="RestCommentQueryServlet?currentPage=1&userorderid=${requestScope.userorderid }">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="RestCommentQueryServlet?currentPage=${restcommentPage.currentPage-1}&userorderid=${requestScope.userorderid }">上一页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${restcommentPage.currentPage==restcommentPage.totalPage }">
				下一页&nbsp;&nbsp;&nbsp;尾页
			</c:if>
			<c:if test="${restcommentPage.currentPage!=restcommentPage.totalPage }">
				<a href="RestCommentQueryServlet?currentPage=${restcommentPage.currentPage+1}&userorderid=${requestScope.userorderid }">下一页</a>&nbsp;&nbsp;&nbsp;
				<a href="RestCommentQueryServlet?currentPage=${restcommentPage.totalPage }&userorderid=${requestScope.userorderid }">尾页</a>&nbsp;&nbsp;&nbsp;
			</c:if>

				</div>
			</div>
</c:if>
<br/>
<h2>添加评论</h2>
<hr color="gray"/>
		<form action="CommentAddServletforRest?userorderid=${requestScope.userorderid }" method="post">
			评论标题
			<input type="text" name="title">
			<br/>
			评论内容
			<textarea name="content" rows="5" cols="30" id="content" onkeyup="checkWordCount()" class="ckeditor"></textarea><br/>
			<br /> 
			还能输入<span id="restWordCount">20</span>个字
			<br/>
			评论打分
  				<c:forEach var="i" begin="1" end="5">
				 <img src="image/star_white.gif" id="star${i}" 
				 		onmousemove="enter(${i})" 
				 		onmouseout="leave(${i})"
				 		onclick="select(${i})"/>
			  </c:forEach>
			  
			<input type="hidden" name="score" id="score" value="1"/>
 <br />

			<input type="submit" value="提交" class="btn"/>
		</form>
	</c:if>
	<br/>
</body>
</html>