<%@ page  language="java" import="java.util.*"  pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		a{
			font-size:12px;
			color:green;
			text-decoration:none;
		}	
	</style>
	<script type="text/javascript">
	
		var A=0,B=0,C=0,D=0,E=0,F=0,G=0,J=1; 
		var wth=0;
		//判断真实姓名
		function mingzi(){
			A=0;
			var userName=document.getElementById("userName").value;
		
			if(userName==""){
				document.getElementById("name").innerHTML="<font size='2' color='red'>真实姓名不能为空</font>";
			}else{
				A=1;
				document.getElementById("name").innerHTML="<font  color='green'> √</font>";
			}
			if(A+B+C+D+E+J+F+G!=8){
				document.getElementById("tj").disabled=true;
			}else{
				document.getElementById("tj").disabled=false;
			}	
		}
		//判断身份证
		function IdCard(){
			B=0;
			var userIdCard=document.getElementById("userIdCard").value;
			if(userIdCard==""){
				document.getElementById("idCard").innerHTML="<font size='2' color='red'>身份证不可空</font>";
			}else if(userIdCard.length<7){
				document.getElementById("idCard").innerHTML="<font size='1' color='red'>请写正确的身份证号</font>";
			}else{
				B=1;
				document.getElementById("idCard").innerHTML="<font  color='green'> √</font>";
			}
			document.getElementById("tj").disabled=true;
		}
		//判断电话
		function dianhua(){
			G=0;
			var userTelephone=document.getElementById("userTelephone").value;
			if(userTelephone==""){
				document.getElementById("dianhua").innerHTML="<font size='2' color='red'>电话不可空</font>";
			}else{
				wth=0;
				for(i=0;i<userTelephone.length;i++){
					var dha=userTelephone.charAt(i);
					if(dha<'0'||dha>'9'){
						if(dha!='-'){
							break;
						}else{
							wth++;
						}
					}				
				}
			
				if(i==userTelephone.length&&wth<=1){
					G=1;
					document.getElementById("dianhua").innerHTML="<font  color='green'> √</font>";
				}else{
					document.getElementById("dianhua").innerHTML="<font size='2' color='red'>只可数字或含'-'</font>";
				}
			}
			if(A+B+C+D+E+J+F+G!=8){
				document.getElementById("tj").disabled=true;
			}else{
				document.getElementById("tj").disabled=false;
			}
			}
		//判断邮箱
		function youxiang(){
			C=0;
			var userEmail=document.getElementById("userEmail").value;
			if(userEmail==""){
				document.getElementById("youxiang").innerHTML="<font size='2' color='red'>格式为XXX@.XXX</font>";
			}else if(userEmail.indexOf('@') !=- 1 && userEmail.indexOf('.')  >  userEmail.indexOf('@')){
				C=1;
				document.getElementById("youxiang").innerHTML="<font  color='green'> √</font>";
			}else{
				document.getElementById("youxiang").innerHTML="<font size='2' color='red'>邮箱邮箱格式不正确</font>";
			}
			if(A+B+C+D+E+J+F+G!=8){
				document.getElementById("tj").disabled=true;
			}else{
				document.getElementById("tj").disabled=false;
			}
		}
		//判断密码
		function mima(){
			E=0;J=1;
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd==""){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>密码不能为空</font>";
			}else if(userPwd.length<6){
				document.getElementById("mima").innerHTML="<font size='2' color='red'>不能小于6位</font>";
			}else{
				E=1;
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
				document.getElementById("mima").innerHTML="<font size='2' color='#FF0000'>密码强度：弱</font>";
			}else if(a+b+c+d==2){
				document.getElementById("mima").innerHTML="<font size='2' color='#FF9900'>密码强度：中</font>";
			}else{
				document.getElementById("mima").innerHTML="<font size='2' color='#33CC00'>密码强度：强</font>";
			}
				}
				if(userPwd1!=""&&userPwd1!=userPwd){
					document.getElementById("mima1").innerHTML="<font size='2' color='red'>两次密码不一致</font>";
					J=0;
				}else{
					document.getElementById("mima1").innerHTML="<font size='2' color='red'>*</font>";
					J=1;
				}
				if(A+B+C+D+E+J+F+G!=8){
					document.getElementById("tj").disabled=true;
				}else{
					document.getElementById("tj").disabled=false;
				}
			}
		//确认密码
		function mima1(){
			D=0;J=1;
			var userPwd = document.getElementById("userPwd").value;
			var userPwd1=document.getElementById("userPwd1").value;
			if(userPwd1==""){
				document.getElementById("mima1").innerHTML="<font size='2' color='red'>密码不能为空</font>";
			}else{
				D=1;
				document.getElementById("mima1").innerHTML="<font  color='green'> √</font>";	
			}
			if(userPwd1!=""&&userPwd1!=userPwd){
				document.getElementById("mima1").innerHTML="<font size='2' color='red'>两次密码不一致</font>";
				J=0;
			}
		
			if(A+B+C+D+E+J+F+G!=8){
				document.getElementById("tj").disabled=true;
			}else{	
				document.getElementById("tj").disabled=false;
			}
		}
		//验证账号
		function yz(){
			F=0;
			if(A+B+C+D+E+J+F+G!=8){
			document.getElementById("tj").disabled=true;
			}else{
			document.getElementById("tj").disabled=false;
			}
			var userId=document.getElementById("userId").value;
			if(userId==""){
					document.getElementById("tishi").innerHTML="<font size='1' color='red'></font>";
			}else{
				F=1;
				document.getElementById("tishi").innerHTML="<font  color='green'> 123</font>";
			}
				
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
			xhr.open('POST','../ChuLi?userId='+userId,true);
	  			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	  			xhr.setRequestHeader("Content-type","text/html;charset=UTF-8");
			
			xhr.onreadystatechange=function(){
				var st=xhr.readyState;
				if(st==4){
					var str=xhr.responseText;
					document.getElementById("tishi").innerHTML="<font color='red' size='2' >"+str+"</font>";
					
					
				}
			}
			xhr.send(null);			 	    	
			}
		
		
		
		
		
		//显示协议
        function showmvpuser()
        {
            document.getElementById("mvpuser").style.display = "block";
            document.getElementById("a1").style.display = "none";
            document.getElementById("a2").style.display = "block";
        }
        
        //隐藏协议
        function closemvpuser()
        {
            document.getElementById("mvpuser").style.display = "none";
            document.getElementById("a1").style.display = "block";
            document.getElementById("a2").style.display = "none";
        }
   </script>
  </head> 
  <body bgcolor="#EEE0E5" >
  	<form action="../UserRegServlet" method="post" name=form1>
  		<table width="1000" height="750" align="center" style="border: solid 1px #FFA54F;">
  			<tr><td colspan="4"><img src="../Image/zhuce.JPG" width="1000"/></td></tr>
  			<tr>
  				<td width="100">用户名：</td>
  				<td width="170">
					* <input type="text" name="userId"  id="userId" onBlur="yz()" >  	
				</td>
  				<td width="200">
			    	<div id="tishi" style="display:inline"></div>  		
			    </td>
			    <td rowspan="8" valign="top" align="left" width="550">
			    	<h4><img src="../Image/read.gif" alt="alt" />注册协议 </h4>
      				<textarea name="textarea" cols="35" rows="15">欢迎阅读注册协议，本协议阐述之条款和条件适用于您使用本网站的各种工具和服务。

