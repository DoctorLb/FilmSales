<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.UserInfo"%>
<%@page import="com.userServer.UserServer"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% 	//String userId = request.getParameter("userId");
		session.setAttribute("userInfobiaoshi",1);
		UserInfo users = (UserInfo)session.getAttribute("user");
		UserServer us=new UserServer();
		UserInfo user=us.selectMe(users.getUserId()); 
		String userName=user.getUserName();
		String userSex=user.getUserSex();
		String userIdCard=user.getUserIdCard();
		String userTelephone=user.getUserTelephone();
		String userEmail=user.getUserEmail();
		int userScore=user.getUserScore();
		double userMoney=user.getUserMoney(); 
		
		
	%>
	<style type="text/css">
		td{
			font-size: 16px;
		}
	</style>
  </head>
  
  <body>
  	<form action="" method="post">
  		<table align="center" style=" height: 200px;width: 550px;" bgcolor="#EEE5DE" border="0">
  			<tr><td colspan="3" width="550" height="30" align="center" style="text-align: center;" bgcolor="#EED5D2"><font size="red">我的个人信息</font></td></tr>
  			<tr><td height="30"></td></tr>
  			<tr>
  				<td align="right" width="400">账号：</td>
  				<td width="400"><%=user.getUserId() %> </td>
  			</tr>
			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">性别：</td>
  				<td><%=userSex %></td>
  			</tr>
  			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">真实姓名：</td>
  				<td><%=user.getUserName() %> </td>
  			</tr>
  			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">身份证号：</td>
  				<td><%=user.getUserIdCard() %></td>
  			</tr>
  			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">联系电话：</td>
  				<td><%=user.getUserTelephone() %> </td>
  			</tr>
  			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">邮箱：</td>
  				<td><%=user.getUserEmail() %> </td>
  			</tr>
  			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">用户积分：</td>
  				<td><%=user.getUserScore() %></td>
  			</tr>
  			<tr><td height="10" colspan="2"></td></tr>
  			<tr>
  				<td align="right">用户余额：</td>
  				<td><%=user.getUserMoney() %> </td>
  			</tr>
  			</table>
  			<table><tr><td height="430"></td></tr></table>
  	</form>	
  </body>
</html>
