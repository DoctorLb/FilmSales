package com.adminServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.adminServer.AdminServer;
import com.entity.FilmShow;
/**
 * 添加上映列表
 * @author Administrator
 *
 */
public class addToPlayList extends HttpServlet {


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
		HttpSession session=request.getSession();
		// 获取数据
		Object objFilmDate=session.getAttribute("txtDate");
		Object objFilmTime=session.getAttribute("txtTime");
		Object objRoomId=session.getAttribute("roomId");
		String filmPriceStr=request.getParameter("filmPrice");
		String filmIdStr=request.getParameter("txtFilmId");
		if(objFilmDate!=null){
			String showDate=objFilmDate.toString();
			String showTime=objFilmTime.toString();
			int roomId=Integer.parseInt(objRoomId.toString());
			double filmPrice=Double.parseDouble((filmPriceStr));
			int filmId=Integer.parseInt(filmIdStr);
			FilmShow fs=new FilmShow();
			fs.getFilmId().setFilmId(filmId);
			fs.getRoomId().getRoomId().setRoomId(roomId);
			fs.setShowDate(showDate);
			fs.setShowTime(showTime);
			fs.setFilmPrice(filmPrice);
			AdminServer as=new AdminServer();
			int row=as.addToPlayList(fs);
			if(row>0){	
				as.updFilmState(filmId, 0);
				session.setAttribute("UpdPlayList", 1);
				response.sendRedirect("Admin/showAddToListMessage.jsp");
			}else{
				session.setAttribute("UpdPlayList", 2);
				response.sendRedirect("Admin/showAddToListMessage.jsp");
			}
		}else{
			session.setAttribute("UpdPlayList", 3);
			response.sendRedirect("Admin/showAddToListMessage.jsp");
		}
		out.close();
	}

}
