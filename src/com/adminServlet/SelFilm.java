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
import com.entity.Film;
/**
 * 通过名字查找电影
 * @author Administrator
 *
 */
public class SelFilm extends HttpServlet {


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
		String xz=request.getParameter("xz");
		String txtFilm=request.getParameter("txtFilm");
		HttpSession session = request.getSession();	
		AdminServer as=new AdminServer();
		ArrayList<Film> list=new ArrayList<Film>();
		if("����Ӱ��".equals(xz)){
			if(txtFilm.length()>0){
				list=as.selByName(txtFilm);
				int biaoshi3=1;
				session.setAttribute("biaoshi3",biaoshi3);
				session.setAttribute("list",list);	
				response.sendRedirect("Admin/SelFilm.jsp");
				session.setAttribute("noFoundBiaoShi", 1);
			}else{
				//request.getSession().setAttribute("noFoundBiaoShi", 1);
				response.sendRedirect("Admin/SelFilm.jsp");
			}
		}else if("��ѯ����".equals(xz)){
			int biaoshi3=1;
			//noFoundBiaoShi����ʱ��ʾ�鵽��
			request.getSession().setAttribute("noFoundBiaoShi", 1);
			session.setAttribute("biaoshi3",biaoshi3);
			//show��ֵȷ��������ҳʱ��ʾ�Ǹ�ҳ��
			session.setAttribute("show",3);
			list=as.selAll();
			session.setAttribute("list",list);
			response.sendRedirect("Admin/SelFilm.jsp");
		}
		out.close();
	}

}
