package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.entity.Greens;
import com.neuedu.entity.Restaurant;
import com.neuedu.service.GreencommentService;
import com.neuedu.service.GreensService;
import com.neuedu.service.RestService;
import com.neuedu.service.Impl.GreencommentServiceImpl;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.RestServiceImpl;
import com.neuedu.vo.GreencommentPage;

public class GreensQueryByUserselfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取session对象---需要session对象时加此句
		HttpSession session = request.getSession();

		// 设置输出内容类型
		response.setContentType("text/html;charset=utf-8");

		// 获取out输出对象
		PrintWriter out = response.getWriter();

		// 从配置文件中读取字符编码
		String charSet = this.getServletContext().getInitParameter("charSet");

		// 设置字符编码
		request.setCharacterEncoding(charSet);

		// 获取application对象
		ServletContext application = this.getServletContext();

		// 接收当前页码
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));

		// 读取分页大小
		int pageSize = Integer.parseInt(this.getInitParameter("pageSize"));

		RestService restService = new RestServiceImpl();
		GreensService greensService = new GreensServiceImpl();

		int greensid = Integer.parseInt(request.getParameter("greensid"));

		Greens greens = greensService.findGreensByGreensid(greensid);
		
		Restaurant restaurant = restService.findRest(greens.getRest().getRestid());

		greens.setRest(restaurant);
		
		request.setAttribute("selectedgreens", greens);

		//评论
		GreencommentService greencommentService = new GreencommentServiceImpl();

		request.setAttribute("greensid", greensid);

		GreencommentPage greencommentPage = greencommentService.findGreencommentPage(currentPage, pageSize, greensid);

		request.setAttribute("greencommentPage", greencommentPage);

		request.getRequestDispatcher("greens_query_user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
