package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adminServer.AdminServer;
/**
 * 删除
 * @author Administrator
 *
 */
public class DelCheck extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String[] checkStr=request.getParameterValues("check2");
		AdminServer as=new AdminServer();
		if(checkStr.length>0){
			//System.out.println(checkStr[0]);
			int biaoshi=0;
			for(int i=0;i<checkStr.length;i++){
				int checkInt=Integer.parseInt(checkStr[i]);
				int row=as.delById(checkInt);
				if(row>0){
					biaoshi++;
				}
			}
			if(biaoshi==checkStr.length){
				out.print("ɾ���ɹ�!");
			}
		}else{
			out.print("��ѡ��Ҫɾ�����");
		}
		out.close();
	}
}
