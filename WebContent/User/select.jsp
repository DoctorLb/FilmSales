<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.entity.Film"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  ArrayList<Film> movies=(ArrayList<Film>)(session.getAttribute("movieList"));
  session.setAttribute("movieList",movies);
  session.setAttribute("pages",0);
  int  j=0;
   %>
   <style>
   </style>
   <link rel="stylesheet" type="text/css" href="a.css">
  <body>
    	<table width="1000px" align="center">
    		<tr><td colspan="2" height="100" valign="top" width="1000"><%@include file="Top.jsp"%></td></tr>
    		<tr>
    			<td width="200" ><%@ include file="Left.jsp"%><br></td>
    			<td>
    			<table><tr><td height="80px"></td></tr></table>
    			<table width="800" height="550">
    			<c:set var="listMovie" value="${movieList}"></c:set>
    				
    					<c:forEach var="list" begin="<%=j++ %>" end="<%=movies.size() %>" items="${listMovie}">
	    					<tr>
		    					<td style="border-top-style:solid;border-top-color: green;">
		    						<table>
				    					<tr><td colspan="3"></td></tr>	
				    					<tr>
				    						<td rowspan="5" width="100px"><img src="../${list.filmImg}"/></img></td>
				    						<td width="50px">名称:</td>
				    						<td  align="left">${list.filmName}</td>
				    					</tr>
				    					<tr>
				    						<td>导演:</td>
				    						<td>${list.director}</td>
				    					</tr>
				    					<tr>
				    						<td>演员:</td>
				    						<td>${list.actor}</td>
				    					</tr>
				    					<tr>
				    						<td>类型:</td>
				    						<td>${list.filmType}</td>
				    					</tr>
				    					<tr>
				    						<td>时间:</td>
				    						<td>${list.filmLong}<br></td>
				    					</tr>
				    					<tr><td colspan="3"><a href="../SelectFilmById?filmId=${list.filmId}">查看详情>></a></td></tr>
				    				</table>
		    					</td>
		    				</tr>
    					</c:forEach>
    			</table>
    			</td>
    		</tr>
    	</table>
  </body>
</html>
