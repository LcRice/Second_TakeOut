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
import com.neuedu.service.UserService;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.OrderdetailServiceImpl;
import com.neuedu.service.Impl.OrdersummaryServiceImpl;
import com.neuedu.service.Impl.ShoppingcarServiceImpl;
import com.neuedu.service.Impl.UserServiceImpl;

public class UserBuyServlet extends HttpServlet {
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

		UserService userService = new UserServiceImpl();
		GreensService greensService = new GreensServiceImpl();
		ShoppingcarService shoppingcarService = new ShoppingcarServiceImpl();
		OrdersummaryService ordersummaryService = new OrdersummaryServiceImpl();
		OrderdetailService orderdetailService = new OrderdetailServiceImpl();

		User user1 = (User) session.getAttribute("user");
		
		User user = userService.findUser(user1.getUserid());
		session.setAttribute("user", user);

		String[] greensids = request.getParameterValues("greensids");
		String[] counts = new String[greensids.length];
		
		for(int i = 0; i <greensids.length;i++){
			counts[i]=request.getParameter(greensids[i]);
			System.out.println("count["+i+"]="+counts[i]);
		}
		
		List<Greens> greenslist = new ArrayList<Greens>();
		List<Shoppingcar> shoppingcarslist = new ArrayList<Shoppingcar>();
		List<Integer> countlist = new ArrayList<Integer>();
		
		int price = 0;
		for (int i = 0; i < greensids.length; i++) {
			Greens greens = greensService.findGreensByGreensid(Integer.parseInt(greensids[i]));
			Shoppingcar shoppingcar = shoppingcarService.findShopping(user, greens);
			shoppingcarslist.add(shoppingcar);
			greenslist.add(greens);
			countlist.add(Integer.parseInt(counts[i]));
			price = price + (greens.getGreensprice() * Integer.parseInt(counts[i]));
		}

		session.setAttribute("ordershoppingcarslist", shoppingcarslist);
		session.setAttribute("totalprice", price);
		session.setAttribute("ordergreenslist", greenslist);
		session.setAttribute("ordercountlist", countlist);

		Date date = new Date();
		System.out.println(user.getUseramount());
		System.out.println(price);
		boolean flag = true;
		if (user.getUseramount() >= price) {
			System.out.println("1");
			if (ordersummaryService.insertDate(user.getUserid(), date)) {
				System.out.println("2");
				int orderid = ordersummaryService.getMaxOrderid();
				for (int i = 0; i < greenslist.size(); i++) {
					System.out.println(i);
					Shoppingcar shoppingcar = shoppingcarService.findShopping(user, greenslist.get(i));
					if (orderdetailService.insertDate(greenslist.get(i).getGreensid(), orderid,
							Integer.parseInt(counts[i]))) {
						flag = false;
						out.print("<script>alert('" + i + "   Error!');history.back();</script>");
					}
				}
			} else {
				flag = false;
				out.print("<script>alert('ordersummary Error!');history.back();</script>");
			}
		} else {
			flag = false;
			out.print("<script>alert('余额不足，请充值或换卡支付！');history.back();</script>");
		}
		if (flag) {
			request.getRequestDispatcher("pay_page.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
