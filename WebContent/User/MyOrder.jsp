<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.Ticket"%>
<%@page import="com.entity.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>我的订单</title>
    
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
  		if(session.getAttribute("user")!=null){
  			 session.setAttribute("userInfobiaoshi",7);
  			UserInfo user = (UserInfo)session.getAttribute("user");
  			UserServer us = new UserServer();
  			ArrayList<Ticket> list = us.sleectMyOrder(user.getUserId());
  			request.setAttribute("list",list);
  	%>
     	<table style="position:absolute;top:210px;" width="560" >
    		<tr>
    			<td colspan="8" align="center" bgcolor="#EED5D2" height="30">我的订单</td>
    		</tr>
    		<tr>
    			<td>订单号</td>
    			<td>账号</td>
    			<td>电影名</td>
    			<td>放映厅</td>
    			<td>座号</td>
    			<td>价格</td>
    			<td>放映时间</td>
    			<td>订购时间</td>
    		</tr>
    		<c:forEach var="tk" items="${requestScope.list}" varStatus="status">  		
    		<tr <c:if test="${status.index%2==0}">style="background-color:#EED5D2;"</c:if>>
    			<td>${tk.ticketId}</td>
    			<td>${tk.userId.userId}</td>
    			<td>${tk.showId.filmId.filmName}</td>
    			<td>${tk.showId.roomId.roomId.roomId}</td>
    			<td>${tk.seatNum}</td>
    			<td>${tk.price}</td>
    			<td>${tk.showId.showDate}</td>
    			<td>${tk.orderTime}</td>
    		</tr>
    		</c:forEach>	
    	</table> 	
  	<%	
  		}else{
  			response.sendRedirect("MyHome.jsp");
  		}
  	%>
  </body>
</html>
