package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.java2d.pipe.SpanShapeRenderer.Simple;

import com.entity.Film;
import com.entity.FilmShow;
import com.filmDao.DBHelp;
import com.userServer.UserServer;

public class QuickBuyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println("laile");
		UserServer us = new UserServer();
		String date[]=us.getDate();
		String today =date[0];
		String tomorrow =date[1];
		String houtian=date[2];
		String week=date[3];
		HttpSession session = request.getSession();
		session.setAttribute("today", today);
		session.setAttribute("tomorrow", tomorrow);
		session.setAttribute("houtian", houtian);
		session.setAttribute("week", week);
		String dates="";
		String selectName="";
		//
		if(request.getParameter("date")==null){
			if(request.getParameter("filmName")==null){
				dates=date[0];
			}else{
				//此处session不可能为空 最好加上判断
				if(session.getAttribute("dates").toString()!=null){
					dates=session.getAttribute("dates").toString();
				}else{
					response.sendRedirect("ERROR.jsp");
				}	
			}		
		}else{
			dates=request.getParameter("date");
		}
		
		ArrayList<FilmShow> showList;
		ArrayList<FilmShow> allShowList = us.getFilmByDate(dates);
		session.setAttribute("totalShow", allShowList.size());
		if(request.getParameter("showall")!=null){
			//得到所选日期放映的所有电影  默认是当天
			showList=us.getFilmByDate(dates);		
		}else{
			showList = us.getTopTenByDate(dates);
		}
		//System.out.println(showList.size());
		session.setAttribute("showList", showList);
		//得到该天放映场次表的第一部电影
		if(showList.size()>0){	
			//System.out.println("今天有电影放映");
			//得到电影名为filmName 日期为Dates的电影放影场次
			if(request.getParameter("filmName")==null){
				//如果该天有电影放映 并且 不是点击选择的电影名字进来的  把已选择的电影名称设为该天的第一步电影
				//System.out.println("有电影，没选电影，默认第一部电影");
				selectName=showList.get(0).getFilmId().getFilmName();	
			//如果是点击电影名字过来的 则把传过来的电影名字 付给当前已选择的电影
			}else {
				//System.out.println("选了电影");
				selectName=request.getParameter("filmName");
				//System.out.println(selectName+"*****************8");
				//处理乱码 
				selectName = new String(selectName.getBytes("ISO-8859-1"),"utf-8");
				session.setAttribute("selectName",selectName);
			}
			session.setAttribute("selectName",selectName);
			
			ArrayList<FilmShow> filmDateShow = us.getFilmShowByNameDate(selectName, dates);
			session.setAttribute("filmDateShow", filmDateShow);
		}else {
			session.setAttribute("selectName", "今天暂无电影放映，无法选择");
			//session.setAttribute("filmDateShow", null);
			session.removeAttribute("filmDateShow");
		}
		//查询所选电影的详细信息
		DBHelp db = new DBHelp();
		String sql="select * from film where filmName='"+selectName+"'";
		ArrayList<Film> films = db.executeQuery(sql, null);
		if(films.size()>0){
			Film showfilm = films.get(0);
			session.setAttribute("showfilm", showfilm);
		}else{
			session.setAttribute("showfilm", null);
		}
		session.setAttribute("listSize", showList.size());
		//多次访问 本页开始的时候用到
		session.setAttribute("dates", dates);
		response.sendRedirect("User/quickBuy.jsp?fromServlet=1");
		
		
	}
	
}
