<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.UserInfo"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		
		function mm(){		
			var oldPwd=document.getElementById("oldPwd").value;
			if(oldPwd==""){
				document.getElementById("mi").innerHTML="<font size='2' color='red'>请输入密码</font>";
			}
		}
		//判断密码
		function mima(){
			
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd==""){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>密码不能为空</font>";
			}else if(userPwd.length<6){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>不能小于6位</font>";
			}else{
			//判断密码强度
			var a=0,b=0,c=0,d=0;
			for( i=0;i<userPwd.length;i++){
				 ch=userPwd.charAt(i);
				if(ch >='0'&&ch<='9'){
					a=1;
				}else if(ch>='a'&&ch<='z'){
					b=1;
				}else if(ch>='A'&&ch<='Z'){
					c=1;
				}else{
					d=1;
				}
			}
			
			if(a+b+c+d==1){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>密码强度：弱</font>";
			}else if(a+b+c+d==2){
				document.getElementById("mima").innerHTML="<font size='2' color='#FF9900'>密码强度：中</font>";
			}else{
				document.getElementById("mima").innerHTML="<font size='2' color='green'>密码强度：强</font>";
			}
				}
				if(userPwd1!=""&&userPwd1!=userPwd){
					document.getElementById("mima1").innerHTML="<font size='2' color='red'>两次密码不一致</font>";					
				}				
		}
		//确认密码
		function mima1(){
			
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd1==""){
				document.getElementById("mima1").innerHTML="<font size='2' color='red'>密码不能为空</font>";
			}else{
				
				document.getElementById("mima1").innerHTML="<font  color='green'> √</font>";	
			}
			if(userPwd1!=""&&userPwd1!=userPwd){
				document.getElementById("mima1").innerHTML="<font size='2' color='red'>两次密码不一致</font>";				
			}	
		}
		var xhr;
		function doAjax(){
			var oldPwd = document.getElementById("oldPwd");
			var userPwd = document.getElementById("userPwd");
			try {
				xhr=new ActiveXObject("Msxm12.XMLHTTP");
			} catch (e) {
				try {
					xhr=new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					try {
						xhr=new XMLHttpRequest();
						if(xhr.overrideMimeType){
						xhr.overideMimeType("text/xml");
						}
					} catch (e) {
						
					}
				}
			}
			xhr.open("POST","../UpdMiMa?oldPwd="+oldPwd+"&userPwd"+userPwd);
			xhr.onreadystatechange=function(){
				var st=xhr.readyState;
				if(st==4){
					var str=xhr.responseText;
					document.getElementById("div1").innerHTML=str;
				}
			}
			xhr.send(null);
		}
	</script>
  </head>
  
  <body>
  <%
 	 request.setCharacterEncoding("utf-8");
   	 response.setCharacterEncoding("utf-8");
  	 session.setAttribute("userInfobiaoshi",3);
   %>
   	<table align="center" width="500" bgcolor="#EEE5DE" height="200" border="0" cellpadding="0" cellspacing="0">
   		<tr><td bgcolor="#EED5D2" colspan="3" align="center" height="30">修改密码</td></tr>
   		<tr><td height="30"></td></tr>
   		<tr>
   			<td align="right" width="100">原始密码：</td>
   			<td align="center" >
   				<input type="password" name="oldPwd" id="oldPwd" onblur="mm()">
   			</td>
   			<td>
 				<div id="mi" style="width:100px;display:inline"></div>  			
 			</td>
   		</tr>
   		<tr>
   			<td width="100" align="right">新密码：</td>
   			<td align="center" >
   				<input type="password" name="userPwd" id="userPwd" onkeyup="mima()">
   			</td>
   			<td>
 				<div id="mima" style="width:100px;display:inline"></div>  			
 			</td>
   		</tr>
   		<tr>
   			<td width="100" align="right">确认新密码：</td>
   			<td align="center" >
   				<input type="password" name="userPwd1" id="userPwd1"  onkeyup="mima1()">
   			</td>
   			<td>
 				<div id="mima1" style="width:100px;display:inline"></div>  			
 			</td>
   		</tr>
   		<tr> 
   			<td ><br></td>
   			<td align="center">
   				<input type="submit" value="提交" onclick="doAjax()">&nbsp;&nbsp;&nbsp;&nbsp;
   				<input type="reset" value="重置" >
   			</td>
   			<td width="100"><br></td>
   		</tr>
   		<tr>
   			<td colspan="4">
   				<br>
   			</td>
   		</tr>
   		
   	</table>
   	<table height="550"><tr><td></td></tr></table>
  </body>
</html>
