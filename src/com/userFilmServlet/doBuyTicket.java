package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.FilmShow;
import com.userServer.UserServer;

public class doBuyTicket extends HttpServlet {

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
		if(request.getParameter("filmName")!=null){
			String name = request.getParameter("filmName");
			String time = request.getParameter("filmTime");
			String room = request.getParameter("filmRoom");
			UserServer us = new UserServer();
			ArrayList<FilmShow> list = us.selFilmShowInfo(name, time, room);
			if(list!=null){
				HttpSession session = request.getSession();
				session.setAttribute("list", list);
				response.sendRedirect("User/BuyTicket.jsp");
			}
		}else{
			response.sendRedirect("MyHome.jsp");
		}
	}

}
