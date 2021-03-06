<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/myfunctions" prefix="myfn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看配送员</title>
</head>
<body>
<c:if test="${requestScope.courierPage==null }">
	<%
		response.sendRedirect("CourierQueryServletBySuper?currentPage=1");
	%>
	</c:if>

<h2>查看配送员</h2>
<hr color="gray" />

<c:if test="${requestScope.courierPage!=null }">

	<table border="1" cellpadding="1" cellspacing="0">
	
	<tr><th>配送员名称</th><th>配送员工资</th><th>配送员状态</th><th>配送员评论数</th><th>配送员好评数</th></tr>
	
	<c:set var="row" value="0"/>
		
	<c:forEach items="${courierPage.dataList}" var="couriers">
		
		 <tr bgcolor='${row==0 ? "#d0d0d0" : "#ffffff"  }'>
		 
		 	<td align="center">
		 		<%-- <a href="CourierInfoQueryServlet?courierid=${couriers.courierid }">${couriers.couriername }</a> --%>
				<a href="super_courier_frame.jsp?courierid=${couriers.courierid }">${couriers.couriername }</a>
			</td>
	
			<td>${couriers.couriercamount }</td>
	
			<td>${couriers.courierstatus }</td>

			<td>${couriers.couriercommentcount }</td>

			<td>${couriers.courierwellreceived }</td>
		</tr>
		    
		<c:set var="row" value="${1-row }"/>
		    
 	</c:forEach>



	<tr>
		<td colspan="5" align="center">
			共${courierPage.totalCount }条记录&nbsp;&nbsp;&nbsp;
			每页${courierPage.pageSize }条记录&nbsp;&nbsp;&nbsp;
                                    第【${courierPage.currentPage}】页/共${courierPage.totalPage }页
		</td>
	</tr>
	
	<tr>
		<td colspan="5" align="center">
		
			<c:if test="${courierPage.currentPage==1 }">
				首页&nbsp;&nbsp;&nbsp;上一页
			</c:if>
			<c:if test="${courierPage.currentPage!=1 }">
				<a href="CourierQueryServletBySuper?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;
				<a href="CourierQueryServletBySuper?currentPage=${courierPage.currentPage-1}">上一页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${courierPage.currentPage==courierPage.totalPage }">
				下一页&nbsp;&nbsp;&nbsp;尾页
			</c:if>
			<c:if test="${courierPage.currentPage!=courierPage.totalPage }">
				<a href="CourierQueryServletBySuper?currentPage=${courierPage.currentPage+1}">下一页</a>&nbsp;&nbsp;&nbsp;
				<a href="CourierQueryServletBySuper?currentPage=${courierPage.totalPage }">尾页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
		</td>
	</tr>
	
	<tr>
		<td colspan="5" align="center">
			<select name="currentPage" onchange="location='CourierQueryServletBySuper?currentPage=' + this.value">
				<c:forEach var="i" begin="1" end="${courierPage.totalPage}" step="1">
					<option value="${i}" ${i==courierPage.currentPage ? "selected" : ""}>${i}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	
   </table>
</c:if>
</body>
</html>