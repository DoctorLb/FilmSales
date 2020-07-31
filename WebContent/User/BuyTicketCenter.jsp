<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.FilmShow"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<% 
		ArrayList<FilmShow> list = (ArrayList<FilmShow>)session.getAttribute("list"); 
		UserServer us = new UserServer();
		UserInfo user = (UserInfo)session.getAttribute("user");
		int number = us.seleNum(user.getUserId(),list.get(0).getShowId());
	%>
	<script type="text/javascript">
		var num = 0;
		var number = 4-<%=number%>;//还可以订几张票
		var seatNum = [];
		function chang(name){
			
			var str1 = name.src;
			var str4 = str1.split("/");;
			var i = str4.length-1;
			var str = "../Image/"+str4[i];
			var str2 = "../Image/zuo1.JPG"; 
			var str3 = "../Image/zuo3.JPG";//alert(str+"||"+str2+"||"+str3);
			if(str==str2){
				if(num>3-<%=number%>){
					alert("最多只能定 4张票,您已经定过了 "+<%=number%>+"张票 ");
					return;
				}
				seatNum[num]=name.value;
				num++;
				name.src="../Image/zuo3.JPG";
			}
			else if(str==str3){
				name.src="../Image/zuo1.JPG";
				num--;	//alert(num);
				seatNum[num]="";
			}
		}
	</script>
  </head>
  
  <body>
  	
  	<%
  		   
 	 	session.setAttribute("userInfobiaoshi",6);
 
		if(list==null){
			response.sendRedirect("MyHome.jsp");
		}else{
		FilmShow fs = list.get(0);
	%>
		<table style="position: absolute;top:135px;width: 590px;">
			<tr>
				<td valign="top">
					<table width="560" style="border:1px gray solid;">
						<tr>
							<td width="120" height="180"><a href="../SelectFilmById?filmId=<%=fs.getFilmId().getFilmId()%>"><img src="../<%=fs.getFilmId().getFilmImg()%>"/></a></td>
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
										<td><font color="green">已有</font><font color="red"><%=fs.getFilmId().getFilmScore()%></font><font color="green">用户关注</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="560" style="border:1px gray solid;">
						<tr>
							<td bgcolor="gray" height="30"><font color="green">电影简介</font></td>
						</tr>
						<tr><td height="120" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%=fs.getFilmId().getJianJie() %></td></tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="560" style="border:1px gray solid;">
						<tr>
							<td align="center" bgcolor="gray" height="30">
								<img height="20" width="20" src="../Image/zuo1.JPG"/>可选座位&nbsp;&nbsp;
								<img height="20" width="20" src="../Image/zuo2.JPG"/>以售出座位&nbsp;&nbsp;
								<img height="20" width="20" src="../Image/zuo3.JPG"/>您选择的座位&nbsp;&nbsp;
								<img height="20" width="20" src="../Image/zuo4.JPG"/>正在维修&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td><img width="550" height="50" src="../Image/pingmu.JPG"/></td>
						</tr>
						<tr>
							<td align="center" bgcolor="gray"><font color="red">请连续选择座位,最好不要留下单个的空闲座位!谢谢合作！</font></td>
						</tr>
						<% 
							//获得放映厅的行和列  
							int[] rm = us.selRoom(fs.getRoomId().getRoomId().getRoomId());
						%>
						<tr>
							<td>
								<table align="center">
								<% 
									int num = 0; //座位号
									for(int i=0;i<rm[0];i++){
								%>
									<tr>
									<% 
										for(int j=0;j<rm[1];j++){
											num++;
											int a = us.selSeatState(fs.getRoomId().getRoomId().getRoomId(),num);
											if(a==1){ //表示这个座位坏了
									%>
										<td>
											<img width="30" height="30" src="../Image/zuo4.JPG"/>
										</td>
									<%		
											}else{  //表示这个座位没有坏
												//判断该座位是否被订购
												boolean b = us.selSeatNum(fs.getShowId(),num);
												if(b){ //该座位已经被订购
									%>
										<td>
											<img width="30" height="30" src="../Image/zuo2.JPG"/>
										</td>
									<%			
												}else{ //该座位还没有被订购
									%>
										<td>
											<input style="border: 0px;" width="30" height="30" type="image" value="<%=num %>" src="../Image/zuo1.JPG" onclick="chang(this)">
										</td>
									<%			
												}		
											}	
										}
									%>	
									</tr>
								<%	
									}
								%>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<%	
		}
	%>
  </body>
</html>
