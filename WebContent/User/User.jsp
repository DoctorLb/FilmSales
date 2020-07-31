<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->	
  </head>
  <%-- 框架    分上下2部分--%>
  <frameset rows="20%,80%" >
  	<frame src="Top.jsp" scrolling="no" />
  	<!--把下面的 部分再分为左右2部分 -->
  	<frameset cols="20%,80%">
  		<frame src="youbian.jsp"   scrolling="no" />
  		<frame src="ShowMe.jsp" name="right"  scrolling="no" />
  	</frameset> 	
  </frameset>  
</html>
