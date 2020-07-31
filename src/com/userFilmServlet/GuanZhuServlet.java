package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Film;
import com.entity.FilmShow;
import com.entity.PingJia;
import com.entity.UserInfo;
import com.userServer.UserServer;

public class GuanZhuServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session =request.getSession();
		String filmId=request.getParameter("filmId");
		UserServer us = new UserServer();
		int id=0;
		if (filmId!=null) {
			id=Integer.parseInt(filmId);
		}
		UserInfo user=(UserInfo)session.getAttribute("user");
		String userId="";
		if (user!=null) {
			userId=user.getUserId();
			session.setAttribute("pages",0);
			if (us.isAttention(id, userId)) {
				ArrayList<Film> movieList = us.getMovieById(id);
				//movieList.get(0) 即为编号为id的电影
				Film film = movieList.get(0);
				//out.write("亲，你已经关注过了！"+"/"+film.getFilmScore());
				session.setAttribute("guanzhu", "亲，你已经关注过了！");
				session.setAttribute("filmScore",film.getFilmScore());
				//System.out.println("以关注过");
			}else {
				int row=us.addAttention(id);
				int row1=us.insertGuanZhu(id, userId);
				ArrayList<Film> movieList = us.getMovieById(id);
				//movieList.get(0) 即为编号为id的电影
				Film film = movieList.get(0);
				session.setAttribute("film", film);
				//out.write("亲，你已经关注成功！"+"/"+film.getFilmScore());
				session.setAttribute("guanzhu", "亲，你已经关注成功！");
			}	
		
			
		}else {
			
			//System.out.println("尚未登录");
			session.setAttribute("guanzhu", "尚未登录");

		}
		response.sendRedirect("User/comment.jsp");
		
	}

}
