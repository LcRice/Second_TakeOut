<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

		<%
			int userid = Integer.parseInt(request.getParameter("userid"));
		%>
		
		<frameset cols="15%,*">
			<frame noresize name="left1" src="super_user_left.jsp" noresize="noresize" scrolling="no" width="100%" height="100%"></frame>
			<frame noresize name="right1" src="UserInfoQueryServlet?userid=<%=userid%>"></frame>
		</frameset>
</head>
<body>

</body>
</html>