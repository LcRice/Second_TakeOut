package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.service.GreensService;
import com.neuedu.service.RestcommentService;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.RestcommentServiceImpl;
import com.neuedu.vo.GreensPage;
import com.neuedu.vo.RestcommentPage;

public class GreensQueryByRestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置输出内容类型
		response.setContentType("text/html;charset=utf-8");

		// 获取out输出对象
		PrintWriter out = response.getWriter();

		// 获取session对象
		HttpSession session = request.getSession();

		// 获取application对象
		ServletContext application = this.getServletContext();

		// 从配置文件中读取字符编码
		String charSet = this.getServletContext().getInitParameter("charSet");

		// 设置字符编码
		request.setCharacterEncoding(charSet);

		int restid = Integer.parseInt(request.getParameter("restid"));
		session.setAttribute("restgreensid", restid);
		
		// 接收当前页码
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));

		// 接收当前页码
		int currentPage1 = Integer.parseInt(request.getParameter("currentPage1"));

		// 读取分页大小
		int pageSize = Integer.parseInt(this.getInitParameter("pageSize"));

		// 读取分页大小
		int pageSize1 = Integer.parseInt(this.getInitParameter("pageSize1"));

		GreensService greensService = new GreensServiceImpl();
		RestcommentService restcommentService = new RestcommentServiceImpl();

		GreensPage greensPage = greensService.getGreensPage(currentPage, pageSize, restid);

		request.setAttribute("usergreensPage", greensPage);

		RestcommentPage restcommentPage = restcommentService.findRestcommentPage(currentPage1, pageSize1, restid);

		request.setAttribute("restcommentPage", restcommentPage);
		
//		request.getRequestDispatcher("restgreens_query_user.jsp").forward(request, response);
		request.getRequestDispatcher("greens_query_user_all.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
