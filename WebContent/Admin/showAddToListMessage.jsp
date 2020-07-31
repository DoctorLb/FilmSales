<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'showAddToListMessage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		var time=3;
		function yn(){
			var div=document.getElementById("div1");
			var a=document.getElementById("objInt1").value;
			if(a==1){
				div.innerHTML="<font color='red'>添加成功</font>";
			}else if(a==2){
				div.innerHTML="<font color='red'>添加失败</font>";
			}else if(a==3){
				div.innerHTML="<font color='red'>请检查放映厅是否可用</font>";
			}
			time--;
			setTimeout("yn()",1000);
		}
	</script>
  </head>
  
  <body onload="yn()" background="../Image/right_1.gif">
    <% 
    response.setHeader("refresh","3;url=SelUnShow.jsp");
    Object obj=session.getAttribute("UpdPlayList");
    int objInt=Integer.parseInt(obj.toString());
    %>
    <div id="div1"></div>
    <input type="hidden" id="objInt1" value="<%=objInt %>">
    <%
  	
    %>
  </body>
</html>
