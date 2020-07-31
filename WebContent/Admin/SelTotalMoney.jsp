<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Money"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'SelTotalMoney.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		tr{
			height: 30px;
		}
	</style>
  </head>
  
  <body background="../Image/right_1.gif">
   <% 
    Object denglu=session.getAttribute("denglu");
    if(denglu==null){
    	response.sendRedirect("faileLogin.jsp");
    }else{
   		Object objBiaoShi=session.getAttribute("moneyBS");
   		%>
   		<form action="../ShowMoney" method="post">
		   	<table style="position: absolute;left:200px;top:100px;">
		   		<tr>
		   			<td>
		   				<select name="chooseTxt" id="chooseTxt">
		   					<option value="电影名">电影名</option>
		   					<option value="所有">所有</option>
		   				</select>
		   			</td>
		   			<td><input type="text" name="txtFilmName" id="txtFilmName"></td>
		   			<td><input type="submit" name="selMoney" id="selMoney" value="统计售票情况"></td>
		   		</tr>
		   	</table>
		</form>
   		<%
		if(objBiaoShi!=null){
			int biaoshi=Integer.parseInt(objBiaoShi.toString());
			if(biaoshi==1){
				String filmName=session.getAttribute("filmName").toString();
				String totalMoneyStr=session.getAttribute("totalMoney").toString();
				double totalMoney=Double.parseDouble(totalMoneyStr);
				%>
				<table border="1" cellpadding="0" cellspacing="0" style="position: absolute;left:220px;top:150px;">
					<tr>
						<td width="150px;">电影名</td>
						<td width="150px;">销售额</td>				
					</tr>
					<tr>
						<td><%=filmName %></td>
						<td><%=totalMoney %>元</td>
					</tr>
				</table>
				<%
				session.removeAttribute("moneyBS");
				session.removeAttribute("filmName");
				session.removeAttribute("totalMoney");
			}else if(biaoshi==2){
				ArrayList<Money> list=(ArrayList<Money>)session.getAttribute("allMoney");
				%>
				<table cellpadding="0" cellspacing="0" border="1" style="position: absolute;left:220px;top:200px;">
					<tr>
						<td width="150px;">电影名</td>
						<td width="150px;">销售额</td>
					</tr>
					<% 
					double allMoney1=0;
					for(int i=0;i<list.size();i++){
						allMoney1+=list.get(i).getMoney();
						%>
						<tr>
							<td  width="150px;"><%=list.get(i).getFilm().getFilmName() %></td>
							<td  width="150px;"><%=list.get(i).getMoney() %></td>
						</tr>
						<%
					}
					%>
					<tr>
						<td colspan="2" align="right" width="300px;">总营业额是：<font color="red"><%=allMoney1 %></font>元</td>
					</tr>
				</table>
				<%
				session.removeAttribute("moneyBS");
				session.removeAttribute("allMoney");
			}else if(biaoshi==3){
				%>
				<div style="position: absolute;left:250px;top:150px;">
					<font color="red">请输入电影名</font>
				</div>
				<%
			}else if(biaoshi==4){
				%>
				<div style="position: absolute;left:250px;top:150px;">
					<font color="red">该电影还没有销售额</font>
				</div>
				<%
			}
			session.removeAttribute("moneyBS");
		}
	}
   %>
  </body>
</html>
