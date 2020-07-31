<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.PingJia"%>
<%@page import="com.entity.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript">
   		function hiddenPage(){
  			var pages=document.getElementById("yeshu").value;
  			var nextSize=document.getElementById("nextSize").value;
 			if(pages==0){
  				document.getElementById("upPage").style.display="none";
  			}
  			if(nextSize==0){
  				document.getElementById("downPage").style.display="none";
  			}
  		}	
   </script>
	
  </head>
  
  <body onload="hiddenPage()">
  	<%	
  		session.setAttribute("userInfobiaoshi",4);
  		UserInfo user = (UserInfo)session.getAttribute("user");
		String userId = user.getUserId();
		String biaoshi=request.getParameter("biaoshi");
		int p=0;
		//如果biaoshi 不为空 
		if(biaoshi!=null){
				/*
				此处session.getAttribute("page")不会报空指针 无论biaoshi是否为空 
				session.setAttribute("page",p);
				*/
				p=Integer.parseInt(session.getAttribute("page").toString());
				if(biaoshi.equals("shang")){
					p--;
					response.sendRedirect("UserInfo.jsp?biaoshi=1");	
				}else if(biaoshi.equals("xia")) {
					p++;
					response.sendRedirect("UserInfo.jsp?biaoshi=1");
				}
		}else{
			p=0;
		}
		session.setAttribute("page",p);
		UserServer us = new UserServer();
		ArrayList<PingJia> list = us.getAllPingJia(userId,p);
		ArrayList list2 = us.getAllPingJia(userId,p+1);	
	%>
	
    <table align="center" width="560" height="300" bgcolor="#EEE5DE" style="text-align: center;">
    	<tr><td colspan="3" bgcolor="#EED5D2">我的评论</td></tr>
    	<tr><td height="30"></td></tr>
    	<tr>
    		<td width="150">电影名称</td>
    		<td width="150"><center>评价内容</center></td>
    		<td width="260"><center>评价时间</center></td>
    			
    	</tr>
    	<% 
    		for(int i=0;i<list.size();i++){
    			PingJia pj = list.get(i);
    	%>
    	<tr>
    		<td ><%=pj.getFilmId().getFilmName() %></td>
    		<td><%=pj.getPingJia() %></td>
    		<td><%=pj.getTime() %></td>
    	</tr>
    	<% 		
    		}
    	%>
    	<tr><td height="10"></td></tr>
    	<tr><td><span id="upPage"><a href="UserInfo.jsp?biaoshi=shang">上一页</a></span><span id="downPage"><a href="UserInfo.jsp?biaoshi=xia">下一页</a></span></td></tr>
    </table>
     <table><tr><td height="440"></td></tr></table>
    <input type="hidden" value=<%=p %> id="yeshu"/>
    <input type="hidden" value=<%=list2.size() %> id="nextSize"/>
   
  </body>
</html>
