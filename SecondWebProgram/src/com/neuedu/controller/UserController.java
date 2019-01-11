package com.neuedu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.io.File;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import com.neuedu.entity.User;
import com.neuedu.service.UserService;

@Controller
public class UserController {

	@Resource
	private UserService userService;

	@RequestMapping(value = "/login")
	public String login(String usernumber, String userpassword, HttpSession session) throws IOException {
		User user = new User();
		user.setUsernumber(usernumber);
		user.setUserpassword(userpassword);
		User user1 = userService.login(user);
		if (user1 != null) {
			System.out.println("µÇÂ¼³É¹¦");
			System.out.println(user1);
			session.setAttribute("user", user1);
			return "user_frame";
		} else {
			System.out.println("µÇÂ¼Ê§°Ü");
			return "user_login";
		}
	}


}
