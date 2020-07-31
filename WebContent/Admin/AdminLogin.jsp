<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'AdminLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.btn{
			background-color: lightblue;width:62;height: 24;
		}
		tr{
			height: 40px;
			font-size: 14;
		}
		td{
			font-size: 14;
		}
	</style>
  </head>
  
  <body background="../Image/right_1.gif">
  	<% 
  		Object objLogin=session.getAttribute("adminId");
  		if(objLogin!=null){
  			String adminId=objLogin.toString();
  			Date date=new Date();
  			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
  			sf.format(date);
  			%>
  			<div style="position: absolute;left:30%;top:30%">
  				<font color="blue" size="4"><%=adminId %></font>，您好！欢迎使用！<br><br>
  				<font color="blue" size="4">今天是：</font><%=sf.format(date) %>
  			</div>
  			<%
  		}else{
  			%>
  			<form action="../LoginServlet" method="post">
    				<table border="0" style="position: absolute;left: 250px;top:120px;">
			    		<tr >
			    			<td>用户名：</td>
			    			<td><input type="text" name="adminId" id="adminId" style="width: 140px;"></td>
			    		</tr>
			    		<tr>
			    			<td>密码：</td>
			    			<td><input type="password" name="adminPwd" id="adminPwd" style="width: 140px;"></td>
			    		</tr>
			    		<tr>
			    			 <td height="30" align="center">
			    			 	<input type="submit" value="登陆" class="btn">
			    			 </td>
			    			 <td align="right">
			    				<input type="reset" value="重置" class="btn">
			    			</td>
			    		</tr>
		    		</table>	
	    	</form>
  			<%
  		}
  	%>
  </body>
</html>
