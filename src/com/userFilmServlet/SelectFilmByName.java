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
import com.entity.PingJia;
import com.userServer.UserServer;
public class SelectFilmByName extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//得到电影名字
		String movieName=request.getParameter("filmName");
		System.out.print(movieName);
		if(movieName!=null){
			UserServer as =new UserServer();
			ArrayList<Film> movieList = as.getMoviesByName(movieName);
			HttpSession session =request.getSession();
			session.setAttribute("movieList", movieList);
			if(movieList.size()==1){
				response.sendRedirect("SelectFilmById?filmId="+movieList.get(0).getFilmId());
				//System.out.println(movieList.get(0).getFilmId());
			}else if(movieList.size()>1){
				response.sendRedirect("User/select.jsp");
			}else{
				response.sendRedirect("User/MyHome.jsp");
			}
			
		}
		
	}

}
