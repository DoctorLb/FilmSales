<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'ShowAdmin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <% 
  Object obj1=session.getAttribute("adminId");
  String adminId="";
  if(obj1!=null){
  	adminId=obj1.toString();
  }
  %>
    <table border="1" cellpadding="0" cellspacing="0" width="1004px;" style="position: absolute;top:0px;left: 0px;right: 0px;">
    	<tr height="28px">
    		<td colspan="2" width="1000px;" background="../Image/title_bg1.jpg">欢迎登陆！</td>
    	</tr>
    	<tr height="100px;">
    		<td width="90px;" background="../Image/admin_p.gif"></td>
    		<td width="910px;" align="center"><%=adminId %><br>欢迎进入乐影网后台管理中心</td>
    	</tr>
    	<tr height="22px;" align="center">
    		<td colspan="2" background="../Image/title_bg2.jpg">订单信息</td>
    	</tr>
    </table>
  </body>
</html>
