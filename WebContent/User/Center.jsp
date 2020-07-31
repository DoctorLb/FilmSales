<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.userServer.UserServer"%>
<%@page import="com.entity.Film"%>
<%@page import="com.entity.FilmShow"%>
<%@page import="com.entity.HaiBao"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>介绍</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
		.span{
			position: absolute;top: 90px;border: 1px gray solid;width: 85px;height: 30px;
			background-color: gray;
		}
		.td1{
			width: 85px;height: 30px;background-color: gray;
		}
		.td2{
			width: 85px;height: 30px;
		}
		.div8{
			position: absolute;top: 190px;left:515px;width: 10px;height: 15px;
			background-color: white;border: 1px green solid;
		}
		.div88{
			position: absolute;top: 190px;left:515px;width: 10px;height: 15px;
			background-color: green;border: 1px green solid;
		}
		.div9{
			position: absolute;top: 190px;left:540px;width: 10px;height: 15px;
			background-color: white;border: 1px green solid;
		}
		.div99{
			position: absolute;top: 190px;left:540px;width: 10px;height: 15px;
			background-color: green;border: 1px green solid;
		}
		.div10{
			position: absolute;top: 190px;left:565px;width: 10px;height: 15px;
			background-color: white;border: 1px green solid;
		}
		.div11{
			position: absolute;top: 190px;left:565px;width: 10px;height: 15px;
			background-color: green;border: 1px green solid;
		}
	</style>
	<script type="text/javascript">
		var num = 1;
		function TimeShow(){
			if(num<3){
				num++;
				if(num==2){
					show6();
				}else if(num==3){
					show7();
				}
			}else{
				num=1;
				show5();
			}
			setTimeout("TimeShow()", 3000);
		}
		function divShow(num){
			if(num==1){
				document.getElementById("td1").className="td1";
				document.getElementById("td2").className="td2";
				document.getElementById("div3").style.display="block";
				document.getElementById("div4").style.display="none";
			}else if(num==2){
				document.getElementById("td1").className="td2";
				document.getElementById("td2").className="td1";
				document.getElementById("div4").style.display="block";
				document.getElementById("div3").style.display="none";
			}
		}
		function show5(){
			document.getElementById("div5").style.display="block"
			document.getElementById("div6").style.display="none"
			document.getElementById("div7").style.display="none"
			document.getElementById("div8").className="div88"
			document.getElementById("div9").className="div9"
			document.getElementById("div10").className="div10"
		}
		function show6(){
			document.getElementById("div5").style.display="none"
			document.getElementById("div6").style.display="block"
			document.getElementById("div7").style.display="none"
			document.getElementById("div8").className="div8"
			document.getElementById("div9").className="div99"
			document.getElementById("div10").className="div10"
		}
		function show7(){
			document.getElementById("div5").style.display="none"
			document.getElementById("div6").style.display="none"
			document.getElementById("div7").style.display="block"
			document.getElementById("div8").className="div8"
			document.getElementById("div9").className="div9"
			document.getElementById("div10").className="div11"
		}
	</script>
  </head>
  
  <body onload="TimeShow()">
    <% 
    	UserServer us = new UserServer(); 
  		ArrayList<HaiBao> list1 = us.selFilmHaiBao();
  	%>
  <table style="position: absolute;top:135px;height: 180px;width: 580px;">
  	<tr>
  		<td>
  			<div id="div5" style="position: absolute;top:3px;display: block;" >
  				<a href="../SelectFilmById?filmId=<%=list1.get(0).getFilmId().getFilmId() %>">
  					<img src="../<%=list1.get(0).getHaibao() %>" height="215" width="580"/>	
  				</a>	
  			</div>
  			<div id="div6" style="top:3px;display: none;" >
  				<a href="../SelectFilmById?filmId=<%=list1.get(1).getFilmId().getFilmId() %>">
  					<img src="../<%=list1.get(1).getHaibao() %>" height="215" width="580"/>
  				</a>	
  			</div>
  			<div id="div7" style="position: absolute;top:3px;display: none;" >
  				<a href="../SelectFilmById?filmId=<%=list1.get(2).getFilmId().getFilmId() %>">
  					<img src="../<%=list1.get(2).getHaibao() %>" height="215" width="580"/>
  				</a>	
  			</div>
  			<div id="div8" class="div88">
  				<a href="javascript:show5()" style="text-decoration: none;"><font color="blue" size="2">1</font></a>
 		    </div>
 		    <div id="div9" class="div9">
  				<a href="javascript:show6()" style="text-decoration: none;"><font color="blue" size="2">2</font></a>
 		    </div>
 		    <div id="div10" class="div10">
  				<a href="javascript:show7()" style="text-decoration: none;"><font color="blue" size="2">3</font></a>
 		    </div>
  		</td>
  	</tr>
  </table>
  <table cellpadding="0" cellspacing="0" style="position: absolute;top:370px;height: 40px;">
  	<tr>
  		<td id="td1" class="td1">
  			<a href="javascript:divShow(1)" style="text-decoration: none;">正在热映</a>
		</td>
  		<td id="td2" class="td2">
  			<a href="javascript:divShow(2)" style="text-decoration: none;">即将上映</a>
  		</td>
  		<td width="330"></td>
  		<td><a href="../CurrentServlet">查看更多</a></td>
  	</tr>
  </table>
  <div id="div3" style="position: absolute;top:400px;background-color: #CCC;width: 580px;height: 500px;display:block;">
  	<table style="position: absolute;top:0px;background-color: gray; ">
		<%
	 		ArrayList<FilmShow> list2 = us.selFilmAdminShow(); //获得网站推荐的正在上映的电影的信息
	 		//out.write(list.size());
	 		if(list2.size()>0){
	 			for(int i=0;i<3;i++){
	 	%>
	 		<tr>
	 		<% 
	 			for(int j=2*i;j<2*i+2;j++){
	 				FilmShow film = list2.get(j);
	 		%>
	 			<td>
	 				<table>
	 					<tr>
	 						<td width="120" height="160"><a href="../SelectFilmById?filmId=<%=film.getFilmId().getFilmId()%>"><img style="height: 162;width: 124px;" src="../<%=film.getFilmId().getFilmImg() %>"/></a></td>
	 						<td width="170" height="160">
	 							<table>
	 								<tr><td><%=film.getFilmId().getFilmName() %></td></tr>
	 								<tr><td>导演:<%=film.getFilmId().getDirector() %></td></tr>
	 								<tr><td>主演:<%=film.getFilmId().getActor() %></td></tr>
	 								<tr><td>类型:<%=film.getFilmId().getFilmType() %></td></tr>
	 								<tr><td>片长:<%=film.getFilmId().getFilmLong() %></td></tr>
	 								<tr><td>价格:<%=film.getFilmPrice() %>
	 								<a href="../SelectFilmById?filmId=<%=film.getFilmId().getFilmId()%>">立即订购</a></td></tr>
	 							</table>
	 						</td>
	 					</tr>
	 				</table>
	 			</td>
	 		<% 	
	 			}
	 		%>
	 		</tr> 
	 	<%			
	 			}
	 		}
	 	%>
	</table> 
    </div>
    <div id="div4" style="position: absolute;top:400px;background-color: gray;width: 580px;height: 550px;display: none;">
  	<table style="position: absolute;top:0px;background-color: gray; ">
		<% 
	 		UserServer us1 = new UserServer();
	 		ArrayList<Film> list3 = us.selFilmAdminWill(); //获得网站推荐的即将上映的电影的信息
	 		//out.write(list.size());
	 		if(list1.size()>0){
	 			for(int i=0;i<3;i++){
	 	%>
	 		<tr>
	 		<% 
	 			for(int j=2*i;j<2*i+2;j++){
	 				Film film = list3.get(j);
	 		%>
	 			<td>
	 				<table>
	 					<tr>
	 						<td width="120" height="180"><a href="../SelectFilmById?filmId=<%=film.getFilmId()%>"><img style="height: 162;width: 124px;" src="../<%=film.getFilmImg() %>"/></a></td>
	 						<td width="170" height="180">
	 							<table>
	 								<tr><td><%=film.getFilmName() %></td></tr>
	 								<tr><td>导演:<%=film.getDirector() %></td></tr>
	 								<tr><td>主演:<%=film.getActor() %></td></tr>
	 								<tr><td>类型:<%=film.getFilmType() %></td></tr>
	 								<tr><td>片长:<%=film.getFilmLong() %></td></tr>
	 								<tr><td>具体信息请查看详情</td></tr>
	 							</table>
	 						</td>
	 					</tr>
	 				</table>
	 			</td>
	 		<% 	
	 			}
	 		%>
	 		</tr> 
	 	<%			
	 			}
	 		}
	 	%>
	</table> 
  </div>
  <script type="text/javascript">
  		
  </script>			  
  </body>
</html>