本服务协议双方为贵美与贵美网用户，本服务协议具有合同效力。 
&nbsp;&nbsp;贵美的权利和义务
&nbsp;&nbsp;1.贵美有义务在现有技术上维护整个网上交易平台的正常运行，并努力提升和改进技术，使用户网上交易活动的顺利。 
&nbsp;&nbsp;2.对用户在注册使用贵美网上交易平台中所遇到的与交易或注册有关的问题及反映的情况，贵美应及时作出回复。 
&nbsp;&nbsp;3.对于在贵美网网上交易平台上的不当行为或其它任何贵美认为应当终止服务的情况，贵美有权随时作出删除相关信息、终止服务提供等处理，而无须征得用户的同意。 
&nbsp;&nbsp;4.因网上交易平台的特殊性，贵美没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查。	
				  </textarea>
				  <table align="center" height="100">
				  	<tr>
				  		<td height="33" colspan="4">
				  			<table>
				  				<tr>
				  					<td width="40"></td>
				  					<td width="350"> <input type="submit" value="同意协议并注册" id="tj"  disabled="disabled" > </td>
				  				</tr>
				  			</table>
			 
			  			</td>
				  
				  
				  	</tr>
				  	</table>
    	  		</td> 				
  			</tr>
  			<tr>
  				<td >密码：</td>
  				<td>* <input type="password" name="userPwd" id="userPwd" onBlur="mima()" /><br>
  					
  				</td>
  				<td>
  					<div id="mima" style="display:inline"></div>  			
  				</td>
  				
  			</tr>
  			
  			<tr>
  				<td>确认密码：</td>
  				<td>* <input type="password" name="userPwd1" id="userPwd1" onKeyUp="mima1()" ></td>
  				<td><div id="mima1" style="display:inline"></div></td>
  			</tr>
  			<tr>
  				<td>性别：</td>
  				<td>
  					 * <input type="radio" name="userSex" value="男"><img src="../Image/M.gif">
  					   <input type="radio" name="userSex" value="女" checked="checked"><img src="../Image/WM.gif">  			
   				</td>
  			</tr>
  			<tr>
  				<td>真实姓名：</td>
  				<td>* <input type="text" name="userName" id="userName" onKeyUp="mingzi()"> </td>
  				<td><div id="name" style="display:inline"></div></td>
  			</tr>
  			
  			<tr>
  				<td>身份证号：</td>
  				<td>* <input type="text" name="userIdCard" id="userIdCard" onKeyUp="IdCard()"> </td>
  				<td><div id="idCard" style="display:inline"></div>  				</td>
  			</tr>
  			
  			<tr>
  				<td>联系电话：</td>
  				<td>* <input type="text" name="userTelephone" id="userTelephone" onKeyUp="dianhua()"> </td>
  				<td><div id="dianhua" style="display:inline"></div>  				</td>
  			</tr>
  			
  			<tr>
  				<td height="53">邮箱:</td>
  				<td>* 
  				  <input type="text" name="userEmail" id="userEmail" onKeyUp="youxiang()"></td>
  				<td><div id="youxiang" style="display:inline"></div>  				</td>
  			</tr>
  			<tr >
  				 
  			
  			</tr>
  			
  			<tr><td height="50"></td></tr>
  			<tr>
  				<td colspan="4" align="center">
  					<table>
  			<tr>
  				<td colspan="4" align="center" height="100" style="font-size: 12px; text-align: center;" >
  					  <table style="text-align: center;">
  					  	<tr>
  					  		<td>
  					  		COPYRIGHT &copy;  2003-2010 <a href="#">南京市乐XXXXX</a> ALL RIGHT RESERVED<br />
  	 		 				热线：025-38383838 Email:service@xx.com<br />	
  					  		</td>
  					  	</tr>			  								  
  					  </table>
  				
  				</td>
  			
  			</tr>
  		
  		
  		</table>
  				
  				</td>
  			
  		</table>
  		
  	</form>
  </body>
</html>
