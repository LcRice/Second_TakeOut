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
import com.neuedu.service.OrderdetailService;
import com.neuedu.service.RestService;
import com.neuedu.service.ShoppingcarService;
import com.neuedu.service.SuperadminService;
import com.neuedu.service.UserService;
import com.neuedu.service.Impl.GreensServiceImpl;
import com.neuedu.service.Impl.OrderdetailServiceImpl;
import com.neuedu.service.Impl.RestServiceImpl;
import com.neuedu.service.Impl.ShoppingcarServiceImpl;
import com.neuedu.service.Impl.SuperadminServiceImpl;
import com.neuedu.service.Impl.UserServiceImpl;

public class PayCheckNowServlet extends HttpServlet {
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
		System.out.println("*********PayCheckNowServlet**********");
		GreensService greensService = new GreensServiceImpl();
		RestService restService = new RestServiceImpl();
		UserService userService = new UserServiceImpl();
		SuperadminService superadminService = new SuperadminServiceImpl();
		ShoppingcarService shoppingcarService = new ShoppingcarServiceImpl();
		OrderdetailService orderdetailService = new OrderdetailServiceImpl();

		User user = (User) session.getAttribute("user");

		int greensid = (Integer) session.getAttribute("greensidnow");
		int count = (Integer) session.getAttribute("countnow");
		int price = (Integer) session.getAttribute("pricenow");

		Greens greens = greensService.findGreensByGreensid(greensid);

		String usercardnumber = user.getUsercardnumber();
		String usercardpassword = user.getUsercardpassword();

		String cardnumber = request.getParameter("usercardnumber");
		String cardpassword = request.getParameter("usercardpassword");

		int userorderid = orderdetailService.getMaxUserOrderid();
		System.out.println("userorderid="+userorderid);

		boolean flag = false;

		if (usercardnumber.equals(cardnumber) && usercardpassword.equals(cardpassword)) {
			if (userService.updateUser(user, price)) {
				if (superadminService.updateSuperamount(greens) && orderdetailService.updateOrderstatus(userorderid, 5)
						&& restService.updateRestamount(greens) && greensService.updateGreensnumber(greens, count)) {
					flag = true;
				}
				if (flag) {
					out.print("<script>alert('����ɹ���');location='user_index.jsp'</script>");
				}else{
					out.print("<script>alert('����ʧ�ܣ�');history.back();</script>");
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
