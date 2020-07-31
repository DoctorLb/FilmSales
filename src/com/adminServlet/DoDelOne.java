package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminServer.AdminServer;
/**
 * 删除一个
 * @author Administrator
 *
 */
public class DoDelOne extends HttpServlet {

	
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
		AdminServer as=new AdminServer();
		String filmIdStr=request.getParameter("filmId");
		if(filmIdStr.length()>0){
			int id=Integer.parseInt(request.getParameter("filmId"));
			int row = as.delById(id);
			if(row>0){
				out.print("ɾ���ɹ���");
			}else{
				out.print("ɾ��ʧ�ܣ�");
			}
		}		
		out.close();
	}

}
