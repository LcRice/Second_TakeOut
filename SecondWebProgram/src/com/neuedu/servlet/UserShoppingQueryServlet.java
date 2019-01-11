package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.entity.User;
import com.neuedu.service.ShoppingcarService;
import com.neuedu.service.UserService;
import com.neuedu.service.Impl.ShoppingcarServiceImpl;
import com.neuedu.service.Impl.UserServiceImpl;
import com.neuedu.vo.ShoppingcarPage;

public class UserShoppingQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//查询购物车
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

		ShoppingcarService shoppingcarService = new ShoppingcarServiceImpl();
		
		User user1 = (User) session.getAttribute("user");
		UserService userService = new UserServiceImpl();
		User user = userService.findUser(user1.getUserid());
		int userid = user.getUserid();
		
		
		ShoppingcarPage shoppingcarPage = shoppingcarService.findShoppingList(currentPage, pageSize, userid);
		
		request.setAttribute("shoppingcarPage", shoppingcarPage);
		
		request.getRequestDispatcher("shoppingcar_query_user.jsp").forward(request, response);

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
