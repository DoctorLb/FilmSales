package com.userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class ChuLi extends HttpServlet {
	String num;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserServer us = new UserServer();
		//得到用户名
		String userId = request.getParameter("userId");
		int i = us.getUserId(userId);
		if(userId==""){
			out.print("不可空");
		}else if(i==1){
			out.print("已存在");
			}else if(userId!=""){
				out.write("<font color='green'>√</font>");
			}	
		
	}
}
