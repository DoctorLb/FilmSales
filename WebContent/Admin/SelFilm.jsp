<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.entity.Film"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'SelFilm.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript">
		var v =3; 
		function setValues(id){
			<%--v是选择的电影状态--%>
			 v = document.getElementById(id).value;
		}
		function ser(filmId){
			if(v==3){
				alert("请选择电影状态");
			}else{			
				window.location="../UpdState?biaoshiS="+v+"&filmId="+filmId;	
			}	
		}
		function yn(){
			if(document.getElementById("check1").checked){
				return true;
			}else{
				return false;
			}
		}
	</script>
	<style type="text/css">
	table{
		border-color: gray;
	}
	 td{
	 	border-color: gray;
	 }
	 a{
	 	color: blue;
	 }
	</style>

  </head>
  
  <body style="background-color:lightgray">
   	<% 	
   	Object denglu=session.getAttribute("denglu");
  	if(denglu==null){
  		response.sendRedirect("faileLogin.jsp");
  	}else{
	   	Object obj3=session.getAttribute("biaoshi3");
	   	Object objNoFound=session.getAttribute("noFoundBiaoShi");
	   	if(obj3!=null){
	   		session.removeAttribute("biaoshi3");
	   		if(objNoFound!=null){
		   		%>
			   	<form action="../UpdState" method="post" onsubmit="return yn()">
				  	 <% 
				    ArrayList<Film> list=(ArrayList<Film>)session.getAttribute("list");
					%>
					<table cellpadding="0" cellspacing="0" border="1" width="800px;" style="position: absolute;left: 0px;top:40px;border-style: solid;">
						<tr>
							<td>电影名</td>
							<td>导演</td>
							<td>主演</td>							
							<td>状态</td>
							<td colspan="3">操作</td>
						</tr>
						<% 
						for(int i=0;i<list.size();i++){
							%>
							<tr style="width: 100px;">
								<%
								String state="";
								int filmState=list.get(i).getFilmState();
								if(filmState==2){
									state="未上映";
								}else if(filmState==0){
									state="正在上映";
								}else if(filmState==1){
									state="即将上映";
								}
								%>							
								<td><%=list.get(i).getFilmName() %></td>
								<td><%=list.get(i).getDirector() %></td>
								<td><%=list.get(i).getActor()%></td>								
								<td><%=state %></td>																						
									<td align="center"><input type="checkbox" id="check1" name="check1" value="<%=list.get(i).getFilmId() %>"></td>
									<td align="center"><select name="xz1" id="<%=1000*i %>" onchange="setValues(<%=1000*i %>)" style="background-color: gray">
										<option value="3">--请 选 择--</option>
										<option value="1">即将上映</option>
										<option value="0">正在上映</option>
										<option value="2">未上映</option>
									</select></td>
									<td align="center"><a href="javascript:ser('<%=list.get(i).getFilmId() %>')">修改状态</a></td>
														
							</tr>
							<%
						}
						%>
					</table>
					<select name="xz2" style="background-color: gray">
					<option>--请选择--</option>
		  			<option>即将上映</option>
		  			<option>正在热映</option>
		  			<option>未上映</option>
			  		</select>
			  		<input type="submit" value="修改选中电影的状态">
			  	</form>
		   		<%
		   		
	   		}else{
	   			%>
	   			<div style="position: absolute;left:300px;top:160px"><font color="red">没有查到相关信息！</font></div>
	   			<%
	   		}
	   		session.removeAttribute("biaoshi3");
	   	}else{
	   		%>
	   		<form action="../SelFilm" method="post">
		    	<div style="position: absolute;left:280px;top: 100px;">
		    		<select name="xz" style="background-color: gray">
		    		<option>按电影名</option>
		    		<option>查询所有</option>
			    	</select>
			    	<input type="text" name="txtFilm">
			    	<input type="submit" value="搜索">
		    	</div>
		    </form>
	   		<% 
	   	}
   	}
   	%>
  </body>
</html>
