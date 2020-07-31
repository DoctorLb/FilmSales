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
import com.userServer.UserServer;
public class CurrentServlet extends HttpServlet {

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
		HttpSession session =request.getSession();
		String pages = null;
		if(session.getAttribute("Pages")!=null){
			pages = session.getAttribute("Pages").toString();
		}
		String biaoshi ;
		if (request.getParameter("biaoshi")!=null) {
			 biaoshi=request.getParameter("biaoshi");
		}else {
			 biaoshi=null;
		}
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
		String sql;
		String state=null;
		//如果state值为空
		if (request.getParameter("state")==null) {
			if (session.getAttribute("state")==null) {
				sql="select * from film where filmState=0 limit "+(9*page)+",9";
			}else {
				state=session.getAttribute("state").toString();
				int s=Integer.parseInt(state);
				sql="select * from film where filmState="+s+" limit "+(9*page)+",9";
			}	
		}else {
			state =request.getParameter("state");
			if(state.equals("0")){
				page=0;
				sql="select * from film where filmState=0 limit "+(9*page)+",9";
			}else {
				page=0;
				sql="select * from film where filmState=1 limit "+(9*page)+",9";
			}
		}
		ArrayList<Film> currentList =us.getAllCurrent(page,sql);
		//ArrayList<Film> nextList = us.getAllCurrent(page+1,sql);
		session.setAttribute("currentList", currentList);
		//session.setAttribute("nextList", nextList);
		session.setAttribute("Pages", page);
		session.setAttribute("state", state);
		session.setAttribute("sql", sql);
		response.sendRedirect("User/ShowAllFilms.jsp");
	}

}
