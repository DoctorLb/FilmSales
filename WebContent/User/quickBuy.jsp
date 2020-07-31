<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 	<script type="text/javascript">
 		function setDateDiv(){
 			var dates = document.getElementById("dates").value;
 			var today =	document.getElementById("today").value;
 			var tomorrow =	document.getElementById("tomorrow").value;
 			var houtian =	document.getElementById("houtian").value;
 			if(dates==today){
 				document.getElementById("todaydiv").className="timediv1";
 				document.getElementById("tomorrowdiv").className="tdiv2";
 				document.getElementById("houtiandiv").className="tdiv2";
 			}
 			if(dates==tomorrow){
 				document.getElementById("tomorrowdiv").className="timediv1";
 				document.getElementById("todaydiv").className="tdiv2";
 				document.getElementById("houtiandiv").className="tdiv2";
 			}
 			if(dates==houtian){
 				document.getElementById("houtiandiv").className="timediv1";
 				document.getElementById("todaydiv").className="tdiv2";
 				document.getElementById("tomorrowdiv").className="tdiv2";
 			}
 		}
 	
 	</script>
 </head>
 <style>
 	.timediv1{ background-color:#969696;  }
 	.tdiv2{ background-color:#EEE9E9;}
 
 </style>

	<link rel="stylesheet" type="text/css" href="a.css">

 <style>
	.xmenu 
	td{font-size:12px;font-family:verdana,arial;color:#ffffff;border:1px thin #336633;background:#CC3366;filter:blendtrans(duration=0.5);cursor:hand;text-align:center;}
</style>
 <body bgcolor="#EEE9E9" onload="setDateDiv()">
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	if(request.getParameter("fromServlet")==null){
		response.sendRedirect("../QuickBuyServlet");
	}
 %>
<table cellspacing="1" align="center" bgcolor="#EEE9E9">
  	  <tr><td colspan="3" width="1000" height="100" valign="top"><%@ include file="Top.jsp"%></td></tr>
	  <tr>
	  	<td width="200px"><jsp:include page="Left.jsp"></jsp:include></td>
	  	<td>
	  		<table width="600px" height="700">
	  			<tr><td height="40px"><span id="todaydiv"><a href="../QuickBuyServlet?date=${today}" style="text-decoration: none;">${today}[今天]</a></span><span id="tomorrowdiv"><a href="../QuickBuyServlet?date=${tomorrow}" style="text-decoration: none;">  ${tomorrow}[明天]</a></span><span id="houtiandiv"> <a href="../QuickBuyServlet?date=${houtian}" style="text-decoration: none;"> ${houtian}[${week}]</a></span></td></tr>
    			<tr>
      				<td height="67" width="650" height="50" valign="top">
      					<table width="600" style="border: 0px gray solid"><c:set var="nameList" value="${showList}"></c:set>		
			      			<tr>
			      				<td valign="top" height="100px">
			      					
			      					<div style="height: 100px;width:600px; background-color: lightgray; "> 
			      						<div><font color="red">请选择电影</font> </div><br/>
						      			<c:forEach var="nameList2" items="${nameList}">
						      			<a href="../QuickBuyServlet?filmName=${nameList2.filmId.filmName}" style="text-decoration: none;">${nameList2.filmId.filmName}</a>
						      			</c:forEach>
						      		</div>
						      		<div align="right" style="background-color: lightgray;"><a href="../QuickBuyServlet?showall=yes"><font size="2" color="red">展开全部${totalShow}部>></font></a></div>
			      				</td>
			      			</tr>
			      			<tr><td height="15px"></td></tr>		      				 
					    	<tr>
					    		<td>			    
					    			<div style="width: 600px; height: 80px;background-color: lightgray;">
					    				<span><font color="red">您当前已选择:</font></span><br/><br/>
					    				<span id="date" style="background-color: lightgray;">${sessionScope.dates}</span>&nbsp;&nbsp; 
					    				<span id="filmName" style="background-color: lightgray;">${selectName}</span>
					    			</div>
					    		</td>
					    	</tr>
					    	<tr><td height="15px"></td></tr>					 
					    	<tr>
					      		<td colspan="2" valign="top">
					      			<table width="600"  style="background-color: lightgray;" border="0" cellspacing="1">
			      						<tr valign="top"><td><span><font color="red">选择排片场次:</font> </span><br/></td></tr>
			      						<tr valign="top"><td height="15px"></td></tr>
						      			<tr valign="top" bgcolor="gray">
							      			<td width="100">日期</td>
							      			<td width="100">时间</td>
							      			<td width="100">放映厅</td>
							      			<td width="100">放映电影</td>
							      			<td width="100">票价</td>
							      			<td width="100">操作</td>
						      			</tr>
						      			<tr valign="top"><td height="10px"></td></tr>
						      			<c:set var="fangyingList" value="${filmDateShow}"></c:set>
						      			<c:forEach var="fangying" items="${fangyingList}">
								      		<tr valign="top" height="50px">
								      			<td>${fangying.showDate}</td>
								      			<td>${fangying.showTime}</td>
								      			<td>${fangying.roomId.roomId.roomId}</td>
								      			<td width="200">${fangying.filmId.filmName}</td>
								      			<td><font color="red">${fangying.filmPrice}</font></td>
								      			<td>
	    										<form action="../doBuyTicket" method="post">
	    										<table>
	    										<tr>
	    										<td><input type="hidden" name="filmName" value="${fangying.filmId.filmName}"/></td>
	    										<td><input type="hidden" name="filmTime" value="${fangying.showDate}+' '+${fangying.showTime}"/></td>
	    										<td><input type="hidden" name="filmRoom" value="${fangying.roomId.roomId.roomId}"/></td>
	    										<td><input type="image" src="../Image/buyBtn.jpg"/></td>
	    										</tr>
	    										</table>
	    										</form>
	    										</td>
								      		</tr>
								      		<tr><td height="10px"></td></tr>				
						      			</c:forEach>
					      			</table>
					     		 </td>
					   		 </tr>
      					</table>
      				</td>
    			</tr>	  		
			</table>
		</td>
		<td width="200" height="550" align="right" valign="top">
			<c:if test="${totalShow>0}">
			<table><tr><td height="65px"></td></tr></table>
			<table>
				<tr><td><input type="image" src="../${showfilm.filmImg}" alt="暂无图片"/></td></tr>
				<tr><td>片名:${showfilm.filmName}</td></tr>
				<tr><td>片长:${showfilm.filmLong}</td></tr>
				<tr><td>导演:${showfilm.director}</td></tr>
				<tr><td>主演:${showfilm.actor}</td></tr>
				<tr><td>类型:${showfilm.filmType}</td></tr>
				<tr><td>语言:${showfilm.filmLanguage}</td></tr>
			</table>
			</c:if>
		</td>
	</tr>
</table>
<input type="hidden" id="dates" value="${dates}"/>
<input type="hidden" id="today" value="${today}"/>
<input type="hidden" id="tomorrow" value="${tomorrow}"/>
<input type="hidden" id="houtian" value="${houtian}"/>
</body>
</html>
