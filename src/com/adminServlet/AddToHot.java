package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
/**
 * 添加热映
 * @author Administrator
 *
 */
public class AddToHot extends HttpServlet {

	
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
		// 获取数据
		String[] hotFilm=request.getParameterValues("checkHot");
		AdminServer as=new AdminServer();
		int row=0;
		int id=1;
		HttpSession session=request.getSession();
		// 批量操作
		for(int i=0;i<hotFilm.length;i++){
			as.updHotFilm(Integer.parseInt(hotFilm[i]),id);
			id++;
			row++;
		}
		// 设置session
		session.setAttribute("row", row);
		session.setAttribute("hot",1 );
		// 页面跳转
		response.sendRedirect("Admin/UpdHotFilm.jsp");
		out.close();
	}

}
