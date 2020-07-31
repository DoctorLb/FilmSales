<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.UserInfo"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.Film"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="a.css">
	

  </head>
  
<body bgcolor="#EEE8CD">
	<div style="">
		 <table width="1000"  cellspacing="0" cellpadding="0" align="center">
		 	<tr>
		 		<td colspan="2" height="60"><jsp:include page="Top.jsp"></jsp:include></td>
		 	</tr>
		 </table><br/><br/><br/>
		 <table width="1000" height="800" cellspacing="0" cellpadding="0" align="center" >
		 	<tr>
		 		<td width="200" height="550">
					<jsp:include page="Left.jsp"></jsp:include>
				</td>
		 		<td >
		 			<table style="width:600px;height:550px;">
		 				<tr>
		 					<td><jsp:include page="Center.jsp"></jsp:include></td>
		 				</tr>
		 			</table>
		 		</td>
		 		<td width="200">
		 			<table>
		 				<tr>
		 					<td><jsp:include page="Right.jsp"></jsp:include></td>
		 				</tr>
		 				<tr>
		 					<td></td>
		 				</tr>
		 			</table>
		 		</td>
		 	</tr>
		 </table> 
	</div>	          
</body>
</html>
