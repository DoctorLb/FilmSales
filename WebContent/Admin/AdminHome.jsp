<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>后台主界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
 	<frameset rows="120px;,*" framespacing="0" frameborder="no">
 		<frame src="top.jsp" noresize="noresize" scrolling="no">
 		<frameset cols="220px;,*" >
 			<frame src="left.jsp" noresize="noresize" scrolling="no">
 			<frame name="right" src="right.jsp">
 		</frameset>
 	</frameset>
</html>
