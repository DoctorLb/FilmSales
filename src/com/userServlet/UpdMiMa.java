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

public class UpdMiMa extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		UserServer us = new UserServer();
		UserInfo user = new UserInfo();	
		String userPwd = request.getParameter("userPwd");
		//输入的旧密码
		String oldPwd=request.getParameter("oldPwd");
		UserInfo users = (UserInfo)session.getAttribute("user");
		//System.out.println("========"+users.getUserId());
		int row = us.updMiMa(users.getUserId(), userPwd);
		if(row>0){
			out.write("<font color='green'>修改成功</font>");
		}else{
			out.write("<font color='red'>原始密码错误,修改失败</font>");
		}
	}

}
