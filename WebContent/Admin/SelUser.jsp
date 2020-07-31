<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.adminServer.AdminServer"%>
<%@page import="com.entity.UserInfo"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'SelUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="admin.css">
	-->
	<script language="javascript">
		function fenye(){
			<%--得到当前页数 --%>
			var pagesFenYe=document.getElementById("fenye1").value;
			<%-- --%>	
			var rowNumber1=document.getElementById("rowCount").value;
			if(pagesFenYe==0){
				document.getElementById("shang").style.display="none";
			}else if(pagesFenYe==(rowNumber1-1)){
				document.getElementById("xia").style.display="none";
			}
		}
	</script>
	<style type="text/css">
		tr{
			height: 30px;
			font-size: 14;
		}
		td{
			width: 80px;
			font-size: 14;
		}
	</style>
  </head>
  
  <body onload="fenye()" background="../Image/right_1.gif">
   <% 
   	request.setCharacterEncoding("UTF-8");
   	Object denglu=session.getAttribute("denglu");
  	if(denglu==null){
  		response.sendRedirect("faileLogin.jsp");
  	}else{
	   	int pages=0;
	   	AdminServer as=new AdminServer();
	   	//行数
	   	int rowNumber=as.rowCount();
	   	//页数
	   	int pageNumber=0;
	   	// 页数和行数的关系
	   	if(rowNumber%10==0){
	   		pageNumber=rowNumber/10;
	   	}else{
	
	   		pageNumber=rowNumber/10+1;
	   		
	   	}
	   	ArrayList<UserInfo> userList=new ArrayList<UserInfo>();   
	   	Object objPage=session.getAttribute("objPage");
	   	Object objBiaoShi=session.getAttribute("objBiaoShi"); 
	   	//session中拿不到页数的只，并且为未点上一页或下一页，表明是首页
	   	if(objPage==null&&objBiaoShi==null){
	   		userList=as.selAllUser(pages);
	   		session.setAttribute("objPage",pages);
	   	}else{
	   		pages=Integer.parseInt(objPage.toString());
	   		if(session.getAttribute("userList")!=null){
	   			userList=(ArrayList<UserInfo>)session.getAttribute("userList");
	   		}else{
	   			userList=as.selAllUser(pages);
	   		}			
	   	}
	   	%>
	   	<table cellpadding="0" cellspacing="0" border="1" style="position: absolute;left:60px;top:20px;">
	   		<tr>
	   			<td>用户名</td>
	   			<td>真实姓名</td>
	   			<td>身份证号</td>
	   			<td>性别</td>
	   			<td>余额</td>
	   			<td>积分</td>
	   			<td>电话</td>
	   			<td>邮箱</td>
	   		</tr>
	   		<% 
	   		for(int i=0;i<userList.size();i++){
	   			%>
	   			<tr>
		    		<td><%=userList.get(i).getUserId() %></td>
		    		<td><%=userList.get(i).getUserName() %></td>
		    		<td><%=userList.get(i).getUserIdCard() %></td>
		    		<td><%=userList.get(i).getUserSex() %></td>
		    		<td><%=userList.get(i).getUserMoney() %></td>
		    		<td><%=userList.get(i).getUserScore() %></td>
		    		<td><%=userList.get(i).getUserTelephone() %></td>
		    		<td><%=userList.get(i) .getUserEmail()%></td>
	    		</tr>
	   			<%
	   		}
	   		%>  
	   		<tr>
	   			<td colspan="8" align="right">
	   				<div id="shang"><a href="../SelUserServlet?objBiaoShi=s">上一页</a></div>
	   				<div id="xia"><a href="../SelUserServlet?objBiaoShi=x">下一页</a></div>
	   			</td>
	   		
	   		</tr> 			   							   			
	   	</table>   	
	   		<input type="hidden" id="fenye1" value="<%=pages %>">
	   		<input type="hidden" id="rowCount" value="<%=pageNumber %>"> 
   		<% 
   	}
   		%>
  </body>
</html>
