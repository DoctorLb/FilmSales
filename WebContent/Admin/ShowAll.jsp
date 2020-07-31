<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Film"%>
<%@page import="com.adminServer.AdminServer"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'ShowAll.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.ziti{
			font-size: 12;
		}
	</style>
  </head>
  
  <body>
  	<form >
	  	 <% 
	  	 Object denglu=session.getAttribute("denglu");
  		if(denglu==null){
  			response.sendRedirect("faileLogin.jsp");
  		}else{
		  	AdminServer as=new AdminServer();
		    ArrayList<Film> list=as.selAll();
		    int row=0;
		    int col=0;
		    int count=0;
		    if(list.size()%3==0){
		    	row=list.size()/3;
		    }else{
		    	row=list.size()/3+1;
		    }
			%>
			<table border="1" cellpadding="0" cellspacing="0">
				<% 
				for(int i=0;i<row;i++){
					%>
					<tr>
						<%
						if(i==row-1){
							if(list.size()%3==0){
						    	col=3;
						    }else{
						    	col=list.size()%3;
						    }
						} else{
							col=3;
						}
						for(int j=0;j<col;j++){
							%>
							<td width="100px;"><img width="100" height="120" src="../<%=list.get(count).getFilmImg() %>"></td>
							<% 
							String state="";
							int filmState=list.get(count).getFilmState();
							if(filmState==2){
								state="未上映";
							}else if(filmState==0){
								state="正在上映";
							}else if(filmState==1){
								state="即将上映";
							}
							%>
							<td>
								<table border="0">
									<tr><td class="ziti">电影名：<%=list.get(count).getFilmName() %></td></tr>
									<tr><td class="ziti">类型：<%=list.get(count).getFilmType()%></td></tr>
									<tr><td class="ziti">导演：<%=list.get(count).getDirector() %></td></tr>
									<tr><td class="ziti">主演：<%=list.get(count).getActor()%></td></tr>
									<tr><td class="ziti">状态：<%=state %></td></tr>						
								</table>
							</td>
							<% 
							count++;
						}
						%>
					</tr>
					<%
				}
			}
			%>
		</table>
  	</form>
  </body>
</html>
