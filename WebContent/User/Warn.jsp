<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>抢购结束提示</title>
    
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
  	if(session.getAttribute("seatNum1")==null){
  		response.sendRedirect("MyHome.jsp");
  	}else{
  	ArrayList list1 = (ArrayList)session.getAttribute("seatNum1"); //被其他人订购的票
  	ArrayList list2 = (ArrayList)session.getAttribute("seatNum2");  //用户定的所有的票
  %>
   	<div style="">
		 <table width="1000"  cellspacing="0" cellpadding="0" align="center">
		 	<tr>
		 		<td colspan="2" height="60"><jsp:include page="Top.jsp"></jsp:include></td>
		 	</tr>
		 </table><br/><br/><br/>
		 <table width="1000" height="800"  cellspacing="0" cellpadding="0" align="center" style="border:1px gray solid;" border="1">
		 	<tr>
		 		<td width="200" height="550"><jsp:include page="Left.jsp"></jsp:include></td>
		 		<td>
		 			<table align="center">
		 				<tr>
		 					<td>亲,你的手太慢了</td>
		 				</tr>
		 				<tr>
		 					<td>
		 						你所订购的：
		 						<% 
		 							for(int i=0;i<list2.size();i++){
		 						%>
		 						<%=list2.get(i)%>号座&nbsp;&nbsp;&nbsp;&nbsp;
		 						<%	
		 							}
		 						%>
		 						<br/>其中
		 						<% 
		 							for(int i=0;i<list1.size();i++){
		 						%><font color="red" size="3">
		 						<%=list1.get(i)%>号座</font>&nbsp;&nbsp;&nbsp;&nbsp;	
		 						<%	
		 							}
		 						%>
		 						已被其他人订购
		 					</td>
		 				<tr>
		 					<td>
		 						<a href="../FuKuan?biaoshi=0">点这里继续本次订购</a>&nbsp;&nbsp;&nbsp;&nbsp;
		 						<a href="BuyTicket.jsp">点这里取消本次订购重新选择</a>
		 					</td>
		 				</tr>
		 				</tr>
		 			</table>
		 			<table height="500"><tr><td></td></tr></table>
		 		</td>
		 		<td width="210"><jsp:include page="BuyTicketRight.jsp"></jsp:include></td>
		 	</tr>
		 </table> 
	</div>  
  <%	
  	}
   %> 
  </body>
</html>
