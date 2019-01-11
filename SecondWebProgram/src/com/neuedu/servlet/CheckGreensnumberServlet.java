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
import com.neuedu.service.GreensService;
import com.neuedu.service.Impl.GreensServiceImpl;

public class CheckGreensnumberServlet extends HttpServlet {
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

		System.out.println("����");
		String greensid = request.getParameter("greensid");
		String count = request.getParameter("count");
		if(count==null){
			count = 1+"";
		}

		Greens greens = greensService.findGreensByGreensid(Integer.parseInt(greensid));
		System.out.println("count="+count);
		System.out.println("greensid="+greensid);
		System.out.println(greens.getGreensnumber());
		if (greens.getGreensnumber() >= 1) {
			
			if (Integer.parseInt(count) <= greens.getGreensnumber()) {
				out.print("success");
			}
			else{
				out.print("fail");
			}
		} else {
			out.print("fail");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
