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

public class UserLogin extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(request.getParameter("userId")!=null&&request.getParameter("userPwd")!=null){
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			UserServer us = new UserServer();
			UserInfo user = new UserInfo();
			user = us.userLogin(userId, userPwd);
			if(user!=null){
				session.setAttribute("user", user);
				response.sendRedirect("User/MyHome.jsp");
			}else{
				response.sendRedirect("User/MyHome.jsp?biaoji=1");
			}
		}else{
			response.sendRedirect("User/MyHome.jsp");
		}
	}

}
