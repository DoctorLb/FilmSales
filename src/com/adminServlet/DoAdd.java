package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminServer.AdminServer;
import com.entity.Film;
/**
 * 添加
 * @author Administrator
 *
 */
public class DoAdd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Film film=(Film)request.getSession().getAttribute("film");
		AdminServer as=new AdminServer();
		int row=as.addFilm(film);
		int biaoshi2=0;
		if(row>0){
			biaoshi2=1;
			request.getSession().setAttribute("biaoshi2",biaoshi2 );
			response.sendRedirect("Admin/AddFilm.jsp");
		}else{
			biaoshi2=2;
			request.getSession().setAttribute("biaoshi2",biaoshi2 );
			response.sendRedirect("Admin/AddFilmMsg.jsp");
		}
		out.close();
	}

}
