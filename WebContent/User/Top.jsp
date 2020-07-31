<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.td3{
			background-color: #CD919E;
		}
		.td4{
			background-color: gray;
		}
	</style>
  </head>
  <body>
   <table align="center">
     <tr>
        <td><img height="60" width="1000" src="../Image/top1.jpg"/></td>
     </tr>
  </table>
  <table><tr><td height="5"></td></tr></table>
  <table bgcolor="gray" style="height: 40px;width: 1000px;">
  	<tr>
  		<td width="80" align="center"><a href="MyHome.jsp" style="text-decoration: none"><font size="4">首页</font></a></td>
  		<td width="20"></td>
  		<td width="80" align="center"><a href="../CurrentServlet" style="text-decoration: none"><font size="4">电影</font></a></td>
  		<td width="20"></td>
  		<td width="80" align="center"><a href="quickBuy.jsp" style="text-decoration: none"><font size="4">在线购票</font></a></td>
  		<td width="20"></td>
  		<% 
  			if(session.getAttribute("user")!=null){
  		%>
  		<td width="80" align="center"><a href="UserInfo.jsp" style="text-decoration: none"><font size="4">个人中心</font></a></td>
  		<td width="80" align="center"><a href="../ZhuXiao" style="text-decoration: none"><font size="4">注销</font></a></td>
  		<%	
  			}
  		%>
  		
  		<td width="80" align="center"><a href="UserReg.jsp" style="text-decoration: none"><font size="4">注册</font></a></td>
  		<td></td>
  	</tr>
  </table>
  </body>
</html>
