package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminServer.AdminServer;
/**
 * 更新密码
 * @author Administrator
 *
 */
public class UpdAdminPwd extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String newPwd=request.getParameter("newPwd1");
		String oldPwd=request.getParameter("oldPwd");
		String adminPwd=request.getSession().getAttribute("adminPwd").toString();
		AdminServer as=new AdminServer();
		if(oldPwd.equals(adminPwd)){
			int row=as.updPwd(newPwd);
			if(row>0){
				request.getSession().removeAttribute("adminId");
				response.sendRedirect("Admin/AdminLogin.jsp");
			}else{
				response.sendRedirect("Admin/UpdAdminPwd.jsp");
			}
		}else{
			response.sendRedirect("Admin/UpdAdminPwd.jsp");
		}
		out.close();
	}

}
