<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.adminServer.AdminServer"%>
<%@page import="com.entity.FilmShow"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'showRoomMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <% 
    Object denglu=session.getAttribute("denglu");
  	if(denglu==null){
  		response.sendRedirect("faileLogin.jsp");
  	}else{
  		AdminServer as=new AdminServer();
  		int roomId=Integer.parseInt(request.getParameter("roomId")); 
  		ArrayList<FilmShow> list=as.selFilmRoom(roomId);
  		%>
  		<table cellpadding="0" cellspacing="0" border="1">
  			<tr>
  				<td colspan="4"><%=roomId %>号厅的信息如下：</td>
  			</tr>
  			<tr>
  				<td>日期</td>
  				<td>时段</td>
  				<td>放映影片</td>
  				<td>时长</td>
  			</tr>
  			<% 
  			for(int i=0;i<list.size();i++){
  			
  				%>
  				<tr>
  					<td><%=list.get(i).getShowDate() %></td>
  					<td><%=list.get(i).getShowTime() %></td>
  					<td><%=list.get(i).getFilmId().getFilmName()%></td>
  					<td><%=list.get(i).getFilmId().getFilmLong() %></td>
  				</tr>
  				<%
  			}
  			%>
  		</table>
  		<%
  	}
    %>
  </body>
</html>
