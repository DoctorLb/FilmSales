<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.FilmShow"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>付款</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="a.css">

  </head>
  
<body bgcolor="#EEE8CD">

	
	<% 
		ArrayList<FilmShow> list = (ArrayList<FilmShow>)session.getAttribute("list"); 
		if(list==null){
			response.sendRedirect("MyHome.jsp");
		}else{
	%>
	<div style="">
		 <table width="1000"  cellspacing="0" cellpadding="0" align="center">
		 	<tr>
		 		<td colspan="2" height="60"><jsp:include page="Top.jsp"></jsp:include></td>
		 	</tr>
		 </table>
		 <table width="1000" height="800"  cellspacing="0" cellpadding="0" align="center" style="border:1px gray solid;" border="1">
		 	<tr>
		 		<td width="200" height="550"><jsp:include page="Left.jsp"></jsp:include></td>
		 		<td><jsp:include page="FuKuanCenter.jsp"></jsp:include></td>
		 			<td width="200" style="font-size: 14px;border:0px; font-family:宋体;" valign="top">
    				
    				<table><tr><td width="200" align="center"><img src="../Image/fuwu.jpg" name="fuwu"/></td></tr></table>
    				<table><tr><td width="190" height="30" bgcolor="#EE7921" align="center"><font color="white" size="2">在线客服</font></td></tr></table>
    				
    				<marquee  behavior="scroll" direction="up" onmouseover="this.stop()" onmouseout="this.start()">
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:785976562</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:121212121</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:383838383</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:666666666</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:785976562</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:121212121</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:383838383</a><br/><br/>
    					<a href="#"><font color="red">在线客服&nbsp;</font>QQ:666666666</a><br/><br/>
    				</marquee>
    				<table><tr><td width="190" height="30" bgcolor="#EE7921" align="center"><font color="white" size="2">联系我们</font></td></tr></table>
    				<img width="200" src="../Image/map.JPG"/><br/><br/>
    				<font color="red">办公室：</font><font color="green">025-38383838</font><br/><br/>
    				<font color="red">传 &nbsp;真：</font><font color="green">025-88830300</font><br/><br/>
    				<font color="red">地 &nbsp;址：</font><font color="green">南京市XXXXXX<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXXX国际大厦</font><br/><br/>
    				
    				<br/>

    				<div style="position:absolute;left:770;top:220; display: block;height: 30px;background-color:#EEB4B4;" id="attention" ></div>
    			</td>
		 	</tr>
		 </table> 
	</div>	
	<%	
		}
	%>
	          
</body>
</html>
