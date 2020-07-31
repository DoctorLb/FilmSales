package com.userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfo;

import com.userServer.UserServer;

public class UserRegServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//new 方法和空的用户
		UserServer us = new UserServer();
		UserInfo user = new UserInfo();	
		//把注册的数据放到对应的位置
		String userId= request.getParameter("userId");
		user.setUserId(request.getParameter("userId"));
		user.setUserName(request.getParameter("userName"));
		user.setUserPwd(request.getParameter("userPwd"));
		user.setUserSex(request.getParameter("userSex"));
		user.setUserEmail(request.getParameter("userEmail"));
		user.setUserTelephone(request.getParameter("userTelephone"));
		user.setUserIdCard(request.getParameter("userIdCard"));
		//注册的方法
		/*HttpSession session = request.getSession();
		session.setAttribute("userId", userId);*/
		int row = us.userReg(user);
		if(row>0){
			//注册成功跳转显示页面
			response.sendRedirect("User/MyHome.jsp");
		}else{
			//注册失败跳转注册页面
			response.sendRedirect("User/UserReg.jsp");
		}
	}
}
