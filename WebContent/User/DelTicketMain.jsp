<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>取消订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var xhr;
		function doAjax2(){
			try {
				 xhr = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						xhr = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
							try {
									xhr = new XMLHttpRequest();
									if (xhr.overrideMimeType) {
									xhr.overrideMimeType("text/xml");
							}
						} catch (e) {
						}
					}
				}
				var name = document.getElementById("orderId").value;
				var userId = document.getElementById("userId1").value;
				var userPwd = document.getElementById("userPwd1").value;
				if(name.length>0&&userId.length>0&&userPwd>0){
					xhr.open('POST','doDelTicket.jsp?orderId='+name+'&userId='+userId+'&userPwd='+userPwd);
					xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					xhr.onreadystatechange=function(){
						var st = xhr.readyState;
						if(st==4){
							var str = xhr.responseText;
							document.getElementById("orderDiv").innerHTML=str;
						}
					}
					xhr.send(null);
				}else{
					document.getElementById("orderDiv").innerHTML="";
				}
		}
		
	</script>
  </head>
  
  <body>
  <% session.setAttribute("userInfobiaoshi",6); %>
  		<table align="center" width="560" height="100" bgcolor="#EEE5DE">
  			<tr><td bgcolor="#EED5D2" height="30" align="center">用户退票</td></tr>
  			<tr><td height="35"></td></tr>
  			<tr>
  				<td width="285">
  					用户须知
  				</td>
  			</tr>
  			<tr>
  				<td><font color="red">
  					用户退票需要付5%的手续费，为了不影响他人<br/><br/>
  					继续订票，您只能该电影上映前1小时外退票<br><br/>
  					所以退票时请您慎重选择</font>
  					
  				</td>
  			</tr>
  		</table>
    	<table align="center" width="560" height="200" bgcolor="#EEE5DE">
	   		<tr>
	   			<td>请输入你的订单号</td>
	   			<td><input type="text" id="orderId"/></td>
	   		</tr>
	   		<tr>
	   			<td>请输入你的会员号</td>
	   			<td><input type="text" id="userId1"/></td>
	   		</tr>
	   		<tr>
	   			<td>请输入你的密码</td>
	   			<td><input type="password" id="userPwd1"/></td>	
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td><input type="submit" style="width: 100px;background-color:#EED5D2; " value="确 定" onclick="doAjax2()"/></td>
	   		</tr>
	   	</table>
	   	<table align="center" width="560" height="100" bgcolor="#EEE5DE">
	   		<tr>
	   			<td>
	   				<table>
	   					<tr>
	   						<td><div id="orderDiv"></div></td>
	   					</tr>
	   					<% 
	   						if(session.getAttribute("yn")!=null){
	   							if(session.getAttribute("yn").equals("y")){
	   								session.removeAttribute("yn");
	   					%>
	   					<tr>
	   						<td><font color="green">您的订单已成功取消</font></td>
	   					</tr>
	   					<%		
	   							}else if(session.getAttribute("yn").equals("yn")){
	   								session.removeAttribute("yn");
	   					%>
	   					<tr>
	   						<td><font color="red">您的订单已经过期</font></td>
	   					</tr>
	   					<%		
	   							}
	   					%>
	   					
	   					<%	
	   						}
	   					%>
	   				</table>
	   			</td>
	   		</tr>
	   	</table>
	   	<table><tr><td height="290"></td></tr></table>
  </body>
</html>
