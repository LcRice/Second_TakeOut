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
import com.neuedu.entity.User;
import com.neuedu.service.GreensService;
import com.neuedu.service.ShoppingcarService;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.ShoppingcarServiceImpl;

public class UserShoppingBatchServlet extends HttpServlet {
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

		ShoppingcarService shoppingcarService = new ShoppingcarServiceImpl();
		GreensService greensService = new GreensServiceImpl();

		String[] greensids = request.getParameterValues("greensids");
		String[] counts = new String[greensids.length];
		
		for(int i = 0; i <greensids.length;i++){
			counts[i]=request.getParameter(greensids[i]);
			System.out.println(counts[i]);
		}

		User currentUser = (User) session.getAttribute("user");

		for (int i = 0; i < greensids.length; i++) {
			Greens currentGreens = greensService.findGreensByGreensid(Integer.parseInt(greensids[i]));
			int count = Integer.parseInt(counts[i]);
			System.out.println(shoppingcarService.checkShopping(currentUser, currentGreens));
			if (shoppingcarService.checkShopping(currentUser, currentGreens)) {
				if (shoppingcarService.insertShopping(currentUser, currentGreens, count)) {
					out.println("<script>alert('添加成功');history.back();</script>");
				} else {
					out.println("<script>alert('添加失败');history.back();</script>");
				}
			} else {
				if (shoppingcarService.updateShopping(currentUser, currentGreens, count)) {
					out.println("<script>alert('添加成功!');location='GreensQueryByUserServlet?currentPage=1'</script>");
				} else {
					out.println("<script>alert('添加失败!');history.back();</script>");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
