<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.adminServer.AdminServer"%>
<%@page import="com.entity.Film"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'UpdHotFilm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		tr{
			height: 24px;
			font-size: 14;
		}
		td{
			width: 130px;
			font-size: 14;
		}
	</style>

  </head>
  
  <body style="background-color: #d2d2d2">
    <% 
   	Object denglu=session.getAttribute("denglu");
  	if(denglu==null){
  		response.sendRedirect("faileLogin.jsp");
  	}else{
  		Object objHot=session.getAttribute("hot");
  		if(objHot==null){
	  		AdminServer as=new AdminServer();
	  		ArrayList<Film> list=as.selShowing();
	  		%>
	  		<form action="../AddToHot" method="post">
		  		<table  border="1" cellpadding="0" cellspacing="0" style="position: absolute;left:120px;top:20px;">
		  			<tr>
		  				<td>编号</td>
		  				<td>电影名</td>
		  				<td>状态</td>
		  				<td>操作</td>
		  			</tr>
		  			<% 
		  			for(int i=0;i<list.size();i++){
		  				String state="";
						int filmState=list.get(i).getFilmState();
						if(filmState==2){
							state="未上映";
						}else if(filmState==0){
							state="正在上映";
						}else if(filmState==1){
							state="即将上映";
						}
		  				%>
		  				<tr>
		  					<td><%=list.get(i).getFilmId() %></td>
			  				<td><%=list.get(i).getFilmName() %></td>
			  				<td><%=state %></td>
			  				<td><input type="checkbox" name="checkHot" value="<%=list.get(i).getFilmId() %>"></td>
		  				</tr>
		  				<%
		  			}
		  			%>
		  			<tr>
		  				<td colspan="4">
		  					<input type="submit" value="添加到热映">
		  				</td>
		  			</tr>
		  		</table>
	  		</form>
	  		<%
  		}else{
  			int row=Integer.parseInt(session.getAttribute("row").toString());
  			%>
  			<div style="position: absolute;left:300px;top:200px;">成功添加了<font color="red"><%=row %></font>条数据</div>
  			<%
  			session.removeAttribute("hot");
  		}
  	}
    %>
  </body>
</html>
