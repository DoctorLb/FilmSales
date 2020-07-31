package com.userServlet;

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

public class UserFenYe extends HttpServlet {

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
		HttpSession session = request.getSession(); 
		//得到userId
		UserInfo user = (UserInfo)session.getAttribute("user");
		String userId = user.getUserId();
		String biaoshi=request.getParameter("biaoshi");
		String pages="";
		int p;
		//如果biaoshi 不为空 
		if(biaoshi!=null){
			if(session.getAttribute("page")!=null){
				pages=session.getAttribute("page").toString();
			 	p=Integer.parseInt(pages);
				if(biaoshi.equals("shang")){
					p--;	
				}else if(biaoshi.equals("xia")) {
					p++;
				}
			}else{
				p=0;		
			}
		
		}else{
			p=0;
		}
		session.setAttribute("page",p);
		UserServer us = new UserServer();
		ArrayList list = us.getAllPingJia(userId,p);
		ArrayList list2 = us.getAllPingJia(userId,p+1);
		request.getSession().setAttribute("list", list);
		response.sendRedirect("User/UserInfo.jsp");	
	}

}
