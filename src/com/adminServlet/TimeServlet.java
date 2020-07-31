package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
import com.entity.FilmShow;

public class TimeServlet extends HttpServlet {

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
		String txtDate=request.getParameter("txtDate");
		//得到选择的时间
		String txtTime=request.getParameter("txtTime");	
		if("::00".equals(txtTime)){
			out.print("请输入放映时间");
		}else{
			//System.out.println(txtTime);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			//String txtDate1=sdf.format(txtDate);
			AdminServer as=new AdminServer();
			int roomId=Integer.parseInt(request.getParameter("roomId")); 
			ArrayList<FilmShow> list=as.selFilmRoom(roomId);
			//拿到日期中的年、月、日放在dateStr1数组中
			String[] dateStr1=txtDate.split("-");
			//拿到时间中的时、分、秒放在timeStr1数组中
			String[] timeStr1=txtTime.split(":");
			//定义2个int型数组存放时间
			int[] dateInt1=new int[3];
			int[] timeInt1=new int[3];
			for(int i=0;i<3;i++){
				dateInt1[i]=Integer.parseInt(dateStr1[i]);
				timeInt1[i]=Integer.parseInt(timeStr1[i]);
			}
			//拿到用户选择的时间
			Date filmDateTime1=new Date(dateInt1[0]-1900,dateInt1[1]-1,dateInt1[2],timeInt1[0],timeInt1[1],timeInt1[2]);
			//循环拿到对应放映厅中电影的时间放在dateStr2,timeStr2中
			int biaoshi=0;
			for(int i=0;i<list.size();i++){
				//循环拿到放映厅中的电影放映日期、时间、时长
				String[] dateStr2=list.get(i).getShowDate().split("-");
				String[] timeStr2=list.get(i).getShowTime().split(":");
				//半小时换场时间
				int filmLong=list.get(i).getFilmId().getFilmLong()+30;
				int[] dateInt2=new int[3];
				int[] timeInt2=new int[3];
				for(int j=0;j<3;j++){
					dateInt2[j]=Integer.parseInt(dateStr2[j]);
					timeInt2[j]=Integer.parseInt(timeStr2[j]);
				}
				//将第i个电影的日期加上电影时长得到电影放映结束日期
				Date filmDateTime2=new Date(dateInt2[0]-1900, dateInt2[1]-1, dateInt2[2], timeInt2[0], timeInt2[1]+filmLong, timeInt2[2]);				
				if(filmDateTime1.after(filmDateTime2)){
					biaoshi++;
				}
			}
			if(biaoshi==list.size()){
				out.print("该时间断没有电影上映");
				HttpSession session=request.getSession();
				session.setAttribute("txtDate",txtDate );
				session.setAttribute("txtTime",txtTime );
				session.setAttribute("roomId", roomId);
			}else{
				out.print("该时间段有电影上映");
			}
		}
		out.close();
	}

}
