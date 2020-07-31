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
import com.entity.Money;
/**
 * 显示收益
 * @author Administrator
 *
 */
public class ShowMoney extends HttpServlet {

	
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
		String chooseTxt=request.getParameter("chooseTxt");
		String txtFilmName=request.getParameter("txtFilmName");
		HttpSession session=request.getSession();
		AdminServer as=new AdminServer();
		if(chooseTxt.equals("��Ӱ��")){
			if(txtFilmName.length()>0){
				double totalMoney=as.selMoneyByFilmName(txtFilmName);				
				if(totalMoney>0){
					session.setAttribute("moneyBS", 1);
					session.setAttribute("totalMoney", totalMoney);
					session.setAttribute("filmName",txtFilmName );
					response.sendRedirect("Admin/SelTotalMoney.jsp");
				}else{
					session.setAttribute("moneyBS", 4);
					response.sendRedirect("Admin/SelTotalMoney.jsp");
				}
			}else{
				session.setAttribute("moneyBS",3);
				response.sendRedirect("Admin/SelTotalMoney.jsp");
			}
		}else if(chooseTxt.equals("����")){
			ArrayList<Money> list = as.selAllMoney();
			session.setAttribute("moneyBS", 2);
			session.setAttribute("allMoney", list);
			response.sendRedirect("Admin/SelTotalMoney.jsp");
		}
		out.close();
	}

}
