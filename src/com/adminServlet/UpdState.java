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
 * 更新状态
 * @author Administrator
 *
 */
public class UpdState extends HttpServlet {
	
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
		String check[]=request.getParameterValues("check1");
		AdminServer as=new AdminServer();
		HttpSession session=request.getSession();
		int filmState=0;
		//ѭ���޸ģ��޸�һ�����ݣ�biaoshiCount+1��
		int biaoshiCount=0;
		//��ʾѡ�˶���޸�
		
		if(check!=null){	
			//�õ�ѡ���޸ĵ�״̬
			String filmStateStr=request.getParameter("xz2");
			if("������ӳ".equals(filmStateStr)){
				filmState=0;
			}else if("δ��ӳ".equals(filmStateStr)){
				filmState=2;
			}else if("������ӳ".equals(filmStateStr)){
				filmState=1;
			}			
			for(int i=0;i<check.length;i++){ 
				int filmId=Integer.parseInt(check[i]); 
				int row=as.updFilmState(filmId, filmState);
				if(row>0){
					biaoshiCount++;
				}
			}
			if(biaoshiCount==check.length){
				session.removeAttribute("list");
				ArrayList<Film> list=as.selAll();
				session.setAttribute("list", list);
				request.getSession().setAttribute("biaoshi3", 1);
				request.setAttribute("noFoundBiaoShi", 1);
				response.sendRedirect("Admin/SelFilm.jsp");
			}else{
				response.sendRedirect("Admin/UpdStateMsg.jsp");
			}
		}else{
			//����������޸ĵ�����Ӱ״̬��biaoshiState�ǵ�Ӱ��״̬
			if(request.getParameter("biaoshiS")!=null){
				filmState=Integer.parseInt(request.getParameter("biaoshiS"));
			}
			int filmId=Integer.parseInt(request.getParameter("filmId"));

			int row=as.updFilmState(filmId, filmState);
			if(row>0){
				session.setAttribute("noFoundBiaoShi", 1);
				session.removeAttribute("list");
				ArrayList<Film> list=as.selAll();
				session.setAttribute("list", list);
				request.getSession().setAttribute("biaoshi3", 1);
				response.sendRedirect("Admin/SelFilm.jsp");
			}else{
				response.sendRedirect("Admin/UpdStateMsg.jsp");
			}
		}
		out.close();
	}

}
