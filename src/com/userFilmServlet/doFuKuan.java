package com.userFilmServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.UserInfo;
import com.userServer.UserServer;

public class doFuKuan extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

response.setContentType("text/html");
doPost(request, response);
}


public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	HttpSession session = request.getSession();	
response.setContentType("text/html");
PrintWriter out = response.getWriter();
if(request.getParameter("id")!=null&&request.getParameter("pwd")!=null){
	UserServer us = new UserServer();
	double zj = Double.parseDouble(request.getParameter("hidPrice")) ; //总价
	UserInfo user = (UserInfo)session.getAttribute("user");
	//System.out.println(user.getUserId());
	String userId = request.getParameter("id");
	String userPwd = request.getParameter("pwd");
	UserInfo users = us.selectMe(user.getUserId());
	UserInfo user1 = us.userLogin(userId, userPwd);
	//System.out.println(user1.getUserMoney());
	if(user1!=null){
	if(users.getUserMoney()>zj){  //判断余额是否够
		int num = Integer.parseInt(request.getParameter("hidNum")) ;
		String showId = request.getParameter("showId");
		int id = Integer.parseInt(showId);
		String seatNum = request.getParameter("seatNum");
		String price = request.getParameter("price");
		String[] num1 = seatNum.split("/");
			ArrayList list1 = new ArrayList();
			for(int i=0;i<num1.length;i++){
				int seat = Integer.parseInt(num1[i]); 
				if(us.selSeatNum(id, seat)){ //表示该电影票已被订购
					list1.add(seat);
				}
			}
			if(list1.size()>0){  //有票被订购
				session.setAttribute("seatNum1", list1); //被其他人订购的票
				session.setAttribute("seatNum2", num1); //用户定的所有的票
				//session.setAttribute("seatNum3", list2); //用户可以定的票
				session.setAttribute("showId", showId);//放映的Id
				session.setAttribute("seatNum", seatNum);//座位号
				session.setAttribute("zj", zj);//总价
				session.setAttribute("price", price);//单价
				response.sendRedirect("User/Warn.jsp?");
			}else{
				String str[] = new String[num1.length];
				for(int i=0;i<num1.length;i++){
					str[i] = num1[i];
				}
				UserInfo user2 = (UserInfo)session.getAttribute("user");
				//System.out.println(num1.length);
				int row = us.FuKuan(user2.getUserId(), showId, str, price); //购票并付款
				if(row>0){
					response.sendRedirect("User/ChuLi.jsp?biaoji=0");
				}else{
					response.sendRedirect("User/ChuLi.jsp?biaoji=1");
				}
			}		
	}else{ //余额不足
		//System.out.println("余额不足");
		response.sendRedirect("User/MyHome.jsp");//跳转到充值页面
	}
	}else{
		//System.out.println("账号或密码戳无");
		response.sendRedirect("User/ChuLi.jsp?biaoji=1");
	}	
}else{
	//System.out.println("id,pwd");
	response.sendRedirect("User/MyHome.jsp");
}
}
}
