<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.userServer.UserServer"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>取消订单</title>
    
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
    	request.setCharacterEncoding("UTF-8");
		if(request.getParameter("orderId")!=null){
			Date date = new Date();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	sdf.format(date);
	    	Date date2 = new Date(2013-1900,1,26,0-1,23,32);
	    	sdf.format(date2);
	    	UserServer us = new UserServer();
	    	ArrayList list = us.selOrder(request.getParameter("orderId"),request.getParameter("userId"),request.getParameter("userPwd"));
	    	if(list!=null&&list.size()>0){
	%>
	 <table border="1">
	 	<tr>
	 		<td>订单号</td>
	 		<td>电影名</td>
	 		<td>上映时间</td>
	 		<td>放映厅号</td>
	 		<td>座位号</td>
	 		<td>价格</td>
	 	</tr>
	 	<tr>
	 		<td><%=list.get(0) %></td>
	 		<td><%=list.get(3) %></td>
	 		<td><%=list.get(4)+" "+list.get(5) %></td>
	 		<td><%=list.get(6) %>号厅</td>
	 		<td><%=list.get(7) %>号座</td>
	 		<td><%=list.get(8) %>元</td>
	 	</tr>
	 	<tr>
	 		<td colspan="6">
	 			<a href="../DelTicket?orderId=<%=list.get(0) %>&showtime=<%=list.get(4)+"-"+list.get(5) %>&money=<%=list.get(8)%>&userId=<%=request.getParameter("userId")%>">确认取消</a>
	 		</td>
	 	</tr>
	 </table>
	 <%   	
			}else{
	%>
			<a><font color="red">无此订单,可能您的口令输入错误!</font></a>	
	<%			
			}
	    }else{
			response.sendRedirect("User/MyHome.jsp");
		}
    %>
  </body>
</html>
