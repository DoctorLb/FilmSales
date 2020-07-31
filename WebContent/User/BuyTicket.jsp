<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.FilmShow"%>
<%@page import="com.userServer.UserServer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>购票</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="a.css">

  </head>	  
<body bgcolor="#EEE8CD">
	<% 
		if(session.getAttribute("user")!=null){
	%>
		 <table width="1000"  cellspacing="0" cellpadding="0" align="center">
		 	<tr>
		 		<td colspan="2" height="60"><jsp:include page="Top.jsp"></jsp:include></td>
		 	</tr>
		 </table>
		 <table width="1000" height="810"  cellspacing="0" cellpadding="0" align="center" border="1">
		 	<tr>
		 		<td width="200" height="550"><jsp:include page="Left.jsp"></jsp:include></td>
		 		<td><jsp:include page="BuyTicketCenter.jsp"></jsp:include></td>
		 		<td width="210"><jsp:include page="BuyTicketRight.jsp"></jsp:include></td>
		 	</tr>
		 </table> 
	<%		
		}else{
			response.sendRedirect("MyHome.jsp");	
		}
	%>	          
</body>
</html>
