package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.entity.Orderdetail;
import com.neuedu.service.GreencommentService;
import com.neuedu.service.OrderdetailService;
import com.neuedu.service.Impl.GreencommentServiceImpl;
import com.neuedu.service.Impl.OrderdetailServiceImpl;
import com.neuedu.vo.GreencommentPage;

public class GreensCommentQueryServlet extends HttpServlet {
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

		// 接收当前页码
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));

		// 读取分页大小
		int pageSize = Integer.parseInt(this.getInitParameter("pageSize"));

		GreencommentService greencommentService = new GreencommentServiceImpl();

		int userorderid = Integer.parseInt(request.getParameter("userorderid"));

		request.setAttribute("userorderid", userorderid);

		OrderdetailService orderdetailService = new OrderdetailServiceImpl();

		Orderdetail orderdetail = orderdetailService.findOrderdetail(userorderid);

		int greensid = orderdetail.getGreensid();

		GreencommentPage greencommentPage = greencommentService.findGreencommentPage(currentPage, pageSize, greensid);

		request.setAttribute("greencommentPage", greencommentPage);

		request.getRequestDispatcher("greencomment_query_user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
