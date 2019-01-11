package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.entity.Greens;
import com.neuedu.entity.Shoppingcar;
import com.neuedu.entity.User;
import com.neuedu.service.GreensService;
import com.neuedu.service.OrderdetailService;
import com.neuedu.service.OrdersummaryService;
import com.neuedu.service.ShoppingcarService;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.OrderdetailServiceImpl;
import com.neuedu.service.Impl.OrdersummaryServiceImpl;
import com.neuedu.service.Impl.ShoppingcarServiceImpl;

public class UserBuyNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ���������������
		response.setContentType("text/html;charset=utf-8");

		// ��ȡout�������
		PrintWriter out = response.getWriter();

		// ��ȡsession����
		HttpSession session = request.getSession();

		// ��ȡapplication����
		ServletContext application = this.getServletContext();

		// �������ļ��ж�ȡ�ַ�����
		String charSet = this.getServletContext().getInitParameter("charSet");

		// �����ַ�����
		request.setCharacterEncoding(charSet);
		System.out.println("*************UserBuyNowServlet**************");
		GreensService greensService = new GreensServiceImpl();
		ShoppingcarService shoppingcarService = new ShoppingcarServiceImpl();
		OrdersummaryService ordersummaryService = new OrdersummaryServiceImpl();
		OrderdetailService orderdetailService = new OrderdetailServiceImpl();

		User user = (User) session.getAttribute("user");

		int greensid = Integer.parseInt(request.getParameter("greensid"));
		int count = Integer.parseInt(request.getParameter("count"));

		Greens greens = greensService.findGreensByGreensid(greensid);
		int price = greens.getGreensprice() * count;
		
		session.setAttribute("greensidnow", greensid);
		session.setAttribute("countnow", count);
		session.setAttribute("pricenow", price);
		
		Date date = new Date();
		System.out.println(user.getUseramount());
		System.out.println(price);
		boolean flag = true;
		if (user.getUseramount() >= price) {
			System.out.println("1");
			if (ordersummaryService.insertDate(user.getUserid(), date)) {
				System.out.println("2");
				int orderid = ordersummaryService.getMaxOrderid();
				if (orderdetailService.insertDate(greens.getGreensid(), orderid, count)) {
					System.out.println("3");
					flag = false;
					out.print("<script>alert(' Error!');history.back();</script>");
				}
			} else {
				flag = false;
				out.print("<script>alert('ordersummary Error!');history.back();</script>");
			}
		} else {
			flag = false;
			out.print("<script>alert('���㣬���ֵ�򻻿�֧����');history.back();</script>");
		}
		if (flag) {
			request.getRequestDispatcher("pay_page_now.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
