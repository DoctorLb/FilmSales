package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class FuKuan extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(request.getParameter("biaoshi")!=null){
			UserServer us = new UserServer();
			/*String userId = request.getParameter("id");
			String userPwd = request.getParameter("pwd");*/
			String showId = session.getAttribute("showId").toString();
			int id = Integer.parseInt(showId);
			String seatNum = request.getParameter("seatNum");
			String price = session.getAttribute("price").toString();
			//System.out.println("seat"+seatNum);
			ArrayList list = (ArrayList)session.getAttribute("seatNum2");
			String[] num = new String[list.size()];
			for(int i=0;i<list.size();i++){
				num[i] = (list.get(i)).toString();
			}
			UserInfo user = (UserInfo)session.getAttribute("user");
			int row = us.FuKuan(user.getUserId(), showId, num, price); //¹ºÆ±²¢¸¶¿î
			if(row>0){
				response.sendRedirect("User/ChuLi.jsp?biaoji=0");
			}else{
				response.sendRedirect("User/ChuLi.jsp?biaoji=1");
			}
			}else{
				response.sendRedirect("User/ChuLi.jsp?biaoji=1");
			}
		}
	}

