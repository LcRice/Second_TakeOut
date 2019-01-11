package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.entity.Greens;
import com.neuedu.entity.Orderdetail;
import com.neuedu.entity.Shoppingcar;
import com.neuedu.entity.User;
import com.neuedu.service.GreensService;
import com.neuedu.service.OrderdetailService;
import com.neuedu.service.OrdersummaryService;
import com.neuedu.service.RestService;
import com.neuedu.service.ShoppingcarService;
import com.neuedu.service.SuperadminService;
import com.neuedu.service.UserService;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.OrderdetailServiceImpl;
import com.neuedu.service.Impl.OrdersummaryServiceImpl;
import com.neuedu.service.Impl.RestServiceImpl;
import com.neuedu.service.Impl.ShoppingcarServiceImpl;
import com.neuedu.service.Impl.SuperadminServiceImpl;
import com.neuedu.service.Impl.UserServiceImpl;

public class PayCheckServlet extends HttpServlet {
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

		GreensService greensService = new GreensServiceImpl();
		RestService restService = new RestServiceImpl();
		UserService userService = new UserServiceImpl();
		SuperadminService superadminService = new SuperadminServiceImpl();
		ShoppingcarService shoppingcarService = new ShoppingcarServiceImpl();
		OrderdetailService orderdetailService = new OrderdetailServiceImpl();
		OrdersummaryService ordersummaryService = new OrdersummaryServiceImpl();
		
		User user = (User) session.getAttribute("user");
		int price = (Integer) session.getAttribute("totalprice");
		
		List<Greens> greenslist = (List<Greens>) session.getAttribute("ordergreenslist");
		List<Shoppingcar> shoppingcarslist = (List<Shoppingcar>) session.getAttribute("ordershoppingcarslist");
		List<Integer> countlist =(List<Integer>) session.getAttribute("ordercountlist");
				
		String usercardnumber = user.getUsercardnumber();
		String usercardpassword = user.getUsercardpassword();

		String cardnumber = request.getParameter("usercardnumber");
		String cardpassword = request.getParameter("usercardpassword");

		int orderid = ordersummaryService.getMaxOrderid();
		
		List<Orderdetail> orderdetailslist = orderdetailService.findOrderListByOrderid(orderid);

		boolean flag = true;

		if (usercardnumber.equals(cardnumber) && usercardpassword.equals(cardpassword)) {
			if (userService.updateUser(user, price)) {
				for (int i = 0; i < greenslist.size(); i++) {
					if (superadminService.updateSuperamount(greenslist.get(i))
							&& orderdetailService.updateOrderstatus(orderdetailslist.get(i).getUserorderid(), 5)
							&& restService.updateRestamount(greenslist.get(i)) && greensService
									.updateGreensnumber(greenslist.get(i), countlist.get(i))) {
						if (!shoppingcarService.deleteShopping(user, greenslist.get(i))) {
							flag = false;
							out.print("<script>alert('����ʧ�ܣ�');history.back();</script>");
						}
					}
				}
				if (flag) {
					out.print("<script>alert('����ɹ���');location='GreensQueryByUserServlet?currentPage=1'</script>");
				}
			}
		} else {
			out.print("<script>alert('���뿨�����벻��ȷ��');history.back();</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
