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
import com.userServer.UserServer;
public class SelectFilmById extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		HttpSession session =request.getSession();
		//
		session.removeAttribute("guanzhu");
		//判断页数
		String pages = null;
		if(session.getAttribute("pages")!=null){
			pages=session.getAttribute("pages").toString();
		}
		String biaoshi=request.getParameter("biaoshi");
		UserServer us = new UserServer();
		int page;
		if(pages==null){
			page=0;
		}else {
			page=Integer.parseInt(pages);
		}
		if(biaoshi!=null){
			if(biaoshi.equals("shang")){
				page--;
			}else if(biaoshi.equals("xia")) {
				page++;
			}
		}
		
		//得到电影Id
		String filmId;
		if (request.getParameter("filmId")!=null) {
			filmId=request.getParameter("filmId");
		}else {
			filmId=session.getAttribute("filmId").toString();
		}
		//System.out.println(filmId);
		if(filmId!=null){
			int id=Integer.parseInt(filmId);
			UserServer as =new UserServer();
			ArrayList<Film> movieList = as.getMovieById(id);
			//movieList.get(0) 即为编号为id的电影
			Film film = movieList.get(0);
			//根据电影Id查询到该电影近期的所有放映场次
			ArrayList<FilmShow> filmShows=as.getFilmShowById(id);
			//设置sql语句
			String sql ="select id,userId,pingJia,time,pingjia.filmId from pingjia inner join film on " +
					"film.filmId='"+filmId+"' and film.filmId=pingjia.filmId order by time desc limit "+(page*4)+",4";
			//根据movieId得到与该电影有关的所有评论
			ArrayList<PingJia> commentList =as.getCommentByPage(id,page,sql);
			//把电影集合、当页评论集合、下页评论集合放入session 
			session.setAttribute("page", page);
			session.setAttribute("film", film);
			session.setAttribute("commentList", commentList);
			//把电影场次放入session
			session.setAttribute("filmShow", filmShows);
			response.sendRedirect("User/comment.jsp?filmId="+filmId);
		}
		
	}

}
