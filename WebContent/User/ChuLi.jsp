<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>购票</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		var time = 4;
		function show(){
			time--;
			document.getElementById("sp").innerHTML = time;
			if(time<=0){
				window.location="BuyTicket.jsp";
			}
			setTimeout("show()",1000);
		}
	</script>
  </head>
  
  <body onload="show()">
    <%
    	if(request.getParameter("biaoji")==null){
    		response.sendRedirect("MyHome.jsp");
    	}else{
    		if(request.getParameter("biaoji").equals("1")){
    			//response.setHeader("refresh","3;BuyTicket.jsp");
    %>
	<a><font color='red'>账号或密码错误</font>系统将在<span id="sp">3</span>秒钟后将返回 ！</a>
    <%			
    		}else if(request.getParameter("biaoji").equals("0")){
    			response.setHeader("refresh","3;MyHome.jsp");
    %>
    <a><font color='red'>订购成功</font>系统将在<span id="sp">3</span>秒钟后跳转到主页 ！</a>
    <%			
    		}
    	}
     %>
  </body>
</html>
