<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.adminServer.AdminServer"%>
<%@page import="com.entity.Film"%>
<%@page import="java.text.SimpleDateFormat"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'SelUnShow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">	
		function doChoose(filmId1,divId){
			document.getElementById("txtFilmId").value=filmId1;
			document.getElementById(divId).style.display="block";
		}
		var xhr;
		function doAjax(num){		
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
			var roomId = document.getElementById("playRoom").value;
			var txtTimeHour = document.getElementById("playTime1").value;
			var txtTimeMin = document.getElementById("playTime2").value;
			var txtTime=txtTimeHour+":"+txtTimeMin+":"+"00";
			var txtDate = document.getElementById("selDate").value;
			if(num==1){
				xhr.open('GET','showRoomMessage.jsp?roomId='+roomId);
			}else{
			alert("来咯额");
				xhr.open('GET','../TimeServlet?roomId='+roomId+'&txtDate='+txtDate+'&txtTime='+txtTime);
			}
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.onreadystatechange=function(){
				var st = xhr.readyState;
				if(st==4){
					var str = xhr.responseText;
					document.getElementById("roomMessage").innerHTML="<font color='red'>"+str+"</font>";
				}
			}
			xhr.send(null);
		}
		function yn(){
			var filmPrice = document.getElementById("filmPrice").value;
			var priceDiv=document.getElementById("priceTiShi");
			if(filmPrice.length==0){
				priceDiv.innerHTML="<font color='red'>请输入票价</font>";
				return false;
			}else if(filmPrice<=0){
				priceDiv.innerHTML="<font color='red'>票价为正数</font>";
				return false;
			}else{
				return true;
			}
		}
	</script>
	<style type="text/css">
		tr{
			height: 30px;
		}
	</style>
  </head>
  
  <body background="../Image/right_1.gif">
    <% 
  	Object denglu=session.getAttribute("denglu");
  	if(denglu==null){
  		response.sendRedirect("faileLogin.jsp");
  	}else{
  		AdminServer as=new AdminServer();
  		ArrayList<Film> list=as.selFilmUnShow();
 		%>
 		<table border="1">
			<tr>
				<td>编号</td>
				<td>电影名</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<% 
			for(int i=0;i<list.size();i++){
				String state="";
			int filmState=list.get(i).getFilmState();
			if(filmState==2){
				state="未上映";
			}else if(filmState==1){
				state="即将上映";
			}
			%>
			<tr>
				<td><%=list.get(i).getFilmId() %></td>
				<td><%=list.get(i).getFilmName() %></td>
				<td><%=state %></td>
				<td><input type="button" value="安排放映" onclick="doChoose('<%=list.get(i).getFilmId() %>','divId')"></td>
			</tr>
			<%
			}
			%>
 		</table>
  		<%
  	}
  	%>
	<div id="divId" style="display: none;">
	
	
		<form action="../addToPlayList" method="post" onsubmit="return yn()">	
		  	<table border="1" cellpadding="0" cellspacing="0" style="position: absolute;left:400px;top:200px;">
		  		<tr>
		  			<td>电影编号</td>
		  			<td><input type="text" id="txtFilmId" name="txtFilmId" readonly="readonly"></td>
		  		</tr>
		  		<tr>
		  			<td>请选择放映厅</td>
		  			<td>
		  				<select onchange="doAjax(1)" id="playRoom" name="playRoom">
		  					<option value="1">1号厅</option>
		  					<option value="2">2号厅</option>
		  					<option value="3">3号厅</option>
		  					<option value="4">4号厅</option>
		  					<option value="5">5号厅</option>
		  					<option value="6">6号厅</option>
		  				</select>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>选择放映日期</td>
		  			<% 
		  			Date date=new Date();
		  			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		  			Date date1 = new Date(date.getYear(),date.getMonth(),date.getDate()+1);
		  			Date date2 = new Date(date1.getYear(),date1.getMonth(),date1.getDate()+1);
		  			String dateStr1 = sdf.format(date);
		  			String dateStr2 = sdf.format(date1);
		  			String dateStr3 = sdf.format(date2);
		  			
		  			%>
		  			<td>
		  				<select id="selDate" name="selDate">
		  					<option value="<%=dateStr1 %>"><%=dateStr1 %></option>
		  					<option value="<%=dateStr2 %>"><%=dateStr2 %></option>
		  					<option value="<%=dateStr3 %>"><%=dateStr3 %></option>
		  				</select>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>输入放映时间</td>
		  			<td><input type="text" id="playTime1" name="playTime1" style="width: 40px;">时<input type="text" id="playTime2" name="playTime1" style="width: 40px;">分
		  			<input type="button" value="检索" onclick="doAjax(2)"/>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>请输入票价</td>
		  			<td><input type="text" name="filmPrice" id="filmPrice" style="width: 50px;">元<div id="priceTiShi" style="display: inline;"></div></td>
		  		</tr>
		  		<tr>
		  			<td colspan="2" align="center"><input type="submit" name="addToPlay" value="添加到放映表"></td>
		  		</tr>
		  	</table>
	  	</form>

	</div>
  	<div id="roomMessage" style="position: absolute;left:430px;top:400px;"></div>
  </body>
</html>
