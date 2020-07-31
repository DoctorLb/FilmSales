<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.FilmShow"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.UserInfo"%>
<%@page import="com.entity.Vip"%>


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
  
  <body>
  	<%
		ArrayList<FilmShow> list = (ArrayList<FilmShow>)session.getAttribute("list"); 
		if(list==null||request.getParameter("hid1")==null){
			response.sendRedirect("MyHome.jsp");
		}else{
		int number = Integer.parseInt(request.getParameter("hidNum"));
		String[] num = new String[number];
		String[] hid = {"hid1","hid2","hid3","hid4"};
		String seatNum = "";
		for(int i=0;i<number;i++){
			num[i] = request.getParameter(hid[i]);
			if(i==(number-1)){
				seatNum=seatNum+num[i];
			}else{
				seatNum=seatNum+num[i]+"/";
			}
		}
		FilmShow fs = list.get(0);
		//String num1 = request.getParameter("hid1");
		//String num2 = request.getParameter("hid2");
		//String num3 = request.getParameter("hid3");
		//String num4 = request.getParameter("hid4");
		UserServer us = new UserServer();
		UserInfo users = (UserInfo)session.getAttribute("user");
		UserInfo user = us.selectMe(users.getUserId());
		Vip vip = us.selectVip(user.getUserScore());
		
	%>
		<table style="position: absolute;top:135px;width: 590px;">
			<tr>
				<td valign="top">
					<table width="560" style="border:1px gray solid;">
						<tr>
							<td colspan="3" height="30" width="500" bgcolor="gray" align="center">您的订单信息如下</td>
						</tr>
						<tr>
							<td width="120" height="180"><a href="SelectFilmById?filmId=<%=fs.getFilmId().getFilmId()%>"><img src="../<%=fs.getFilmId().getFilmImg()%>"/></a></td>
							<td height="180">
								<table>
									<tr>
										<td>
											<font color="green">电影名：</font><font color="red"><%=fs.getFilmId().getFilmName() %></font>&nbsp;&nbsp;
											<input type="hidden" id="filmhid" value="<%=fs.getFilmId().getFilmName() %>">
										</td>
									</tr>
									<tr>
										<td>
											<font color="green">导演：</font><font color="red"><%=fs.getFilmId().getDirector() %></font>&nbsp;&nbsp;	
										</td>
									</tr>
									<tr>
										<td><font color="green">主演：</font><font color="red"><%=fs.getFilmId().getActor() %></font></td>
									</tr>
									<tr>
										<td>
											<font color="green">片长：</font><font color="red"><%=fs.getFilmId().getFilmLong() %></font>&nbsp;&nbsp;
											<font color="green">类型：</font><font color="red"><%=fs.getFilmId().getFilmType() %></font>
										</td>
									</tr>
									<tr>
										<td>
											<font color="green">上映时间：</font><font color="red"><%=fs.getShowDate()+" "+fs.getShowTime() %></font>&nbsp;&nbsp;
											<input type="hidden" id="timehid" value="<%=fs.getShowDate()+" "+fs.getShowTime() %>">
										</td>
									</tr>
									<tr>
										<td>
											<font color="green">语言：</font><font color="red"><%=fs.getFilmId().getFilmLanguage() %></font>&nbsp;&nbsp;
											<font color="green">价格：</font><font color="red"><%=fs.getFilmPrice()%></font>
											<input type="hidden" id="pricehid" value="<%=fs.getFilmPrice()%>">
										</td>
									</tr>
									<tr>
										<td>
											<font color="green">放映厅：</font><font color="red"><%=fs.getRoomId().getRoomId().getRoomId()%></font><font color="green">号放映厅</font>&nbsp;&nbsp;
											<input type="hidden" id="roomhid" value="<%=fs.getRoomId().getRoomId().getRoomId()%>">
										</td>
									</tr>
									<tr>
										<td><font color="green">座位号:</font><font color="red">
										<% 
											for(int i=0;i<number;i++){
										%>
										<%=num[i]%>&nbsp;&nbsp;
										<%	
											}
										%></font></td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td><font color="green">您的账号:</font><%=user.getUserId() %></td>
									</tr>
									<tr>
										<td><font color="green">您的积分:</font><%=user.getUserScore()%></td>
									</tr>
									<tr>
										<td><font color="green">您享受的折扣:</font><%=vip.getZheKou()%>折</td>
									</tr>
									<tr>
										<td><font color="green">原来的总价:</font><%=fs.getFilmPrice()*number%>元</td>
									</tr>
									<tr>
										<td><font color="green">打折后的总价:</font><%=fs.getFilmPrice()*number*vip.getZheKou()/10%>元</td>
									</tr>
									<tr>
										<td><font color="green">您最终应付款:</font><%=fs.getFilmPrice()*number*vip.getZheKou()/10%>元</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td height="10"></td></tr>
			<tr>
				<td>
					<table>
						<tr>
							<td align="center" height="30" width="560" bgcolor="gray">确认无误后请选着您的付费方式</td>
						</tr>
						<tr><td height="10"></td></tr>
						<tr>
							<td align="center">
								<input border="0" type="radio" name="rad" checked="checked"/>会员卡&nbsp;&nbsp;&nbsp;&nbsp;
								<input border="0" type="radio" name="rad"/>银行卡&nbsp;&nbsp;&nbsp;&nbsp;
								<input border="0" type="radio" name="rad"/>支付宝&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</table><br/>
					<div id="div1" style="">
					<form action="../doFuKuan" method="post">
						<table style="" width="560">
							<tr>
								<td align="right" width="220"><font size="2">会员卡编号：</font></td>
								<td><input type="text" style="height: 25px;width: 160px;" name="id"/>
								</td>
							</tr>
							<tr><td height="10"></td></tr>
							<tr>
								<td align="right"><font size="2">会员卡密码：</font></td>
								<td>
									<input type="password" style="height: 25px;width: 160px;" name="pwd"/>
								</td>
							</tr>
							<tr><td height="10"></td></tr>
							<tr>
								<td>
									<input type="hidden" name="showId" value="<%=fs.getShowId() %>"/>
									<input type="hidden" name="seatNum" value="<%=seatNum%>"/>
									<input type="hidden" name="price" value="<%=fs.getFilmPrice()*vip.getZheKou()/10%>"/>
									<input type="hidden" name="hidNum" value="<%=number %>"/>
									<input type="hidden" name="hidPrice" value="<%=fs.getFilmPrice()*number*vip.getZheKou()/10%>"/>
								</td>
							</tr>
							<tr>
								<td align="right"></td>
								<td>
								<input height="30" type="submit" value="确认支付"/>&nbsp;
								<input height="30" type="reset" value="取消支付"/></td>
							</tr>
						</table>
					</form>
					</div>
				</td>
			</tr>
		</table>
	<%	
		}
	%>
	
  </body>
</html>
