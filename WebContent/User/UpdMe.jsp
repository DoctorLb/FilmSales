<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.UserInfo"%>
<%@page import="com.userServer.UserServer"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>修改信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<% 	
		UserInfo users = (UserInfo)session.getAttribute("user");
		UserServer us=new UserServer();
		UserInfo user=us.selectMe(users.getUserId());  
		String userName=user.getUserName();		
		String userSex=user.getUserSex();	
		String[] sex = userSex.split(" ");
		String userIdCard=user.getUserIdCard();
		String userTelephone=user.getUserTelephone();
		String userEmail=user.getUserEmail();
		int userScore=user.getUserScore();
		double userMoney=user.getUserMoney(); 	
	%>
	<script type="text/javascript">
		function UpdMeKongPd(){
			var name = document.getElementById("userName").value;
			var userIdCard = document.getElementById("userIdCard").value;
			var userTelephone = document.getElementById("userTelephone").value;
			var userEmail = document.getElementById("userEmail").value;
			if(name.length>0&&userIdCard.length>0&&userTelephone.length>0&&userEmail.length>0){
				return true;
			}else{
				return false;
			}
			return false;
		}
	</script>
  </head>
  <body>
  <% 
  	session.setAttribute("userInfobiaoshi",2);
  %>  
  		<table align="center" width="560" bgcolor="#EEE5DE" height="400" border="0">
  			<tr><td colspan="4" align="center" height="30" bgcolor="#EED5D2">修改个人信息</td></tr>
  			<tr>
  				<td width="100"></td>
  				<td width="100">用户名：</td>
  				<td width="120"><input type="text" id="userId" name="userId" readonly="readonly" value="<%=user.getUserId() %>" > </td>
  			</tr>
  			<tr>
  				<td width="100"></td>
  				<td>性别：</td>
  				<td width="120">
  					<input type="radio" id="sex1" name="userSex" value="男" checked="checked"><img src="../Image/M.gif">
  					<input type="radio" id="sex2" name="userSex" value="女"><img src="../Image/WM.gif">
  					
  				</td>	
  			</tr>
  			<tr>
  				<td width="100"></td>
  				<td>真实姓名：</td>
  				<td width="120"><input type="text" name="userName" id="userName" onKeyUp="mingzi()" value="<%=user.getUserName() %>" > </td>
  				<td width="120"><div id="name" style="display:inline"></div></td>
  			</tr>
  			<tr>
  				<td width="100"></td>
  				<td>身份证号：</td>
  				<td width="120"><input type="text" name="userIdCard" id="userIdCard" onKeyUp="IdCard()" value="<%=user.getUserIdCard() %>" > </td>
  				<td width="120"><div id="idCard" style="display:inline"></div>  
  			</tr>
  			<tr>
  				<td width="100"></td>
  				<td>联系电话：</td>
  				<td width="120"><input type="text" name="userTelephone" value="<%=user.getUserTelephone() %>" id="userTelephone" onKeyUp="dianhua()"> </td>
  				<td width="120"><div id="dianhua" style="display:inline"></div>
  			</tr>
  			<tr>
  			<td width="100"></td>
  				<td>邮箱:</td>
  				<td width="120"><input type="text" name="userEmail" id="userEmail" onKeyUp="youxiang()" value="<%=user.getUserEmail() %>" > </td>
  				<td width="120"><div id="youxiang" style="display:inline"></div>  
  			</tr>
  			<tr><td colspan="3" height="30"></td></tr>
  			<tr>
  				<td width="100"></td>
  				<td colspan="2"  align="center" >
  					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  					<input type="submit" value="修改" onclick="doAjax4()" style="background-color:#EED5D2; ">&nbsp;&nbsp;
  					&nbsp;&nbsp;
  					<input type="reset" value="重置" style="background-color:#EED5D2;"/>
  				</td>
  				<td></td>		
  			</tr>
  			<tr>
  				<td>
  					<div id="UpdMeDiv"></div>
  				</td>
  			</tr>
  		</table>
  		<table><tr><td height="355"></td></tr></table>
  </body>
</html>
