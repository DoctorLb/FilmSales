package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
import com.entity.Film;

public class DoDelAll extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		AdminServer as=new AdminServer();
		HttpSession session=request.getSession();
		int row=as.delFilm();
		if(row>0){
			session.removeAttribute("lsit");
			ArrayList<Film> list=as.selAll();
			session.setAttribute("list", list);
			response.sendRedirect("Admin/ShowAll.jsp");
		}
		
	}

}
