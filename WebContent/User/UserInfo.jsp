<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.Film"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/javascript" href="b.css">
	<style type="text/css">
		.left{
			background-color:#CCC;		
			}
	</style>
	<script type="text/javascript">
			//真实姓名判断
		function mingzi() {
			var userName = document.getElementById("userName").value;
			if(userName==""){
				alert("不可为空");
				document.getElementById("name").innerHTML="<font color='red'>不可为空</font>"; 
			}else{
				A=1;
				document.getElementById("name").innerHTML="<font  color='green'> √</font>";
			}
		}
		
		
		//身份证验证
		function IdCard() {
			var userIdCard = document.getElementById("userIdCard").value;
			if(userIdCard==""){
				document.getElementById("idCard").innerHTML="<font color='red'>请写正确的身份证号</font>"; 
			}else if(userIdCard.length<7){
				document.getElementById("idCard").innerHTML="<font color='red'>请写正确的身份证号</font>";
				}else{
					D=1;
					document.getElementById("idCard").innerHTML="<font  color='green'> √</font>";
				}
		}
		//电话验证
		function dianhua() {
			var userTelephone = document.getElementById("userTelephone").value;
			if(userTelephone==""){
				document.getElementById("dianhua").innerHTML="<font color='red'>只可为数字</font>"; 
			}else{
				num=0;
				for( i=0;i<userTelephone.length;i++){
					var dh = userTelephone.charAt(i);
					if(dh<'0'||dh>'9'){
						if(dh!='-'){
							break;
						}else{
							num++;
						}
					}
				}
				if(i==userTelephone.length&&num<=1){
					E=1;
					document.getElementById("dianhua").innerHTML="<font  color='green'> √</font>";
				}else{
					document.getElementById("dianhua").innerHTML="<font color='red'>数字或包含'-'</font>";
				}
				
			}
		}
		//邮箱验证
		function youxiang() {
			var userEmail = document.getElementById("userEmail").value;
			if(userEmail==""){
				document.getElementById("youxiang").innerHTML="<font color='red'>格式为XXX.@XXX.com</font>"; 
			}else if(userEmail.indexOf('@') !=- 1 && userEmail.indexOf('.') > userEmail.indexOf('@')){
				F=1;
				document.getElementById("youxiang").innerHTML="<font  color='green'> √</font>";	
			}else{
				document.getElementById("youxiang").innerHTML="<font color='red'>格式为XXX.@XXX.com</font>"; 
			}
		}
		
		
		
		
		function mm(){
			
			var oldPwd=document.getElementById("oldPwd").value;
			if(oldPwd==""){
				document.getElementById("mi").innerHTML="<font color='red'>请输入密码</font>";
			}
		}
		//判断密码
		function mima(){
			
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd==""){
				document.getElementById("mima").innerHTML="<font color='red'>不能为空</font>";
			}else if(userPwd.length<6){
				document.getElementById("mima").innerHTML="<font color='red'>不能小于6位</font>";
			}else{
			//判断密码强度
			var a=0,b=0,c=0,d=0;
			for( i=0;i<userPwd1.length;i++){
				 ch=userPwd1.charAt(i);
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
				document.getElementById("mima").innerHTML="<font color='red'>密码强度：弱</font>";
			}else if(a+b+c+d==2){
				document.getElementById("mima").innerHTML="<font color='blue'>密码强度：中</font>";
			}else{
				document.getElementById("mima").innerHTML="<font color='greed'>密码强度：强</font>";
			}
				}
				if(userPwd1!=""&&userPwd1!=userPwd){
					document.getElementById("mima1").innerHTML="<font color='red'>两次密码不一致</font>";					
				}				
			}
		//确认密码
		function mima1(){
			
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd1==""){
				document.getElementById("mima1").innerHTML="<font color='red'>密码不能为空</font>";
			}else{
				
				document.getElementById("mima1").innerHTML="<font  color='green'> √</font>";	
			}
			if(userPwd1!=""&&userPwd1!=userPwd){
				document.getElementById("mima1").innerHTML="<font color='red'>两次密码不一致</font>";				
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
		
		
		
		function k(){
			
			var kahao=document.getElementById("kahao").value;
			if(kahao==""){
				document.getElementById("ka").innerHTML="<font color='red'>请输入卡号</font>";
			}else{
				
				document.getElementById("ka").innerHTML="<font  color='green'> √</font>";
			}
		}
		
		function mm(){
			
			var mima=document.getElementById("mima").value;
			if(mima==""){
				document.getElementById("mi").innerHTML="<font color='red'>请输入密码</font>";
			}else{
				
				document.getElementById("mi").innerHTML="<font  color='green'> √</font>";
			}
			
		}
		
		function Money(){
		
			var userMoney=document.getElementById("userMoney").value;
			if(userMoney==""){
				document.getElementById("qian").innerHTML="<font color='red'>请充值</font>";
			}else{
				
				document.getElementById("qian").innerHTML="<font  color='green'> √</font>";
			}
		
		}
		
		
		//var xhr;
		function doAjax1(num){
			//var oldPwd = document.getElementById("oldPwd");
			//var userPwd = document.getElementById("userPwd");
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
			if(num==1){
				xhr.open("POST","ShowMe.jsp");
			}else if(num==2){
				xhr.open("POST","UpdMe.jsp");
			}else if(num==3){
				xhr.open("POST","MiMa.jsp");
			}else if(num==4){
				xhr.open("POST","PingJia.jsp");
			}else if(num==5){
				xhr.open("POST","AddMoney.jsp");
			}else if(num==6){
				xhr.open("POST","DelTicketMain.jsp");
			}else if(num==7){
				xhr.open("POST","MyOrder.jsp");
			}
			
			xhr.onreadystatechange=function(){
				var st=xhr.readyState;
				if(st==4){
					var str=xhr.responseText;
					document.getElementById("userInfoDiv").innerHTML=str;
				}
			}
			xhr.send(null);
		}
		
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
					document.getElementById("orderDiv").innerHTML="<font color='red'>不能为空</font>";
				}
		}
		//不能为空的判断
		function kongPd(){
			var kahao = document.getElementById("kahao").value;
			var mima = document.getElementById("mima").value;
			var userMoney = document.getElementById("userMoney").value;
			if(kahao.length>0&&mima.length>0&&userMoney.length>0){
				return true;
			}else{
				return false;
			}
			return false;
		}
		function doAjax3(){
			if(kongPd()){
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
				var userId = document.getElementById("userId").value;
				var money = document.getElementById("userMoney").value;
				xhr.open('POST','../AddMoney?userId='+userId+'&userMoney='+money);
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xhr.onreadystatechange=function(){
					var st = xhr.readyState;
					if(st==4){
						var str = xhr.responseText;
						document.getElementById("addMoneyDiv").innerHTML=str;
					}
				}
				xhr.send(null);
			}else{
				document.getElementById("addMoneyDiv").innerHTML="<font color='red'>不能为空</font>";
			}
		}
		
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
		function doAjax4(){
			if(UpdMeKongPd()){
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
				//var sex1 = {"sex1","sex2"};
				var userId = document.getElementById("userId").value;
				var Sex = document.getElementsByName("userSex");
				var userSex = "";
				for(var i=0;i<Sex.length;i++){
					if(Sex[i].checked){
						userSex = Sex[i].value;
					}
				}
				var userName = document.getElementById("userName").value;
				var userIdCard = document.getElementById("userIdCard").value;
				var userTelephone = document.getElementById("userTelephone").value;
				var userEmail = document.getElementById("userEmail").value;
				xhr.open('POST','../UpdMe?userId='+userId+'&userSex='+userSex+'&userName='+userName+'&userIdCard='+userIdCard+'&userTelephone='+userTelephone+'&userEmail='+userEmail);
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				xhr.onreadystatechange=function(){
					var st = xhr.readyState;
					if(st==4){
						var str = xhr.responseText;
						document.getElementById("UpdMeDiv").innerHTML=str;
					}
				}
				xhr.send(null);
			}else{
				document.getElementById("UpdMeDiv").innerHTML="<font color='red'>不能为空</font>";
			}
		}
		
		function hiddenPage(){
  			var pages=document.getElementById("yeshu").value;
  			var nextSize=document.getElementById("nextSize").value;
 			if(pages==0){
  				document.getElementById("upPage").style.display="none";
  			}
  			if(nextSize==0){
  				document.getElementById("downPage").style.display="none";
  			}
  		}
	</script>
  </head>
  
