package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ȡsession����
		HttpSession session = request.getSession();

		// ��ȡout�������---��Ҫ�������ʱ�Ӵ˾�
		PrintWriter out = response.getWriter();
		
		// ��ȡapplication����
		ServletContext application = this.getServletContext();

		session.removeAttribute("user");
		/*response.sendRedirect("user_login.jsp");*/
		out.print("<script>window.location='user_login.jsp';</script>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
