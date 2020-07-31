package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class DelTicket extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(request.getParameter("orderId")!=null){
			Date date = new Date(); //得到当前时间
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH::mm:ss");
	    	sdf.format(date);
	    	String str1 = request.getParameter("showtime"); //获得放映时间
	    	//System.out.println("str1="+str1);
	    	String[] str2 = str1.split("-");
	    	int[] num = new int[str2.length];
	    	for(int i=0;i<str2.length-1;i++){
	    		num[i]=Integer.parseInt(str2[i]);
	    	}
	    	String[] str3 = str2[3].split(":");
	    	int[] num1 = new int[3];
	    	for(int i=0;i<str3.length;i++){
	    		num1[i]=Integer.parseInt(str3[i]);
	    	}
	    	//date2强转成日期类型，表示放映时间前一小时
	    	Date date2 = new Date(num[0]-1900,num[1],num[2],num1[0]-1,num1[1],num1[2]);
	    	sdf.format(date2);
	    	if(date2.before(date)){
	    		UserServer us = new UserServer();
				String ticketId = request.getParameter("orderId");
				double money = Double.parseDouble(request.getParameter("money"));
				String userId = request.getParameter("userId");
				int row = us.delTicket(ticketId,money,userId);
				if(row>0){
					session.setAttribute("yn", "y");
					response.sendRedirect("User/UserInfo.jsp"); //表示退票成功
				}else{
					session.setAttribute("yn", "n");
					response.sendRedirect("User/UserInfo.jsp"); //表示退票失败
				}
	    	}else{
	    		session.setAttribute("yn", "yn");
	    		response.sendRedirect("User/UserInfo.jsp"); //表示超过规定时间不能退票
	    	}
		}else{
			response.sendRedirect("User/MyHome.jsp");
		}
	}


}
