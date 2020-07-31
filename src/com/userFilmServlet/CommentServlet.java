package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.Film;
import com.entity.PingJia;
import com.entity.UserInfo;
import com.userServer.UserServer;
public class CommentServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			HttpSession session=request.getSession();
			String commentText="";
			//根据当前日期评论时间
			Date date= new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String commentTime=sdf.format(date);
			//得到电影Id
			String filmId=request.getParameter("filmId");
			//获得提交的评论内容
			if(request.getParameter("commentText")==null&&request.getParameter("biaoshi")==null){
				response.sendRedirect("SelectFilmById?filmId="+filmId);
			}else{
				String str = request.getParameter("commentText");
				String str1 = str.replace("<", "&lt;").replace(">", "&gt;");
				commentText=str1;
				session.removeAttribute("pages");
			}
			//得到评论用户Id
			String userId="";
			UserInfo userInfo=(UserInfo)session.getAttribute("user");
			if (userInfo!=null) {
				userId=userInfo.getUserId();
				//封装成功Pingjia对象
				PingJia comment = new PingJia();
				Film movie = new Film();
				movie.setFilmId(Integer.parseInt(filmId));
				comment.setTime(commentTime);
				comment.setPingJia(commentText);
				comment.setFilmId(movie);
				comment.setUserId(userInfo);
				UserServer us = new UserServer();
				int row=us.submitComment(comment);
				if(row>0){
					response.sendRedirect("SelectFilmById?filmId="+filmId);
				}else{
					response.sendRedirect("SelectFilmById?filmId="+filmId);
				}
			}else {
				response.sendRedirect("User/MyHome.jsp");
				
			}
	}

}
