<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Film"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'ShowFilm.jsp' starting page</title>
    
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
    <form action="../DoAdd" method="post">
    	<% 
	    Film film = (Film)(session.getAttribute("film"));
	    int filmState=film.getFilmState();
	    String filmState1="";
	    if(filmState==0){
	    	filmState1="正在上映";
	    }else if(filmState==1){
	    	filmState1="即将上映";
	    }else if(filmState==2){
	    	filmState1="未上映";
	    }
	    %>
	    <table border="1">
	    	<tr>
	    		<td colspan="2" align="center">影片信息如下：</td>
	    	</tr>
	    	<tr>
	    		<td><img src="../<%=film.getFilmImg() %>"></td>
	    		<td>
	    			<table>
	    				<tr>
	    					<td>电影名：</td>
	    					<td><%=film.getFilmName() %></td>
	    				</tr>
	    				<tr>
	    					<td>类型：</td>
	    					<td><%=film.getFilmType() %></td>
	    				</tr>
	    				<tr>
	    					<td>片长：</td>
	    					<td><%=film.getFilmLong() %></td>
	    				</tr>
	    				<tr>
	    					<td>导演：</td>
	    					<td><%=film.getDirector() %></td>
	    				</tr>
	    				<tr>
	    					<td>主演：</td>
	    					<td><%=film.getActor() %></td>
	    				</tr>
	    				<tr>
	    					<td>语言：</td>
	    					<td><%=film.getFilmLanguage() %></td>
	    				</tr>
	    				<tr>
	    					<td>状态：</td>
	    					<td><%=filmState1 %></td>
	    				</tr>
	    				<tr>
	    					<td>简介：</td>
	    					<td><%=film.getJianJie() %></td>
	    				</tr>
	    			</table>
	    		</td>
	    	</tr>
	    </table>
	     <input type="submit" value="确认添加">
    </form>
    <form action="UpdFilm.jsp" method="post">
    	<input type="submit" value="返回修改">
    </form>
    
  </body>
</html>
