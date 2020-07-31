<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Film"%>
<%@page import="com.userServer.UserServer"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>购票</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="a.css">
	<script type="text/javascript"><!--
		function fuZhi(){
			var hid = [];
			hid[0]="hid1";hid[1]="hid2";hid[2]="hid3";hid[3]="hid4";
			document.getElementById("hidNum").value = number;
			//alert(document.getElementById("hidNum").value);
			if(seatNum.length>0){
				for(i=0;i<seatNum.length;i++){
					document.getElementById(hid[i]).value = seatNum[i]; //循环把选的座位号付给隐藏域
				}
			}
		}
		function yz1(name){
			name.className="yz1";
		}
		/*function yz2(){
			
			var film = document.getElementById("filmhid").value;
			var time = document.getElementById("timehid").value;
			var room = document.getElementById("roomhid").value;
			var price = document.getElementById("pricehid").value;
			var num1 = document.getElementById("hid1").value;
			var num2 = document.getElementById("hid2").value;
			var num3 = document.getElementById("hid3").value;
			var num4 = document.getElementById("hid4").value;
			var userIdCard = document.getElementById("userIdCard").value;
			var telephone = document.getElementById("telephone").value;
			
			var flage = confirm("您提交的信息如下:\n身份证号:"+userIdCard+"\n手机号:"+telephone+
			"\n电影:"+film+"\n放映时间:"+time+"\n放映厅:"+room+"\n价格:"+price+"\n票的数量:"+num+
			"\n座号:"+num1+" "+num2+" "+num3+" "+num4+"\n请确认以上信息是否有误！！！");
			if(flage){
				return true;
			}else{
				return false;
			}
		}*/
		function yz(){
			var hid = [];
			hid[0]="hid1";hid[1]="hid2";hid[2]="hid3";hid[3]="hid4";
			document.getElementById("hidNum").value = number;
			if(seatNum.length>0){
				for(var i=0;i<seatNum.length;i++){
					document.getElementById(hid[i]).value = seatNum[i]; //循环把选的座位号付给隐藏域
				}
			}
			var userIdCard = document.getElementById("userIdCard").value;
			var telephone = document.getElementById("telephone").value;
			if(userIdCard.length>0&&telephone.length>0){
				if(num==0){
					return false;
				}else{
					return true;
				}
			}else{
				if(userIdCard.length==0){
					document.getElementById("userIdCard").className="yz";
				}
				if(telephone.length==0){
					document.getElementById("telephone").className="yz";
				}
				return false;
			}
			return false;
			
		}
	--></script>
	<style type="text/css">
		.yz{
			border: 2px red solid;
		}
		.yz1{
			border: 1px gray solid;
		}
	</style>
  </head>
  
  <body>
  <%
  	 UserServer us1 = new UserServer();
	 ArrayList<Film> list3 = us1.selFilmAdminWill(); //获得网站推荐的即将上映的电影的信息
  %>
    <table style="position: absolute;top:140px;" >
    
    	<tr>
    		<td>
    			<table style="width:195px;border:1px gray solid;">
    				<tr><td height="30" bgcolor="gray" align="center"><font size="3">用户购票须知</font></td></tr>
    				<tr>
    					<td><br/>
    						1，请在<font color="red">左侧座位图</font>选择座位<br/>&nbsp;&nbsp;&nbsp;&nbsp;
    						单击选择座位，再次点击<br/>&nbsp;&nbsp;&nbsp;&nbsp;
    						即取消选择;<br/><br/>
    						2，每个场次最多可购<font color="">4</font>张票;<br/><br/>
    						3，选完座位之后请务必填写<br/>&nbsp;&nbsp;&nbsp;&nbsp;
    						下面的<font color="red">用户购票单</font>;<br/><br/>
    					</td>
    				</tr>
    			</table>
    		</td>
    	</tr>
    	
    	<tr><td height="20"></td></tr>
    	<tr>
    		<td>
    		<form action="FuKuan.jsp" method="post" onsubmit="return yz()"> 
    			<table style="width:195px;border:1px gray solid;">
    				<tr>
    					<td>
    						<input type="hidden" id="hid1" name="hid1" />
    						<input type="hidden" id="hid2" name="hid2" />
    						<input type="hidden" id="hid3" name="hid3" />
    						<input type="hidden" id="hid4" name="hid4" />
    						<input type="hidden" id="hidNum" name="hidNum" value="">
    					</td>
    				</tr>
    				<tr>
    					<td height="30" bgcolor="gray" align="center"><font size="3">用户购票单</font></td>
    				</tr>
    				<tr>
    					<td>请输入您的身份证号：</td>
    				</tr>
    				<tr>
    					<td><input type="text" id="userIdCard" name="userIdCard" height="25" width="150" onfocus="yz1(this)"/></td>
    				</tr>
    				<tr>
    					<td>请输入您的手机号：</td>
    				</tr>
    				<tr>
    					<td><input type="text" id="telephone" name="telephone" height="25" width="150" onfocus="yz1(this)"/></td>
    				</tr>
    				<tr>
    					<td><input type="submit" value="提 交" onmouseover=""></td>
    				</tr>
    			</table>
    		</form>	
    		</td>
    	</tr>
    	
    	<tr><td height="20"></td></tr>
    	<tr>
    		<td height="30" bgcolor="gray" align="center"><font size="3">即将上映,敬请关注</font></td>
    	</tr>
    	<tr>
    		<td width="180">
    		<table style="width:195px;border:1px gray solid;">
    			<tr><td>
    			<marquee height="300" direction="down" onmouseover="this.stop()" onmouseout="this.start()">
    			<% 
    				for(int i =0;i<list3.size();i++){
    					Film fm = list3.get(i);
    			%>
    				<table style="width:190px;border:1px gray solid;" >
    					<tr>
    						<td>
    							<a href=""><img height="60" width="45" src="../<%=fm.getFilmImg() %>"/></a>
    						</td>
    						<td>
    							<table>
    								<tr><td><font color="green"><%=fm.getFilmName() %></font></td></tr>
    								<tr><td>主演：<%=fm.getActor() %></td></tr>
    								<tr><td></td></tr>
    							</table>
    						</td>
    					</tr>
    				</table>
    			<%		
    				}
    			%>
    			</marquee>
    			</td></tr>
    		</table>
    		</td>
    	</tr>
    	
    	
    	
    </table>
  </body>
</html>
