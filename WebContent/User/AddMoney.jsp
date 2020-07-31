<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.UserInfo"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>充值</title>
    
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
	%>
	<script type="text/javascript">
		//充值卡号判断
		function k(){			
			var kahao=document.getElementById("kahao").value;
			if(kahao==""){
				document.getElementById("ka").innerHTML="<font size='2' color='red'>请输入卡号</font>";
			}else{
				
				document.getElementById("ka").innerHTML="<font  color='green'> √</font>";
			}
		}
		//充值密码判断
		function mm(){
			
			var mima=document.getElementById("mima").value;
			if(mima==""){
				document.getElementById("mi").innerHTML="<font size='2' color='red'>请输入密码</font>";
			}else{
				
				document.getElementById("mi").innerHTML="<font  color='green'> √</font>";
			}
			
		}
		//充值钱
		function Money(){
		
			var userMoney=document.getElementById("userMoney").value;
			if(userMoney==""){
				document.getElementById("qian").innerHTML="<font size='2' color='red'>请充值</font>";
			}else{
				
				document.getElementById("qian").innerHTML="<font  color='green'> √</font>";
			}
		
		}
		//不能为空的判断
		function kongPd(){
			var kahao = document.getElementById("kahao").value;
			var mima = document.getElementById("mima").value;
			var userMoney = document.getElementById("userMoney").value;
			if(kahao.length:>0&&mima.length>0&&userMoney.length>0){
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
  	session.setAttribute("userInfobiaoshi",5);
  %>  
    	<table align="center" bgcolor="#EEE5DE" height="300" width="560" border="0">
    		<tr><td bgcolor="#EED5D2" colspan="4" align="CENTER" height="30">用户充值</td></tr>
    		<tr><td height="30"></td></tr>
    		<tr>
    			<td width="60"></td>
    			<td width="60">用户名</td>
    			<td><input type="text" id="userId" name="userId" readonly="readonly" value="<%=user.getUserId()%>"></td>
    		</tr>
    		<tr>
    			<td width="60"></td>
    			<td width="120">请选择银行：</td>
    			<td width="200">
    				<input type="radio" value="1" name="1"checked="checked">工商
    				<input type="radio" value="1" name="1">建设
    				<input type="radio" value="1" name="1">交通<br>
    				<input type="radio" value="1" name="1">邮政
    				<input type="radio" value="1" name="1">农业
    			</td>
    			<td width="50"></td>
    		</tr>
    		
    		<tr>
    			<td width="60"></td>
    			<td>请输入卡号：</td>
    			<td width="100"><input type="text" id="kahao" name="kahao" onblur="k()"><br></td>
    			<td width="100"><div id="ka" style="display:inline"></div></td>  	
    		</tr>
    		<tr><td height="10"></td></tr>
    		<tr>
    			<td width="60"></td>
    			<td>请输入密码</td>
    			<td width="150"><input style="width:152px;" type="password" id="mima" name="mima" onblur="mm()"></td>
    			<td><div id="mi" style="display:inline"></div> </td> 	
    		</tr>
    		<tr>
    			<td width="60"></td>
    			<td>请输入充值金额：</td>
    			<td><input type="text" id="userMoney" name="userMoney" onfocus="Money()"></td>
    			<td><div id="qian" style="display:inline"></div></td>  	
    		</tr>
    		<tr><td height="10"></td></tr>
    		<tr>
    			<td width="60"></td>
    			<td colspan="2" align="center">
    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="submit" value="充值" onclick="doAjax3()" style="background-color:#EED5D2; ">&nbsp;&nbsp;&nbsp;
    				&nbsp;&nbsp;
    				<input type="reset"  value="取消" style="background-color:#EED5D2; ">
    			</td>
    		</tr>
    		<tr>
    			<td>
    				<div id="addMoneyDiv"></div>
    			</td>
    		</tr>
    	</table>
    	<table><tr><td height="440"></td></tr></table>
  </body>
</html>
