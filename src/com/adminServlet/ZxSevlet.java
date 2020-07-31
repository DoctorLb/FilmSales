package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 注销
 * @author Administrator
 *
 */
public class ZxSevlet extends HttpServlet {

	
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
		session.removeAttribute("biaoshi");
		session.removeAttribute("adminId");
		session.removeAttribute("adminPwd");
		response.sendRedirect("Admin/AdminHome.jsp");
		PrintWriter out = response.getWriter();
		out.close();
	}

}
