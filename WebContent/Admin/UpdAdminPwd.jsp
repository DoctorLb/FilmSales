<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'UpdAdminPwd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		function checkPwd(checkId,divId){
			var oldPwd=document.getElementById(checkId).value;
			var div=document.getElementById(divId);
			if(oldPwd.length<6||oldPwd.length>12){				
				div.innerHTML="<font color='red'>6到12位</font>";
			}else{
				div.innerHTML="<font color='green'>通过</font>";
			}
		}
		function yn(){
			var oldPwd=document.getElementById("oldPwd").value;
			var newPwd1=document.getElementById("newPwd1").value;
			var newPwd2=document.getElementById("newPwd2").value;
			var showMessage=document.getElementById("showMessage");
			var biaoshiYn=false;
			if(oldPwd.length>=6&&oldPwd.length<=12){
				if(newPwd1.length>=6&&newPwd1.length<=12){
					if(newPwd2.length>=6&&newPwd1.length<=12){
						if(newPwd1==newPwd2){
							biaoshiYn=true;
						}else{
							showMessage.innerHTML="<font color='red'>密码和确认密码不一致</font>";							
						}
					}else{
						showMessage.innerHTML="<font color='red'>确认密码6到12位</font>";
					}
				}else{
					showMessage.innerHTML="<font color='red'>密码6到12位</font>";
				}
			}else{
				showMessage.innerHTML="<font color='red'>原始密码6到12位</font>";
			}			
			return biaoshiYn;
		}
	</script>
	<style type="text/css">
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
    if(objLogin==null){
    	response.sendRedirect("faileLogin.jsp");
    }else{
    %>
    	<form action="../UpdAdminPwd" method="post" onsubmit="return yn()">
    		<table cellpadding="0" cellspacing="0" border="0" style="position: absolute;left:200px;top:100px;">
    			<tr>
    				<td>输入原始密码：</td>
    				<td><input type="password" name="oldPwd" onkeyup="checkPwd('oldPwd','oldPwdDiv1')"></td>
    				<td><div id="oldPwdDiv1" style="display: inline;"><font color="gray" size="2">6到12位</font></div></td>
    			</tr>
    			<tr>
    				<td>输入新密码：</td>
    				<td><input type="password" name="newPwd1" id="newPwd1" onkeyup="checkPwd('newPwd1','newPwdDiv1')"></td>
    				<td><div id="newPwdDiv1" style="display: inline;"><font color="gray" size="2">6到12位</font></div></td>
    			</tr>
    			<tr>
    				<td>确认密码：</td>
    				<td><input type="password" name="newPwd2" id="newPwd2" onkeyup="checkPwd('newPwd2','newPwdDiv2')"></td>
    				<td><div id="newPwdDiv2" style="display: inline;"><font color="gray" size="2">6到12位</font></div></td>
    			</tr>
    			<tr>
    				<td colspan="3" align="center"><div id="showMessage"></div></td>
    			</tr>
    			<tr>
    				<td colspan="3" align="center"><input type="submit" value="提交">
    				<input type="reset" value="重置"></td>
    			</tr>
    		</table>
    	</form>
    	<%
    }
    %>
  </body>
</html>