<body bgcolor="#EEE8CD">
	<% 
		if(session.getAttribute("user")!=null){
	%>
	<div style="">
		 <table width="1000"  cellspacing="0" cellpadding="0" align="center">
		 	<tr>
		 		<td colspan="2" height="60"><jsp:include page="Top.jsp"></jsp:include></td>
		 	</tr>
		 </table><br/><br/><br/>
		 <table width="1000" cellspacing="0" cellpadding="0" align="center" style="border:1px gray solid;" border="1">
		 	<tr>
		 		<td width="200" ><jsp:include page="youbian.jsp"></jsp:include></td>
		 		<td >
		 			<table style="width:600px;">
		 				<tr>
		 					<td>
		 					<div id="userInfoDiv">
		 						<% 
		 							if(session.getAttribute("userInfobiaoshi")==null){
		 						%>
		 						<jsp:include page="ShowMe.jsp"></jsp:include>
		 						<%	
		 							}else{
		 								if(session.getAttribute("userInfobiaoshi").toString().equals("1")){
		 						%>
		 						<jsp:include page="ShowMe.jsp"></jsp:include>
		 						<%		
		 								}else if(session.getAttribute("userInfobiaoshi").toString().equals("2")){
		 						%>
		 						<jsp:include page="UpdMe.jsp"></jsp:include>
		 						<%		
		 								}
		 								else if(session.getAttribute("userInfobiaoshi").toString().equals("3")){
		 						%>
		 						<jsp:include page="MiMa.jsp"></jsp:include>
		 						<%		
		 								}
		 								else if(session.getAttribute("userInfobiaoshi").toString().equals("4")){
		 						%>
		 						<jsp:include page="PingJia.jsp"></jsp:include>
		 						<%		
		 								}
		 								else if(session.getAttribute("userInfobiaoshi").toString().equals("5")){
		 						%>
		 						<jsp:include page="AddMoney.jsp"></jsp:include>
		 						<%		
		 								}else if(session.getAttribute("userInfobiaoshi").toString().equals("6")){
		 						%>
		 						<jsp:include page="DelTicketMain.jsp"></jsp:include>
		 						<%		
		 								}else if(session.getAttribute("userInfobiaoshi").toString().equals("7")){
		 						%>
		 						<jsp:include page="MyOrder.jsp"></jsp:include>
		 						<%		
		 								}
		 							}
		 						%>
		 						</div>
		 					</td>
		 				</tr>
		 			</table>
		 		</td>
		 		<td width="200">
		 			<table>
		 				<tr>
		 					<td>
		 						<table width="180" >
                       <tr>
                           <td height="50" align="center" bgcolor="#333333"><font color="#FFFFFF">用户关注排行榜</font></td>
                       </tr>
	                <% 
						UserServer us = new UserServer();
						ArrayList<Film> list = us.selFilmScore(); //查询用户关注度排行榜并循环显示
						if(list!=null){
							for(int i=0;i<list.size();i++){
								Film film = list.get(i);
					%>
						<tr>
							<td class="left" align="center" height="50">
								
								<a href="../SelectFilmById?filmId=<%= film.getFilmId() %>">
									<%=film.getFilmName()%>
								</a><br/>
								(<%=film.getFilmScore() %>人关注)
							</td>
						</tr>
					<%		
							}
						}                                 
	                %>       
                       
                   </table>
		 					</td>
		 				</tr>
		 				<tr>
		 					<td></td>
		 				</tr>
		 			</table>
		 			<table><tr><td height="200"></td></tr></table>
		 		</td>
		 	</tr>
		 </table> 
	</div>	          
	<%	
		}else{
			response.sendRedirect("MyHome.jsp");
		}
	%>	
</body>
</html>
