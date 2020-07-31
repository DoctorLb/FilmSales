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
import com.entity.UserInfo;
/**
 * 查询用户
 * @author Administrator
 *
 */
public class SelUserServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		Object objPage1 = session.getAttribute("objPage");
		Object objBiaoShi1 =request.getParameter("objBiaoShi");
		int pages=Integer.parseInt(objPage1.toString());
		String objBiaoShi=objBiaoShi1.toString();
		AdminServer as=new AdminServer();
		if(objBiaoShi.equals("s")){
			pages--;
		}else if(objBiaoShi.equals("x")){
			pages++;
		}
		session.setAttribute("objPage", pages);
		ArrayList<UserInfo> userList=as.selAllUser(pages);
		session.setAttribute("userList", userList);
		response.sendRedirect("Admin/SelUser.jsp");
	}

}
