package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.filmDao.DBHelp;
import com.userServer.UserServer;

public class RightAjaxServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(request.getParameter("filmName")!=null){
			String name1 = request.getParameter("filmName");
			String name = new String(name1.getBytes("iso-8859-1"),"UTF-8"); //解决中文乱码
			//System.out.println("name="+name);
			UserServer us = new UserServer();
			String filmName = "";
			ArrayList<String> Timelist = us.selFilmTime(name);
			if(Timelist.size()<1){
				String name2 = new String(name1.getBytes("iso-8859-1"),"GBK"); //解决中文乱码
				filmName = name2;
			}else{
				filmName = name;
			}
			if(request.getParameter("filmTime")==null){
				String str = "";
				ArrayList<String> Timelist1 = us.selFilmTime(filmName);
				for(int i=0;i<Timelist1.size();i++){
					if(i==(Timelist1.size()-1)){
						str = str + Timelist1.get(i);
					}else{
						str = str + Timelist1.get(i)+"/";
					}
				}
				out.write(str);
			}else{
				String str = "";
				String filmTime = request.getParameter("filmTime");
				//System.out.println("时间"+filmTime);
				//System.out.println("名字"+filmName);
				ArrayList<Object> list = us.selFilmRoom(filmName, filmTime);
				for(int i=0;i<list.size();i++){
					String sql = "select * from room where roomId='"+list.get(i)+"'";
					DBHelp db = new DBHelp();
					try {
						ResultSet rs = db.getConn().prepareStatement(sql).executeQuery();
						if(rs.next()){
							if(i==(list.size()-1)){
								str = str + list.get(i)+"号厅（共"+(rs.getInt(3)*rs.getInt(2))+"座）";
							}else{
								str = str + list.get(i)+"号厅（共"+(rs.getInt(3)*rs.getInt(2))+"座）"+"/";
							}
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				out.write(str);
			}
		}else{
			response.sendRedirect("MyHome.jsp");
		}
	}

}
