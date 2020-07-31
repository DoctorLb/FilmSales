package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
import com.entity.Admin;
/**
 * 登录
 * @author Administrator
 *
 */
public class LoginServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		response.setContentType("text/html");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdminServer as=new AdminServer();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String adminId=request.getParameter("adminId");
		String adminPwd=request.getParameter("adminPwd");
		if(adminId!=null){
			Admin ad=as.adminLogin(adminId);
			if(ad!=null){
				if(ad.getAdminPwd().equals(adminPwd)){
					HttpSession session=request.getSession();
					session.setAttribute("adminId",ad.getAdminId());
					//��½�ɹ�����session���һ����ʶdenglu
					session.setAttribute("denglu",1);
					session.setAttribute("adminPwd", adminPwd);
					response.sendRedirect("Admin/AdminLogin.jsp");
				}else{
					response.sendRedirect("Admin/AdminMsg.jsp");
				}
			}else{
				response.sendRedirect("Admin/AdminMsg.jsp");
			}
		}
		out.close();
	}

}
