package com.neuedu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.neuedu.entity.Restaurant;
import com.neuedu.service.RestService;
import com.neuedu.service.Impl.RestServiceImpl;
import com.neuedu.util.StringUtil;

public class RestRegisterServlet extends HttpServlet {
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

		// 从配置文件中读取文件类型
		String fileType = this.getServletContext().getInitParameter("fileType");

		// 设置字符编码
		request.setCharacterEncoding(charSet);

		// 步骤1---创建上传组件---实例化SmartUpload对象
		SmartUpload smartUpload = new SmartUpload("utf-8");
		System.out.println("创建上传组件");
		try {
			// 步骤2---初始化上传组件---调用initialize()方法
			smartUpload.initialize(getServletConfig(), request, response);
			System.out.println("初始化上传组件");

			// 检查2---检查文件大小
			smartUpload.setMaxFileSize(10 * 1024 * 1024);
			System.out.println("检查文件大小");

			// 检查3---检查文件格式
			smartUpload.setAllowedFilesList(fileType);// 允许的文件类型
			System.out.println("检查文件格式");

			// smartUpload.setDeniedFilesList("html");//不允许的文件类型

			// 步骤3---上传文件到服务器的临时内存中---调用upload()方法
			smartUpload.upload();

		} catch (SmartUploadException e1) {
			e1.printStackTrace();
			out.print("<script>alert('文件上传失败');history.back();</script>");
		} catch (SecurityException e) {
			out.print("<script>alert('文件大小不能超过10M，文件类型必须为jpg,gif,png类型');history.back();</script>");
		}
		System.out.println("上传文件到服务器的临时内存中");

		// 验证验证码
		String valCode = smartUpload.getRequest().getParameter("valCode");
		String valCodeSession = (String) session.getAttribute("valCodeInSession");

		if (!valCode.equalsIgnoreCase(valCodeSession)) {
			out.println("<script>alert('验证码输入不正确！，请重新输入');history.back();</script>");
			return;
		}

		// 接收数据
		
		String restnumber = "";
		String restpassword = "";
		String restphoto = "";
		String restname = "";
		String restcardnumber = "";
		String restcardpassword = "";
		int restamount = 0;
		int restaddress = 0;
		try {
			restnumber = smartUpload.getRequest().getParameter("restnumber");
			restpassword = smartUpload.getRequest().getParameter("restpassword");
			restphoto = smartUpload.getRequest().getParameter("photo");
			// 判断photo是否为上传文件
			if ("-1.gif".equals(restphoto)) {
				try {
					// 步骤4---提取上传文件
					SmartFile smartFile = smartUpload.getFiles().getFile(0);
					// 步骤5---准备上传文件的存储路径和文件名---保证文件名唯一
					String serverFilePath = request.getRealPath("/image/photo");
					System.out.println(serverFilePath);
					
					String serverFilename = StringUtil.convertFilename(smartFile.getFileName());
					restphoto = serverFilename;

					// 步骤6---保存上传文件
					smartFile.saveAs(serverFilePath + "/" + serverFilename);
				} catch (SecurityException e) {
					out.print("<script>alert('文件大小不能超过100k，文件类型必须为jpg类型');history.back();</script>");
				}
			}
			
			Random random = new Random();
			
			restname = smartUpload.getRequest().getParameter("restname");
			restcardnumber = smartUpload.getRequest().getParameter("restcardnumber");
			restcardpassword = smartUpload.getRequest().getParameter("restcardpassword");
			restamount = random.nextInt(100);
			restaddress = Integer.parseInt(smartUpload.getRequest().getParameter("restaddress"));
			
			
		} catch (Exception e) {
			out.print("填寫为空，请<a href='rest_register.jsp'>重新输入</a>");
		}

		RestService restService = new RestServiceImpl();

		Restaurant rest = new Restaurant("admin",restname,restnumber,restpassword,restphoto,restcardnumber,restcardpassword,restamount,restaddress,0);

		if (restService.checkRestnumber(restnumber)) {
			if (restService.addRest(rest)) {
				Restaurant newrest = restService.login(restnumber, restpassword);
				session.setAttribute("rest", newrest);

				response.sendRedirect("rest_register_result.jsp");
			}
		} else {
			out.println("<script> alert('用戶名已经存在，請重新注册');history.back();</script>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
